# Product Planning Skill

> 글로벌 SaaS 회사 시니어 PM 수준의 제품 기획 워크플로우.
> Claude Code skill + 11 specialized agents + 23 templates + 11 references + 1 full example.

---

## 무엇인가?

이 skill은 Claude Code에서 제품 기획 전 과정을 단계적으로 진행하도록 돕는 도구입니다.

- **Discovery → PRD → TRD → Feature Spec → UX → Launch → Measurement**
- 모든 단계에서 Stripe, Linear, Notion, Amazon 수준 표준 적용
- Working Backwards, JTBD, RICE, Opportunity Solution Tree 통합
- 한국 시장 특수성 (PIPA, 알림톡, 결제) 포함
- Trio (PM + Designer + Engineer) 협업 모델 가이드

---

## 6-Stage Workflow

```
Stage 0: Pre-Discovery
  ├─ Market Research (TAM/SAM/SOM)
  ├─ Competitive Analysis (Porter's 5 Forces)
  └─ User Research (JTBD, interviews)
        ↓
Stage 1: Discovery
  ├─ Hypothesis-driven question pingpong
  ├─ Lean Canvas (9 boxes)
  └─ Opportunity Solution Tree
        ↓
Stage 2: Strategy & PRD
  ├─ Working Backwards (PR/FAQ)
  ├─ 18-section PRD
  ├─ RICE prioritization
  └─ Pricing & packaging
        ↓
Stage 3: Technical & Feature
  ├─ TRD (Tech stack, architecture, ADRs)
  └─ Feature Spec (state machines, edge cases, states)
        ↓
Stage 4: UX & Design
  ├─ Information Architecture (sitemap)
  └─ User Flows (Mermaid, WCAG)
        ↓
Stage 5: Launch & Measurement
  ├─ Launch Plan (T-90 ~ T+30)
  ├─ Analytics Plan (NSM, events, funnels)
  └─ Experimentation Plan (A/B tests)
```

---

## 디렉토리 구조

```
product-planning/
├── SKILL.md                                  ← Claude Code 진입점
├── README.md                                 ← 이 문서
│
├── agents/                                   ← 11 specialized PM agents
│   ├── chief-product-officer.md             (Opus, orchestrator)
│   ├── product-strategist.md                (Opus, market/competition)
│   ├── ux-researcher.md                     (Sonnet, JTBD/interviews)
│   ├── requirements-analyst.md              (hypothesis-driven discovery)
│   ├── prd-writer.md                        (Opus, Working Backwards)
│   ├── technical-architect.md               (Opus, TRD)
│   ├── feature-architect.md                 (state machines, edge cases)
│   ├── ux-flow-designer.md                  (IA + flows)
│   ├── data-analyst.md                      (Opus, NSM/events/A/B)
│   └── launch-strategist.md                 (Opus, GTM/crisis)
│
├── templates/                                ← 23 templates
│   ├── 00-roadmap.md                        (Now/Next/Later + OKR)
│   ├── 00-stakeholder-map.md                (RACI, power/interest)
│   ├── 01-discovery-questions.md            (Stage 1 ping-pong)
│   ├── 01-user-interview-script.md          (60-min interview)
│   ├── 01-jtbd-canvas.md                    (Jobs to be Done)
│   ├── 01-opportunity-solution-tree.md      (Teresa Torres)
│   ├── 02-one-pager.md                      (PR/FAQ Amazon style)
│   ├── 02-lean-canvas.md                    (Ash Maurya 9 boxes)
│   ├── 02-prd-template.md                   (18 sections)
│   ├── 02-rice-prioritization.md            (Sean McBride RICE)
│   ├── 02-pricing-packaging.md              (SaaS pricing playbook)
│   ├── 02-enterprise-requirements.md        (SSO, SCIM, audit, SLA) ⭐ NEW
│   ├── 02-ai-prd-addendum.md                (AI use case, model, cost, prompt) ⭐ NEW
│   ├── 03-trd-template.md                   (technical spec)
│   ├── 03-feature-spec-template.md          (state machines + edge cases)
│   ├── 03-estimation-worksheet.md           (Story points, capacity, PERT)
│   ├── 03-eval-suite.md                     (AI eval framework) ⭐ NEW
│   ├── 04-information-architecture.md       (sitemap)
│   ├── 04-user-flow-template.md             (Mermaid + WCAG)
│   ├── 05-launch-plan.md                    (T-90 ~ T+30)
│   ├── 05-analytics-plan.md                 (events + dashboards)
│   ├── 05-experimentation-plan.md           (A/B tests)
│   └── 05-pricing-experiments.md            (Van Westendorp, A/B 가격 실험)
│
├── references/                               ← 11 deep references
│   ├── senior-pm-thinking.md                (5 frameworks)
│   ├── methodologies.md                     (JTBD, OKR, NSM, RICE, AARRR, OST)
│   ├── frameworks.md                        (Lean Canvas, Porter, Blue Ocean, 4P, ...)
│   ├── trio-collaboration.md                (PM + Designer + Engineer)
│   ├── engineering-estimation.md            (Story Points, Shape Up, #NoEstimates)
│   ├── enterprise-sales-motion.md           (PoC, MEDDIC, RFP, Procurement) ⭐ NEW
│   ├── ai-product-fundamentals.md           (LLM cost, prompts, hallucination) ⭐ NEW
│   ├── quality-gates.md                     (DoD per stage)
│   ├── korea-market-guide.md                (PIPA, PG, 알림톡)
│   ├── decision-log.md                      (ADR template + usage)
│   └── anti-patterns.md                     (stage-by-stage pitfalls)
│
└── examples/
    └── newgen-full-example.md               (NewGen 전체 적용 예시)
```

---

## 설치 / 사용

