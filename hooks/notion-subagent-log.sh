#!/usr/bin/env bash
# SubagentStop → Notion 작업로그 logger
# 서브에이전트가 끝날 때마다 노션 '작업로그' DB에 1행을 추가한다.
#
# 원칙:
#  - Fail-silent: 항상 exit 0. 어떤 실패도 세션을 막지 않는다.
#  - No secrets in repo: 토큰은 런타임에 ~/.claude/notion/token 에서만 읽는다.
#  - 미설정(토큰/config 없음)이면 조용히 아무것도 안 함.
#  - HTTP는 curl 사용(macOS 시스템 인증서 → Python urllib SSL 문제 회피).
#
# Input (stdin JSON, SubagentStop): { "subagent_name", "exit_status", "session_id" }
#  (transcript_path 등은 버전에 따라 없을 수 있어 방어적으로 처리)
set -uo pipefail

NOTION_DIR="${HOME}/.claude/notion"
TOKEN_FILE="${NOTION_DIR}/token"
CONFIG_FILE="${NOTION_DIR}/config.json"
ERR_LOG="${NOTION_DIR}/error.log"
REQ_FILE="${NOTION_DIR}/.notion-req.json"

INPUT=$(cat)

# 연동 비활성(토큰/설정 없음) → 무해하게 종료
[ -s "$TOKEN_FILE" ]  || exit 0
[ -s "$CONFIG_FILE" ] || exit 0

# 롤아웃 검증용: 실제 들어온 페이로드를 남겨 둔다(매번 덮어씀)
printf '%s' "$INPUT" > "${NOTION_DIR}/last-payload.json" 2>/dev/null || true

export NOTION_INPUT="$INPUT"
export NOTION_HOME="$NOTION_DIR"
export NOTION_REQ="$REQ_FILE"

# 1) Python: 페이로드 파싱 + 노션 요청 바디 생성 (네트워크 호출 없음)
python3 <<'PYEOF' 2>>"$ERR_LOG" || true
import os, json, time
from datetime import datetime, timezone

home = os.environ["NOTION_HOME"]

def read(path):
    try:
        with open(path) as f:
            return f.read().strip()
    except Exception:
        return ""

cfg = json.loads(read(os.path.join(home, "config.json")) or "{}")
db_id = cfg.get("activity_db_id")
if not db_id:
    raise SystemExit(0)
rel_prop = cfg.get("relation_prop", "프로젝트")

try:
    d = json.loads(os.environ.get("NOTION_INPUT", "") or "{}")
except Exception:
    d = {}

name = d.get("subagent_name") or d.get("subagent_type") or "unknown-agent"
status_raw = (d.get("exit_status") or d.get("status") or "").lower()
status = "실패" if status_raw in ("failure", "error", "failed") else "완료"
session = d.get("session_id", "")

duration = "n/a"
try:
    marker = os.path.expanduser(f"~/.claude/logs/subagent-{name}.start")
    if os.path.exists(marker):
        with open(marker) as f:
            duration = f"{int(time.time()) - int(f.read().strip())}s"
except Exception:
    pass

summary = ""
tp = d.get("transcript_path")
if tp and os.path.exists(tp):
    try:
        last = ""
        with open(tp) as f:
            for line in f:
                try:
                    obj = json.loads(line)
                except Exception:
                    continue
                msg = obj.get("message") or obj
                if obj.get("type") == "assistant" or msg.get("role") == "assistant":
                    content = msg.get("content")
                    if isinstance(content, list):
                        for c in content:
                            if isinstance(c, dict) and c.get("type") == "text":
                                last = c.get("text", last)
                    elif isinstance(content, str):
                        last = content
        summary = last.strip()[:500]
    except Exception:
        summary = ""
if not summary:
    summary = f"{name} {'작업 완료' if status == '완료' else '작업 실패'}"

now = datetime.now(timezone.utc).astimezone().isoformat(timespec="seconds")
first_line = summary.splitlines()[0] if summary else name
title = f"{name} — {first_line}"[:200]

props = {
    "작업명":   {"title": [{"text": {"content": title}}]},
    "에이전트": {"select": {"name": name[:100]}},
    "상태":     {"select": {"name": status}},
    "소요시간": {"rich_text": [{"text": {"content": duration}}]},
    "시각":     {"date": {"start": now}},
    "요약":     {"rich_text": [{"text": {"content": summary[:1900]}}]},
    "세션":     {"rich_text": [{"text": {"content": session[:200]}}]},
}

active = read(os.path.join(home, "active-project"))
if active:
    props[rel_prop] = {"relation": [{"id": active}]}

body = {"parent": {"database_id": db_id}, "properties": props}
with open(os.environ["NOTION_REQ"], "w") as f:
    json.dump(body, f, ensure_ascii=False)
PYEOF

# 2) curl: 요청 바디가 있으면 노션에 POST (시스템 인증서 사용)
[ -s "$REQ_FILE" ] || exit 0
TOKEN=$(cat "$TOKEN_FILE")
VERSION=$(python3 -c "import json,sys;print(json.load(open('${CONFIG_FILE}')).get('notion_version','2022-06-28'))" 2>/dev/null || echo "2022-06-28")

HTTP=$(curl -sS --max-time 8 -o "${NOTION_DIR}/.notion-resp.json" -w '%{http_code}' \
  -X POST "https://api.notion.com/v1/pages" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Notion-Version: ${VERSION}" \
  -H "Content-Type: application/json" \
  --data-binary @"${REQ_FILE}" 2>>"$ERR_LOG") || HTTP="000"

if [ "$HTTP" != "200" ]; then
  printf '%s notion-log HTTP %s: %s\n' "$(date -u +%FT%TZ)" "$HTTP" \
    "$(head -c 400 "${NOTION_DIR}/.notion-resp.json" 2>/dev/null)" >> "$ERR_LOG"
fi

rm -f "$REQ_FILE"
exit 0
