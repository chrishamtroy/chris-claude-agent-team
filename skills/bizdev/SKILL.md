---
name: bizdev
description: |
  사업개발 파이프라인. 신규 수익 기회 탐색, 파트너십 발굴, 경쟁사 분석, 제안서/피치덱 작성 시 활성화.
  bd-orchestrator가 요청 유형에 따라 opportunity-hunter → roi-calculator → competitor-tracker → proposal-architect → pitch-writer 순으로 조율.
  쇼핑몰/콘텐츠/웹개발 3개 수익 축과의 시너지 기반 의사결정.
argument-hint: '[요청 유형: opportunity|partnership|competitor|proposal|pitch] [주제/키워드]'
---

# /bizdev 스킬 — 사업개발 파이프라인

## 개요

```
입력: /bizdev [요청 유형] [주제/키워드]

[요청 유형별 파이프라인]

opportunity (신사업 탐색):
  bd-opportunity-hunter → bd-roi-calculator → bd-proposal-architect

partnership (파트너십):
  bd-opportunity-hunter → bd-partnership-manager → bd-roi-calculator → bd-proposal-architect

competitor (경쟁사 분석):
  bd-competitor-tracker (단독)

pitch (피치/발표 자료):
  (proposal 파일 있을 때) bd-pitch-writer (단독)
  (없을 때) bd-proposal-architect → bd-pitch-writer

full (전체 파이프라인):
  bd-opportunity-hunter → bd-roi-calculator → bd-competitor-tracker
  → bd-proposal-architect → bd-pitch-writer
```

## 파라미터

| 파라미터 | 기본값 | 설명 |
|---------|--------|------|
| 요청 유형 | opportunity | opportunity / partnership / competitor / proposal / pitch / full |
| 주제/키워드 | (필수) | 탐색할 사업 주제, 경쟁사명, 파트너명 등 |
| --audience | investor | investor / partner / customer / internal |
| --budget | 미지정 | 초기 투자 예산 범위 (예: 100만원 이하) |

## Phase 0: 초기화

```bash
mkdir -p /tmp/bizdev
echo "BizDev pipeline started: $(date)" > /tmp/bizdev/pipeline.log
```

컨텍스트 파일 생성:
```bash
cat > /tmp/bizdev/context.md << 'EOF'
# 사업개발 컨텍스트
- 요청 유형: [유형]
- 주제: [주제]
- 현재 수익 축:
  1. 쇼핑몰: 스마트스토어 + Shopify (국내/글로벌)
  2. 콘텐츠: SNS + 유튜브 + 강의
  3. 웹개발: 웹앱/랜딩페이지 B2B
- 타겟 청중: [investor/partner/customer/internal]
- 예산 범위: [예산]
EOF
```

## 파이프라인: opportunity (신사업 탐색)

### Step 1: 기회 탐색
`bd-opportunity-hunter` 활성화:
```
context.md를 읽고:
1. 시장 Gap 분석 및 신사업 기회 발굴
2. 3개 수익 축과의 시너지 평가
3. /tmp/bizdev/opportunity-report.md 생성
```

### Step 2: 타당성 분석
`bd-roi-calculator` 활성화:
```
opportunity-report.md를 읽고:
1. Top 3 기회에 대한 ROI 분석
2. /tmp/bizdev/roi-analysis-[사업명].md 생성
```

### Step 3: 사업 기획서
`bd-proposal-architect` 활성화:
```
opportunity-report.md와 roi-analysis 파일을 읽고:
1. 가장 유망한 기회에 대한 사업 기획서 작성
2. /tmp/bizdev/proposal-internal-[날짜].md 생성
```

## 파이프라인: partnership (파트너십)

### Step 1: 파트너 발굴
`bd-opportunity-hunter` (파트너십 관점으로) 활성화

### Step 2: 파트너십 관리
`bd-partnership-manager` 활성화:
```
기회 보고서를 읽고:
1. 파트너 프로파일 및 평가
2. 협업 구조 설계
3. /tmp/bizdev/partnership-[파트너명].md 생성
```

### Step 3: 시너지 수치화
`bd-roi-calculator` 활성화 (파트너십 ROI 분석)

### Step 4: 파트너십 제안서
`bd-proposal-architect` 활성화 (--audience partner)

## 파이프라인: competitor (경쟁사 분석)

`bd-competitor-tracker` 단독 활성화:
```
context.md를 읽고:
1. 지정된 경쟁사(들) 분석
2. /tmp/bizdev/competitor-report-[날짜].md 생성
3. 차별화 기회 및 즉시 실행 권고 포함
```

## 파이프라인: pitch (피치 자료)

### 기존 proposal 파일이 있을 때
`bd-pitch-writer` 직접 활성화:
```
/tmp/bizdev/ 의 proposal 파일을 읽고:
1. 청중 유형에 맞는 피치 자료 작성
2. /tmp/bizdev/pitch-[type]-[사업명].md 생성
```

### proposal 파일이 없을 때
1. `bd-proposal-architect`로 기획서 먼저 작성
2. 이후 `bd-pitch-writer` 활성화

## 의사결정 프레임워크

bd-orchestrator가 모든 결과물을 통합하여 최종 권고:

```
## 최종 Go/No-Go 판정 기준

Go 조건 (모두 충족):
- 3개 수익 축 중 2개 이상 시너지
- 3개월 내 첫 수익 가능
- ROI 보수적 시나리오 기준 손익분기 12개월 이내

조건부 Go:
- 1개 수익 축 시너지
- 선결 조건 2개 이하

No-Go:
- 수익 축 시너지 없음
- 손익분기 24개월 초과
- 법적/규제 리스크 높음
```

## 산출물

| 파일 | 위치 | 생성 단계 |
|------|------|---------|
| opportunity-report.md | /tmp/bizdev/ | opportunity 파이프라인 |
| roi-analysis-[사업명].md | /tmp/bizdev/ | ROI 분석 단계 |
| competitor-report-[날짜].md | /tmp/bizdev/ | competitor 파이프라인 |
| partnership-[파트너명].md | /tmp/bizdev/ | partnership 파이프라인 |
| proposal-[type]-[날짜].md | /tmp/bizdev/ | proposal 단계 |
| pitch-[type]-[사업명].md | /tmp/bizdev/ | pitch 단계 |

## 에러 처리

| 상황 | 대응 |
|------|------|
| 정보 부족 | 해당 에이전트가 추가 조사 후 재시도 |
| ROI 계산 불가 | 가정 명시 후 범위로 제시 |
| 파트너 정보 없음 | 공개 정보 기반 프로파일 작성 |

## 관련 에이전트

| 에이전트 | 역할 | 모델 |
|--------|------|------|
| bd-orchestrator | 파이프라인 총괄 | opus |
| bd-opportunity-hunter | 신사업 기회 탐색 | sonnet |
| bd-proposal-architect | 사업 기획서 작성 | sonnet |
| bd-competitor-tracker | 경쟁사 모니터링 | sonnet |
| bd-partnership-manager | 파트너십 관리 | sonnet |
| bd-roi-calculator | 타당성 분석 | sonnet |
| bd-pitch-writer | 피치덱 작성 | sonnet |
