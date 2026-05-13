# Admin Team Skill

1인 창업자 CEO실을 지원하는 경영지원 팀 스킬.

## 트리거

다음 요청 시 이 스킬을 사용합니다:
- 일정 관리, 미팅 조율, 마감일 확인
- 계약서, 제안서, 공문, 회의록 작성
- 외주/프리랜서 견적 비교, 벤더 관리
- KPI 대시보드, 성과 지표 추적
- 프로젝트 진행 상황 확인, 로드맵 작성
- 이용약관/계약서 리스크 체크
- 주간/월간 경영 현황 보고서
- CEO 브리핑 자료

## 팀 구성

```
adm-orchestrator (sonnet, purple)     ← 오케스트레이터 (사용자 접점)
    ├── adm-schedule-manager (haiku)  ← 일정 관리
    ├── adm-document-manager (sonnet) ← 문서 작성
    ├── adm-vendor-manager (sonnet)   ← 벤더/외주 관리
    ├── adm-kpi-tracker (sonnet)      ← KPI 모니터링
    ├── adm-project-manager (sonnet)  ← 프로젝트 관리
    ├── adm-legal-assistant (sonnet, yellow) ← 법무 검토
    └── adm-report-compiler (sonnet)  ← 경영 보고서
```

## 워크플로우

```
사용자 요청
    ↓
adm-orchestrator (요청 분류 및 우선순위 판단)
    ↓
단순 요청: 단일 에이전트 위임
복합 요청: 병렬/순차 처리
    ├── 일정: adm-schedule-manager
    ├── 문서: adm-document-manager
    ├── 벤더: adm-vendor-manager
    ├── KPI: adm-kpi-tracker
    ├── 프로젝트: adm-project-manager
    ├── 법무: adm-legal-assistant
    └── 보고서: adm-report-compiler
    ↓
통합 결과 → 사용자 보고
```

## 우선순위 프레임워크

| 레벨 | 기준 | 예시 |
|------|------|------|
| P1 (즉시) | 오늘 마감, 계약 대기 | 계약서 서명, 긴급 법무 검토 |
| P2 (오늘) | 미팅 준비, 제안서 | 클라이언트 미팅 자료 |
| P3 (이번 주) | 정기 보고, KPI | 주간 보고서, 벤더 평가 |
| P4 (이번 달) | 전략, 정책 | 로드맵, 이용약관 업데이트 |

## 사용 방법

```
/adm [요청 내용]
예: /adm 이번 주 일정 정리해줘
예: /adm 외주 계약서 초안 만들어줘
예: /adm 이번 달 KPI 대시보드 만들어줘
예: /adm 이 계약서 리스크 체크해줘
```

또는 자연어로:
- "월간 경영 보고서 만들어줘"
- "프리랜서 3명 견적 비교해줘"
- "이번 주 마감 뭐 있어?"

## 에이전트 호출 규칙

- **adm-orchestrator만** 다른 에이전트를 호출할 수 있습니다
- 세부 에이전트는 adm-orchestrator의 위임으로만 실행됩니다

## 주요 제약

- **법무**: adm-legal-assistant는 검토/플래그만 수행, 법률 조언 불가
- **계약**: 문서 초안 제공, 법적 효력은 전문가 검토 필요
- **KPI**: 입력 데이터 기반, 데이터 없는 항목은 [미입력] 표시
- **일정**: 캘린더 직접 수정 불가, Google Calendar 텍스트 생성 후 사용자 확인

## 출력 형식

- 결론 먼저, 세부 내용 나중
- 액션 아이템은 명확한 담당자/기한 포함
- KPI 보고서: 목표 대비 실적 비교 (✅/⚠️/❌)
- 문서: 초안 + "법률 조언 아님" 고지
