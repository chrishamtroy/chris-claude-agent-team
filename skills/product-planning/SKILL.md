---
name: product-planning
description: Cross-functional 제품 기획팀을 시뮬레이션하여 글로벌 SaaS 수준의 기획 산출물을 만드는 스킬. 사용자가 "기획해 줘", "PRD 만들어 줘", "제품 전략", "기능 명세", "유저 플로우", "MVP 기획", "출시 계획", "사용자 리서치", "비즈니스 모델 분석"을 요청하거나 새 프로덕트/SaaS/앱 아이디어를 던질 때 반드시 사용하세요. Market Research → Discovery → PRD/TRD → Feature Spec → User Flow → Launch & Measurement까지 6단계로 진행하며, JTBD/RICE/North Star Framework/Working Backwards 등 글로벌 PM 방법론을 적용합니다.
---

# Product Planning Skill — Cross-functional 기획팀

> Stripe, Linear, Notion, Amazon 같은 글로벌 제품 회사의 기획 프로세스를 Claude 안에서 재현합니다.
> 매니페스트(Manyfast.io)의 한국식 핑퐁 워크플로우 + Silicon Valley PM 방법론을 결합했습니다.

---

## 핵심 철학

> **"PRD는 산출물이 아니라 사고의 결과물이다."**

이 스킬은 단순히 PRD 템플릿을 채우는 도구가 아닙니다. 시니어 PM이 어떻게 **추론**하고, 어떻게 **가설을 세우고**, 어떻게 **리스크를 발견**하는지를 단계마다 시뮬레이션합니다.

### 4가지 작동 원칙

1. **Hypothesis-driven** — 모든 기획은 검증 가능한 가설이어야 함. "이런 기능이 좋을 것 같아"가 아니라 "X 사용자 그룹에게 Y를 제공하면 Z 지표가 N% 개선될 것이다"
2. **Working Backwards** — 출시 후 결과물(보도자료, 메트릭)부터 역산. Amazon 방식
3. **First Principles** — 업계 관례가 아니라 본질부터 추론
4. **Cross-functional** — Product, UX, Engineering, Data, Marketing이 단일 PM의 머릿속이 아닌 별도 전문 에이전트로 협업

---

## 6단계 워크플로우

```
┌──────────────────────────────────────────────────────────────────┐
│  Stage 0: PRE-DISCOVERY (시장 & 사용자 리서치)                   │
│  ────────────────────────────────────────────                    │
│  • Market Sizing (TAM/SAM/SOM)                                   │
│  • Competitive Analysis (5 Forces, 포지셔닝 맵)                  │
│  • User Research (인터뷰, JTBD)                                  │
│  담당: product-strategist + ux-researcher                        │
├──────────────────────────────────────────────────────────────────┤
│  Stage 1: DISCOVERY (아이디어 증강)                              │
│  ────────────────────────────────────────────                    │
│  • 핑퐁 질문 → Problem/Solution 정의                             │
│  • Hypothesis 명시화                                             │
│  • Lean Canvas / Opportunity Solution Tree                       │
│  담당: requirements-analyst                                      │
├──────────────────────────────────────────────────────────────────┤
│  Stage 2: STRATEGY & PRD (전략 + 제품 요구사항)                  │
│  ────────────────────────────────────────────                    │
│  • Executive 1-pager (Working Backwards PR/FAQ)                  │
│  • PRD 18 섹션 (Privacy/i18n/Accessibility 포함)                 │
│  • RICE 스코어링                                                 │
│  담당: prd-writer                                                │
├──────────────────────────────────────────────────────────────────┤
│  Stage 3: TECHNICAL & FEATURE (기술 + 기능 명세)                 │
│  ────────────────────────────────────────────                    │
│  • TRD (시스템 아키텍처, API Contract, Data Model)               │
│  • Feature Spec (3-depth 트리, edge cases, state machines)       │
│  • Build vs Buy 결정                                             │
│  담당: feature-architect + technical-architect                   │
├──────────────────────────────────────────────────────────────────┤
│  Stage 4: UX & DESIGN (정보구조 + 유저 플로우)                   │
│  ────────────────────────────────────────────                    │
│  • Information Architecture                                      │
│  • User Flow (Mermaid + empty/error/loading states)              │
│  • Accessibility checklist                                       │
│  담당: ux-flow-designer                                          │
├──────────────────────────────────────────────────────────────────┤
│  Stage 5: LAUNCH & MEASUREMENT (출시 & 측정)                     │
│  ────────────────────────────────────────────                    │
│  • Go-to-Market Plan                                             │
│  • Analytics Plan (event taxonomy, North Star, funnel)           │
│  • A/B 실험 설계                                                 │
│  • Stakeholder Map + Launch checklist                            │
│  담당: data-analyst + launch-strategist                          │
└──────────────────────────────────────────────────────────────────┘
                            ↓
                [코딩 에이전트로 인계]
```

