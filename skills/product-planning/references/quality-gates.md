# Quality Gates — Definition of Done

> 각 단계 완료 기준. 모두 충족되어야 다음 단계로 진행.

---

## 원칙

### Why Quality Gates?

❌ "일단 진행하고 나중에 보강"
- 결국 보강 안 됨
- 다음 단계에서 더 큰 비용
- 누락 발견은 출시 후

✅ Quality Gate로 강제 검증
- 진행 차단 → 보강 필수
- 누락 즉시 발견
- 부채 누적 방지

### How to Use

각 단계 종료 시:
1. 체크리스트 모든 항목 확인
2. ✅✅✅ 모두 충족 → 다음 단계 진행
3. ❌ 있음 → 사용자에게 보강 요청

**예외**: 사용자가 명시적으로 "Lite mode" 또는 "skip 이유"를 제시할 때만 진행.

---

## Stage 0: Pre-Discovery DoD

### Market Research (`00-market-research.md`)
- [ ] TAM 수치화 (출처 포함)
- [ ] SAM 수치화 (좁힌 기준 명시)
- [ ] SOM 수치화 (3년 목표, 현실성 검증)
- [ ] 시장 성장률 (CAGR, 출처)
- [ ] 구조적 트렌드 3개 이상
- [ ] 시장 리스크 명시

### Competitive Analysis (`00-competitive-analysis.md`)
- [ ] 직접 경쟁자 최소 3개 분석
- [ ] 간접 경쟁자/대체재 최소 1개
- [ ] Porter's 5 Forces 분석 (5가지 모두)
- [ ] 포지셔닝 맵 (2x2)
- [ ] Unfair Advantage 명시 (복제 불가능한 것)

### User Research (`00-user-research.md`)
- [ ] 인터뷰 N≥5 (정성) 또는 설문 N≥100 (정량)
- [ ] JTBD 정의 (Functional/Emotional/Social)
- [ ] 페르소나 1개 이상 (데이터 기반)
- [ ] 인사이트 3개 이상 (각 quote 2개로 뒷받침)

**예외 조건**: 내부 도구이거나, 사용자가 명시적으로 skip 요청 시 [Unverified Assumption] 마킹.

---

## Stage 1: Discovery DoD

### `01-discovery.md`
- [ ] One-liner 작성 ([누구]를 위한 [무엇])
- [ ] Customer Hypothesis 명시
- [ ] Problem Hypothesis 명시
- [ ] Solution Hypothesis 명시
- [ ] Riskiest Assumption 식별 (Impact × Probability)
- [ ] 페르소나 + JTBD (Stage 0와 일관성)
- [ ] 핵심 기능 P0/P1/P2 분류
- [ ] Differentiation
- [ ] 리스크 매트릭스 (최소 3개)

### `01-lean-canvas.md`
- [ ] Problem (3개)
- [ ] Existing Alternatives
- [ ] Customer Segments (+ Early Adopters)
- [ ] Solution (3개)
- [ ] Unique Value Proposition
- [ ] Channels
- [ ] Unfair Advantage
- [ ] Key Metrics (5개 미만)
- [ ] Cost Structure
- [ ] Revenue Streams

→ **9칸 모두 채워져야 함**. 빈 칸 = DoD 미충족.

---

## Stage 2: Strategy & PRD DoD

### `02-one-pager.md` (Working Backwards PR/FAQ)
- [ ] Press Release (5단락)
- [ ] 사용자 인용구 포함 (가상이라도)
- [ ] 측정 가능한 결과 포함
- [ ] External FAQ (5개 이상)
- [ ] Internal FAQ (5개 이상, Why now? 포함)
- [ ] 마케팅 buzzword 없음 ("혁신적", "최고의" 등)

**Gate**: PR/FAQ가 매력적이지 않다면 PRD 작성 진행 거부.

### `02-prd.md` (18 Sections)
- [ ] 1. One-liner
- [ ] 2. Goals (비즈니스 + 사용자)
- [ ] 3. Background & Why Now
- [ ] 4. Core Value Prop
- [ ] 5. Problem Statement
- [ ] 6. Solution Overview
- [ ] 7. Differentiation
- [ ] 8. Target Users (페르소나 + JTBD)
- [ ] 9. User Scenarios
- [ ] 10. High-level Features (RICE 점수 포함)
- [ ] 11. Success Metrics (North Star + Input metrics)
- [ ] 12. Risks & Open Questions
- [ ] 13. Scope (In/Out/Future) — Out of scope 비어있지 않음
- [ ] 14. Hypothesis & Experimentation
- [ ] 15. Privacy & Compliance (관련 규제 명시)
- [ ] 16. Accessibility (WCAG 2.1 AA)
- [ ] 17. Internationalization (i18n)
- [ ] 18. Telemetry Plan

### `02-rice-prioritization.md`
- [ ] 모든 P0 기능에 RICE 점수
- [ ] Reach / Impact / Confidence / Effort 모두 부여
- [ ] 점수 기반 P0/P1/P2 자동 분류
- [ ] Top 30% → P0, 30~70% → P1, Bottom 30% → P2

---

## Stage 3: Technical & Feature DoD

