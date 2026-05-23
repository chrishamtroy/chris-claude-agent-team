#!/bin/bash
# notify-on-idle.sh
# Claude가 응답 대기 상태(Stop) 또는 사용자 입력 필요(Notification)에 들어가면
# macOS 알림 + 시스템 사운드를 재생한다.
#
# 등록: settings.json hooks.Stop / hooks.Notification
# 알림: terminal-notifier 우선, 없으면 osascript fallback

set -u

# stdin JSON에서 이벤트 타입과 메시지 추출 (있을 경우)
EVENT_JSON="$(cat 2>/dev/null || true)"
HOOK_EVENT="$(printf '%s' "$EVENT_JSON" | /usr/bin/python3 -c 'import sys,json;d=json.loads(sys.stdin.read() or "{}");print(d.get("hook_event_name",""))' 2>/dev/null || true)"
MESSAGE="$(printf '%s' "$EVENT_JSON" | /usr/bin/python3 -c 'import sys,json;d=json.loads(sys.stdin.read() or "{}");print(d.get("message",""))' 2>/dev/null || true)"

case "$HOOK_EVENT" in
  Notification)
    TITLE="Claude Code"
    SUBTITLE="입력 필요"
    BODY="${MESSAGE:-Claude가 입력을 기다리고 있습니다.}"
    ;;
  Stop|*)
    TITLE="Claude Code"
    SUBTITLE="응답 완료"
    BODY="응답이 완료되었습니다. 다음 지시를 기다립니다."
    ;;
esac

# 시스템 사운드 비동기 재생
/usr/bin/afplay /System/Library/Sounds/Glass.aiff >/dev/null 2>&1 &

# 알림: terminal-notifier 우선 (자체 번들 ID → 권한 안정적), 없으면 osascript fallback
NOTIFIER="$(command -v terminal-notifier || true)"
if [ -n "$NOTIFIER" ]; then
  "$NOTIFIER" \
    -title "$TITLE" \
    -subtitle "$SUBTITLE" \
    -message "$BODY" \
    -sender com.anthropic.claude-code \
    -group "claude-code-idle" \
    -ignoreDnD >/dev/null 2>&1 &
else
  /usr/bin/osascript -e "display notification \"${BODY//\"/\\\"}\" with title \"${TITLE}\" subtitle \"${SUBTITLE}\"" >/dev/null 2>&1 &
fi

exit 0