각 단계는 이전 단계 산출물을 강제로 참조하여 **맥락 정합성**을 유지합니다.

---

## 사용자 의도 라우팅

사용자 발화에 따라 시작 단계를 결정합니다:

| 사용자 발화 | 시작 단계 | 호출 에이전트 |
|------------|----------|--------------|
| "새 아이디어 있어, 기획 도와 줘" | Stage 0 또는 1 | chief-product-officer |
| "시장 조사부터 해줘" / "경쟁사 분석" | Stage 0 | product-strategist |
| "사용자 인터뷰 설계해줘" / "JTBD 도출" | Stage 0 | ux-researcher |
| "PRD 만들어 줘" + 아이디어 정리됨 | Stage 2 | prd-writer |
| "기술 설계서" / "TRD 작성" / "API 스펙" | Stage 3 | technical-architect |
| "기능 명세서 짜 줘" + PRD 있음 | Stage 3 | feature-architect |
| "유저 플로우 그려 줘" | Stage 4 | ux-flow-designer |
| "출시 계획" / "GTM" / "런칭" | Stage 5 | launch-strategist |
| "메트릭/KPI 설계" / "A/B 테스트" | Stage 5 | data-analyst |
| "전체 다 해줘" | Stage 0~5 | chief-product-officer가 오케스트레이션 |

---

## 작업 디렉토리 구조

스킬 실행 시 다음 구조를 만듭니다:

```
<project>-planning/
├── 00-market-research.md       # Stage 0
├── 00-competitive-analysis.md  # Stage 0
├── 00-user-research.md         # Stage 0 (인터뷰, JTBD)
├── 01-discovery.md             # Stage 1
├── 01-lean-canvas.md           # Stage 1
├── 02-one-pager.md             # Stage 2 (Exec 요약, PR/FAQ)
├── 02-prd.md                   # Stage 2 (메인 PRD)
├── 02-rice-prioritization.md   # Stage 2
├── 03-trd.md                   # Stage 3 (기술 요구사항)
├── 03-feature-spec.md          # Stage 3
├── 04-information-architecture.md  # Stage 4
├── 04-user-flow.md             # Stage 4
├── 05-launch-plan.md           # Stage 5 (GTM)
├── 05-analytics-plan.md        # Stage 5
├── 05-experimentation-plan.md  # Stage 5
└── README.md                   # 인덱스 + 코딩 에이전트 인계 문서
```

**경량 모드 (Lite Mode)**: 사용자가 "빠르게" 또는 "MVP만"이라고 요청하면 Stage 0, 5의 일부를 생략하고 1-4만 진행 (기본 4개 문서 + README).

---

## 단계별 상세 가이드

### Stage 0: Pre-Discovery — 시장 & 사용자 리서치

> "시장이 없으면 제품도 없다."

#### 산출물

1. **`00-market-research.md`** — Market Sizing
   - TAM (Total Addressable Market): 이론적 최대 시장
   - SAM (Serviceable Addressable Market): 우리 솔루션이 닿을 수 있는 시장
   - SOM (Serviceable Obtainable Market): 현실적 3년 내 점유 가능 시장
   - 시장 성장률 (CAGR)
   - 시장 트렌드 (구조적 변화)

2. **`00-competitive-analysis.md`** — 경쟁 분석
   - 직접 경쟁자 (Direct competitors)
   - 간접 경쟁자 (Indirect / substitute)
   - Porter's 5 Forces 분석
   - 포지셔닝 맵 (2x2 matrix)
   - 우리의 Unfair Advantage

3. **`00-user-research.md`** — 사용자 리서치
   - 인터뷰 스크립트 (`templates/01-user-interview-script.md` 참조)
   - JTBD 캔버스 (`templates/01-jtbd-canvas.md` 참조)
   - Empathy Map
   - 핵심 인사이트 3~5개