### `03-trd.md`
- [ ] Overview + Assumptions
- [ ] System Architecture (Mermaid diagram)
- [ ] Tech Stack (Trade-off 포함)
- [ ] Data Model (ERD + Schema)
- [ ] API Contract (최소 5개 endpoint)
- [ ] External Dependencies (SLA + 비용)
- [ ] Non-Functional Requirements (수치화)
- [ ] Build vs Buy ADR 최소 3개
- [ ] Migration/Rollback plan
- [ ] Open technical questions

### `03-feature-spec.md`
- [ ] 트리 3-depth (대/중/소)
- [ ] 모든 P0 기능 상세 명세
- [ ] State machine (복잡 상태 기능)
- [ ] Edge case matrix (최소 5건/기능)
- [ ] Empty/Loading/Error state 명시
- [ ] Accessibility 체크리스트
- [ ] Analytics events 정의
- [ ] PRD/TRD 참조 링크

---

## Stage 4: UX & Design DoD

### `04-information-architecture.md`
- [ ] Sitemap (모든 화면 포함)
- [ ] Screen inventory
- [ ] Navigation pattern 결정 (top/side/bottom/hamburger)
- [ ] Public vs Authenticated vs Admin 영역 분리

### `04-user-flow.md`
- [ ] 페르소나별 메인 플로우 (페르소나 수만큼)
- [ ] 온보딩 플로우
- [ ] 핵심 사용 플로우
- [ ] 예외 처리 플로우 (에러/권한/오프라인)
- [ ] Empty/Loading/Error state 노드 포함
- [ ] WCAG 2.1 AA 체크리스트
- [ ] 모바일 vs 데스크톱 분리 (해당 시)
- [ ] Mermaid 색상 일관성 (terminal/screen/action/decision/success/error/empty/loading)

---

## Stage 5: Launch & Measurement DoD

### `05-launch-plan.md`
- [ ] Launch type 결정
- [ ] Stakeholder RACI map
- [ ] Timeline (T-90 ~ T+30)
- [ ] Marketing channel 2~3개 선정
- [ ] 채널별 메시지 1줄 hook
- [ ] 위기 대응 시나리오 4개 이상
- [ ] Press kit 자료 목록
- [ ] Post-launch review 템플릿

### `05-analytics-plan.md`
- [ ] North Star Metric 정의 + 측정 가능
- [ ] Input metrics 3~5개
- [ ] Guardrail metrics
- [ ] Event taxonomy (네이밍 컨벤션 + 카탈로그)
- [ ] 표준 properties 정의
- [ ] Lifecycle events (Acquisition/Activation/Engagement/Monetization/Retention/Referral)
- [ ] 핵심 funnel 3개 (Acquisition/Activation/Monetization)
- [ ] Cohort retention 정의
- [ ] Dashboard 구성 (Daily/Weekly/Monthly)
- [ ] Tools 결정

### `05-experimentation-plan.md`
- [ ] Hypothesis 명시 (validating belief format)
- [ ] Variant / Control 정의
- [ ] Primary + secondary + guardrail metrics
- [ ] Sample size 계산 (MDE 명시)
- [ ] Duration 결정
- [ ] Success/Failure criteria
- [ ] 출시 직후 실행할 실험 1~2개

---

## Cross-stage 검증

매 단계 시작 시 이전 단계 산출물 일관성 확인:

### Hypothesis 일관성
- Stage 1의 hypothesis 문장이 Stage 2~5에서 그대로 유지?
- 변경 시 모든 영향 받는 문서에 반영?

### 페르소나 일관성
- Stage 0~4의 페르소나가 일치?
- Stage 4 user flow의 페르소나가 Stage 2 PRD의 페르소나와 동일?

### Feature ID 일관성
- 03-feature-spec.md의 기능 ID가 02-prd.md, 04-user-flow.md, 05-analytics-plan.md에서 일관되게 참조?

### 지표 일관성
- Stage 2 Success Metrics가 Stage 5 Analytics Plan의 North Star/Input과 동일?

---

## Lite Mode DoD (간소화)

사용자가 "MVP만", "빠르게" 요청 시 다음만 충족:

### Lite Stage 1
- [ ] One-liner
- [ ] Top 1 hypothesis
- [ ] 페르소나 1개
- [ ] 핵심 기능 P0

### Lite Stage 2
- [ ] 핵심 8 섹션만 (1-9, 11, 12)
- [ ] Privacy는 "추후 검토" 표시 가능
- [ ] RICE는 P0 기능에만

### Lite Stage 3
- [ ] Tech stack 결정
- [ ] 핵심 API endpoint
- [ ] Data model (간소)

### Lite Stage 4
- [ ] 메인 플로우 1개 + Error state

### Stage 5 Skip 가능 (출시 후 보강)

---

## Gate Failure 처리

DoD 미충족 시 응답 형식:

```
Stage [N] DoD 체크 결과:

✅ 충족된 항목:
- [항목 1]
- [항목 2]
- ...

❌ 미충족 항목:
- [항목 X] — [이유]
- [항목 Y] — [이유]

⚠️ 주의 필요:
- [항목 Z] — [개선 제안]

권장: 위 ❌ 항목들을 보강 후 다음 단계 진행.
이대로 진행 시 Stage [N+1]에서 더 큰 비용 발생 예상.

진행 옵션:
1. 보강 후 진행 (권장)
2. Lite mode로 전환 (DoD 완화)
3. 그대로 진행 (위험 명시 후) — 비추천
```
