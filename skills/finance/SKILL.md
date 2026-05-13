# Finance Team Skill

한국 개인사업자(스마트스토어, Shopify, SNS 콘텐츠, 웹앱 제작)를 위한 재무 관리 팀 스킬.

## 트리거

다음 요청 시 이 스킬을 사용합니다:
- 송장/영수증 처리
- 세금계산서 검증
- 경비 정산/분류
- 미수금/정산 추적
- 재무 분석, 수익/비용 분석
- 현금흐름 예측
- 손익계산서, 재무 보고서
- 부가세/종합소득세 자료 정리
- ROAS, 마진율, ROI 계산

## 팀 구성

```
fin-director (opus, purple)          ← 오케스트레이터 (사용자 접점)
    ├── fin-ap-processor (sonnet)    ← 매입 처리
    ├── fin-expense-reviewer (sonnet) ← 경비 정산
    ├── fin-ar-manager (sonnet)      ← 매출채권 관리
    ├── fin-fp-analyst (sonnet)      ← 재무 분석/예측
    ├── fin-report-generator (sonnet) ← 보고서 생성
    └── fin-compliance-reviewer (sonnet, red) ← 최종 검증 (PASS/FAIL)
```

## 워크플로우

```
사용자 요청
    ↓
fin-director (입력 분류 및 라우팅)
    ↓
[병렬 처리 가능]
    ├── 매입: fin-ap-processor
    ├── 경비: fin-expense-reviewer
    ├── 수금: fin-ar-manager
    ├── 분석: fin-fp-analyst
    └── 보고: fin-report-generator
    ↓
fin-compliance-reviewer (모든 산출물 검증)
    ├── PASS → 사용자에게 전달
    └── FAIL → 해당 에이전트 재처리 (최대 2회)
```

## 한국 세무 특성

- **부가세**: 과세 매출/매입 10% 분리 추적, 1기(7/25)/2기(1/25) 신고
- **세금계산서**: 필수 항목 검증 (공급자 번호, 공급가액, 세액, 날짜)
- **종합소득세**: 5월 신고, 경비 증빙 관리
- **증빙 원칙**: 3만원 초과 거래는 정규 증빙 의무

## 사용 방법

```
/fin [요청 내용]
예: /fin 이번 달 매출 분석해줘
예: /fin 이 세금계산서 검토해줘
예: /fin 부가세 신고 자료 정리해줘
```

또는 자연어로:
- "이 송장 처리해줘"
- "3월 손익계산서 만들어줘"
- "광고비 대비 수익 분석해줘"

## 에이전트 호출 규칙

- **fin-director만** 다른 에이전트를 호출할 수 있습니다
- 세부 에이전트는 fin-director의 위임으로만 실행됩니다
- 모든 재무 산출물은 fin-compliance-reviewer 검증 후 전달됩니다

## 출력 형식

- 금액: 원화(₩) 기본, 외화는 원화 환산 병기
- 부가세 포함/제외 명확히 구분
- 표 형식으로 수치 정리
- 세무 체크포인트 포함