→ 상세: `agents/product-strategist.md`, `agents/ux-researcher.md`
→ 방법론: `references/methodologies.md`, `references/frameworks.md`

**Skip 조건**: 사용자가 "이미 시장은 안다", "내부 도구라 시장 분석 불필요"라고 명시할 때만.

---

### Stage 1: Discovery — 아이디어 증강

기존 매니페스트 방식의 핑퐁 질문 + Hypothesis 명시화.

#### 핵심 산출물

**`01-discovery.md`** 구성:
- One-liner
- Problem Statement (구체적, 측정 가능)
- **Hypothesis** (명시적): "We believe that **[기능]** for **[사용자]** will result in **[결과]**. We will know we are right when we see **[지표]**."
- Target Users (Persona + JTBD)
- Core Features (P0/P1/P2)
- Differentiation
- Risks & Unknowns

**`01-lean-canvas.md`** — Ash Maurya의 Lean Canvas
- Problem / Solution
- Key Metrics
- Unique Value Proposition
- Unfair Advantage
- Channels
- Customer Segments
- Cost Structure / Revenue Streams

→ 상세: `agents/requirements-analyst.md`
→ 템플릿: `templates/01-discovery-questions.md`, `templates/01-jtbd-canvas.md`, `templates/01-user-interview-script.md`

---

### Stage 2: Strategy & PRD

#### 산출물

**`02-one-pager.md`** — Amazon "Working Backwards" PR/FAQ
- 가상의 보도자료 (출시 시점 기준 과거형으로 작성)
- 가상의 FAQ (내부/외부)
- 출시일 기준 역산
- → Bezos의 원칙: "PR/FAQ를 먼저 못 쓰면 만들지 마라"

**`02-prd.md`** — 18 섹션 PRD
기존 13개 섹션 + 추가 5개:
14. **Hypothesis & Success Criteria** (실험 설계)
15. **Privacy & Compliance** (GDPR, CCPA, 개인정보보호법)
16. **Accessibility** (WCAG 2.1 AA)
17. **Internationalization (i18n)** (다국가 출시 시)
18. **Telemetry Plan** (메트릭 수집 계획 — Stage 5와 연결)

**`02-rice-prioritization.md`** — 기능 우선순위 정량화
- RICE Score = (Reach × Impact × Confidence) / Effort
- 기능별 스코어링 시트

→ 상세: `agents/prd-writer.md`
→ 템플릿: `templates/02-prd-template.md`, `templates/02-one-pager.md`, `templates/02-lean-canvas.md`, `templates/02-rice-prioritization.md`

---

### Stage 3: Technical & Feature Specification

#### 산출물

**`03-trd.md`** — Technical Requirements Document
- System Architecture Diagram (Mermaid)
- Tech Stack 결정 + 근거 (Build vs Buy 분석)
- Data Model / Schema
- API Contract (REST/GraphQL)
- 외부 서비스 의존성 (with SLA)
- Non-Functional Requirements (성능, 보안, 확장성)
- Migration / Rollback 전략

**`03-feature-spec.md`** — 3-depth Feature Spec
기존 + 추가:
- **State machines** (복잡한 UI 흐름 상태)
- **Edge cases matrix** (입력 × 상태 조합)
- **Empty/Loading/Error states** 명시
- **Feature flags** 적용 여부

→ 상세: `agents/technical-architect.md`, `agents/feature-architect.md`
→ 템플릿: `templates/03-trd-template.md`, `templates/03-feature-spec-template.md`

---

### Stage 4: UX & Design

#### 산출물

**`04-information-architecture.md`**
- Sitemap (계층 구조)
- Navigation pattern
- 화면 인벤토리

**`04-user-flow.md`** — Mermaid 다이어그램
- 페르소나별 플로우
- Happy path + Edge cases
- Empty / Loading / Error states 노드 포함
- Accessibility 체크리스트 (WCAG)

→ 상세: `agents/ux-flow-designer.md`
→ 템플릿: `templates/04-user-flow-template.md`, `templates/04-information-architecture.md`

---

### Stage 5: Launch & Measurement

#### 산출물

**`05-launch-plan.md`** — Go-to-Market
- Stakeholder map (RACI)
- Launch checklist (T-30, T-7, T-0, T+7, T+30)
- Marketing channels
- 단계별 출시 (Internal → Beta → Soft launch → GA)
- 위기 대응 시나리오 (rollback, comms)