### Claude Code skill로 설치

1. 이 skill 디렉토리를 `~/.claude/skills/` 또는 프로젝트의 `.claude/skills/`에 복사
2. Claude Code 시작 → SKILL.md 자동 인식
3. "[프로젝트명] 기획 시작" 등 자연어 요청

### 명령어 예시

```
"신규 SaaS 기획 시작" → Stage 0 Pre-Discovery부터
"PRD 작성 도와줘" → Stage 2로 직행 (이전 단계 결과 가정)
"Lite mode로 빠르게 MVP 기획" → 간소화 워크플로우
"NewGen 출시 plan 만들어줘" → Stage 5 launch
"이 기능에 RICE 점수 매겨줘" → RICE template 활용
```

---

## 작동 방식

### Chief Product Officer (Opus) 오케스트레이션

각 stage마다 적절한 specialist agent에게 위임:

```
User → CPO → Stage 0: product-strategist + ux-researcher
            → Stage 1: requirements-analyst
            → Stage 2: prd-writer
            → Stage 3: technical-architect + feature-architect
            → Stage 4: ux-flow-designer
            → Stage 5: data-analyst + launch-strategist
```

### Quality Gates

각 단계 종료 시 자동 DoD 체크. 미충족 시 보강 요청.

### Lite Mode

사용자가 "빠르게", "MVP만"이라고 하면 간소화 워크플로우 적용.

---

## 산출물 디렉토리

기본적으로 다음 구조로 산출:

```
<project>-planning/
├── 00-market-research.md
├── 00-competitive-analysis.md
├── 00-user-research.md
├── 00-roadmap.md
├── 00-stakeholder-map.md
├── 01-discovery.md
├── 01-lean-canvas.md
├── 01-jtbd-canvas.md
├── 01-opportunity-solution-tree.md
├── 02-one-pager.md
├── 02-prd.md
├── 02-rice-prioritization.md
├── 02-pricing.md
├── 03-trd.md
├── 03-feature-spec.md
├── 04-information-architecture.md
├── 04-user-flow.md
├── 05-launch-plan.md
├── 05-analytics-plan.md
├── 05-experimentation-plan.md
└── decisions/
    ├── ADR-001-...md
    └── ADR-002-...md
```

---

## 차별점

### 일반 PRD 템플릿 vs 이 skill

| 항목 | 일반 PRD 도구 | 이 skill |
|------|------------|---------|
| Stage 구조 | 1-3 stage | 6 stage (Pre-Discovery + Launch) |
| PRD 섹션 | 8~12 | 18 (Hypothesis, Privacy, A11y, i18n 추가) |
| 가설 검증 | 없음 | Working Backwards + Pre-mortem + A/B 통합 |
| 우선순위 | PM 직감 | RICE 정량 |
| 한국 시장 | 없음 | PIPA + 알림톡 + PG playbook |
| 협업 | 미명시 | Trio 협업 protocol |
| Examples | 없음 | NewGen 전체 적용 예시 |
| 의사결정 | 없음 | ADR 시스템 |
| Discovery 도구 | 없음 | JTBD + OST + Continuous Discovery |
| Pricing | 없음 | B2B SaaS playbook + Van Westendorp + A/B 가격 실험 |
| Roadmap | 없음 | Now/Next/Later + OKR |
| Engineering 추정 | 없음 | Story Points + Shape Up + PERT + Capacity planning |
| Enterprise B2B | 없음 | MEDDIC, PoC playbook, SSO/SCIM/audit, RFP, Procurement |
| AI-native 제품 | 없음 | LLM cost, model routing, Evals, RAG, Hallucination, Prompts |

### 글로벌 SaaS 회사 표준 반영
- **Amazon**: Working Backwards PR/FAQ, Bar Raiser
- **Stripe**: Engineering excellence, ADRs
- **Linear**: Outcome-based roadmap, lean PRD
- **Notion**: Document-everything, async-first
- **Spotify**: Trio (Squad) model, OKR
- **Atlassian**: ADR standardization

---

## 누구를 위한가

### 적합
- ✅ 한국 SaaS 스타트업 PM
- ✅ Founder가 PM 역할 겸할 때
- ✅ B2B 또는 B2C SaaS 기획
- ✅ MVP부터 GA까지 전 과정
- ✅ 한국 + 글로벌 동시 출시 검토

### 부적합 (overkill)
- ❌ 1주일 hackathon
- ❌ 비-소프트웨어 제품 (물리 제품)
- ❌ 단순 마케팅 캠페인

→ Lite mode 사용 권장.

---

## 알려진 한계

1. **AI Agent는 보조** — 진짜 사용자 인터뷰, 시장 조사, 의사결정은 사람이
2. **한국 시장 중심** — 글로벌만 출시 시 일부 reference 무관
3. **Template은 시작점** — 프로젝트별 조정 필요
4. **데이터 검증 필요** — agent의 가정/추정은 검증해야

---

## Contribution

이 skill은 사용하면서 개선됩니다.

- 누락 발견 시 → reference 추가
- 사용 패턴 → SKILL.md 워크플로우 정제
- New best practice → templates에 반영

---

## License

MIT (or 사용자 선택)

---

## 마지막 한 마디

> "좋은 PRD는 좋은 제품을 보장하지 않는다.
> 하지만 나쁜 PRD는 나쁜 제품을 거의 보장한다."
>
> "기획서를 잘 쓰는 것이 목적이 아니라, 좋은 결정을 내리는 것이 목적이다."

이 skill은 도구이지 결정자가 아닙니다. 진짜 PM 작업은:
- 사용자와 시간 보내기
- 데이터 깊이 분석
- 팀과 함께 빌드하기
- 학습하고 조정하기

도구가 그 일을 더 잘 하도록 돕기를.
