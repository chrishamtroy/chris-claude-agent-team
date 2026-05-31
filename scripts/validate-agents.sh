#!/usr/bin/env bash
# validate-agents.sh — 에이전트 frontmatter 정합성 검증 (bkit식 에이전트 동작 테스트 인프라)
#
# 검사 항목:
#   1. 필수 필드 존재: name, model, tools, description
#   2. model 값 유효성: opus / sonnet / haiku / inherit
#   3. name == 파일명(.md 제외)
#   4. 중복 name 검사
#
# 사용: bash validate-agents.sh [AGENTS_DIR]   (기본: ~/claude-forge/agents)
# 종료 코드: 0 = 전부 PASS, 1 = 하나라도 FAIL
set -uo pipefail

AGENTS_DIR="${1:-$HOME/claude-forge/agents}"
VALID_MODELS="opus sonnet haiku inherit"

if [ ! -d "$AGENTS_DIR" ]; then
  echo "❌ 디렉토리 없음: $AGENTS_DIR" >&2
  exit 1
fi

fail=0
count=0
declare -a seen_names=()

# frontmatter(첫 번째 ---~두 번째 ---)에서 키 값 추출
field() {
  awk -v key="$1" '
    /^---[[:space:]]*$/ { c++; next }
    c==1 {
      # "key:" 로 시작하는 첫 줄의 값 반환 (앞뒤 공백/따옴표 제거, 인라인 주석 제거)
      if ($0 ~ "^"key":[[:space:]]") {
        sub("^"key":[[:space:]]*", "")
        sub(/[[:space:]]*#.*$/, "")
        gsub(/^[[:space:]"'"'"']+|[[:space:]"'"'"']+$/, "")
        print
        exit
      }
    }
    c>=2 { exit }
  ' "$2"
}

for f in "$AGENTS_DIR"/*.md; do
  [ -e "$f" ] || continue
  count=$((count+1))
  base="$(basename "$f" .md)"
  errs=()

  name="$(field name "$f")"
  model="$(field model "$f")"
  tools="$(field tools "$f")"
  desc="$(field description "$f")"

  # 1. 필수 필드
  [ -z "$name" ]  && errs+=("name 누락")
  [ -z "$model" ] && errs+=("model 누락")
  [ -z "$tools" ] && errs+=("tools 누락")
  [ -z "$desc" ]  && errs+=("description 누락")

  # 2. model 유효성
  if [ -n "$model" ] && ! printf '%s\n' $VALID_MODELS | grep -qx "$model"; then
    errs+=("model 값 무효: '$model' (허용: $VALID_MODELS)")
  fi

  # 3. name == 파일명
  if [ -n "$name" ] && [ "$name" != "$base" ]; then
    errs+=("name '$name' != 파일명 '$base'")
  fi

  # 4. 중복 name
  if [ -n "$name" ]; then
    for s in "${seen_names[@]:-}"; do
      [ "$s" = "$name" ] && errs+=("중복 name: '$name'")
    done
    seen_names+=("$name")
  fi

  if [ ${#errs[@]} -eq 0 ]; then
    : # PASS (조용히)
  else
    fail=$((fail+1))
    printf '❌ %s\n' "$base"
    for e in "${errs[@]}"; do printf '     - %s\n' "$e"; done
  fi
done

echo "────────────────────────────────────────"
if [ "$fail" -eq 0 ]; then
  echo "✅ 전체 $count개 에이전트 frontmatter PASS"
  exit 0
else
  echo "❌ $fail/$count개 에이전트 FAIL"
  exit 1
fi