**`05-analytics-plan.md`** — 측정 설계
- North Star Metric
- 보조 지표 (Input metrics)
- Event Taxonomy (사용자 이벤트 명세)
- Funnel 정의
- Cohort 정의
- Dashboard 구성

**`05-experimentation-plan.md`** — 실험 설계
- Hypotheses 목록
- A/B Test 설계 (sample size, power, duration)
- 성공/실패 기준
- 학습 기록 템플릿

→ 상세: `agents/data-analyst.md`, `agents/launch-strategist.md`
→ 템플릿: `templates/05-launch-plan.md`, `templates/05-analytics-plan.md`, `templates/05-experimentation-plan.md`

---

## 품질 게이트 (Quality Gates)

각 단계 완료를 위한 **Definition of Done**.

→ 상세: `references/quality-gates.md`

핵심만 요약:

| Stage | DoD (모두 만족해야 다음 단계로) |
|-------|------------------------------|
| 0 | TAM/SAM/SOM 수치화 / 경쟁자 최소 3개 분석 / 사용자 인사이트 3개 이상 |
| 1 | Hypothesis 문장 명시 / 페르소나 1개 이상 구체화 / JTBD 정의 |
| 2 | PR/FAQ 완성 / RICE 스코어 P0 기능에 모두 부여 / Privacy 섹션 채워짐 |
| 3 | API Contract 1개 이상 작성 / Edge case matrix / State diagram |
| 4 | 페르소나별 플로우 / Empty/Error state 포함 / WCAG 체크리스트 |
| 5 | North Star + Input metrics 정의 / 이벤트 taxonomy / Launch checklist |

---

## Senior PM 사고 프레임워크

이 스킬을 사용할 때 항상 적용할 추론 도구.

→ 상세: `references/senior-pm-thinking.md`

핵심 도구:
- **First Principles Thinking** — 업계 관례 ≠ 진리
- **Inversion** — "어떻게 하면 실패할까?" 를 먼저
- **Pre-mortem** — 출시 1년 후 실패한 상황을 가정하고 원인 추론
- **Working Backwards** — 최종 결과부터 역산
- **5 Whys** — 표면 문제 → 근본 원인

각 에이전트는 자신의 도메인에서 이 도구들을 활용합니다.

---

## 변경사항 처리

개발 도중 기획이 바뀌면:

1. 변경 단계 식별
2. **영향 매트릭스 분석**:
   ```
   PRD 변경 → 영향: TRD, Feature Spec, User Flow, Launch Plan, Analytics
   기능 변경 → 영향: User Flow, Analytics (이벤트), TRD (API)
   ```
3. 영향 받는 **모든 문서를 함께 갱신**
4. 각 문서 `## Changelog`에 기록
5. **Hypothesis 재검증** — 변경된 가설이 여전히 유효한가?

---

## 한국 시장 vs 글로벌 시장

→ 상세: `references/korea-market-guide.md`

- 한국 출시 시 고려: PG (토스/카카오/네이버페이), 본인인증 (NICE/KCB), 카카오 알림톡, 개인정보보호법, 전자상거래법, 표시광고법
- 글로벌 출시 시: GDPR, CCPA, App Store 정책, Stripe/Paddle, i18n, RTL 언어
- **둘 다 출시**할 때 우선순위 결정 프레임워크

---

## 안티패턴

→ 상세: `references/anti-patterns.md`

핵심 금지사항:
- ❌ Stage 0(리서치) 건너뛰고 PRD 작성 — "이미 안다"는 가설일 뿐
- ❌ Hypothesis 없는 기능 추가
- ❌ 측정 계획 없는 기능 출시
- ❌ Edge case / Error state 누락
- ❌ 모든 기능이 P0 (우선순위가 없는 것)
- ❌ Privacy/Compliance 섹션 공란
- ❌ Stakeholder map 없이 런칭
- ❌ 단계별 검토(Gate) 건너뛰기

---

## 한국어/영어 표기 규칙

- 사용자가 한국어로 시작 → 산출물 한국어 (전문 용어 영문 병기)
- 기술 용어/API 명칭/메서드로지 명칭은 영어 유지
- 글로벌 팀과 공유할 산출물이면 사용자에게 영문 버전도 만들지 물어볼 것
