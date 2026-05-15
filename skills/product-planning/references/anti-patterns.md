# Product Planning Anti-Patterns

> 글로벌 PM이 피하는 함정들. 매 단계마다 셀프 체크.

---

## Stage 0: Pre-Discovery 안티패턴

### "이미 시장은 안다" 함정
❌ 시장 조사 없이 직접 PRD 작성
✅ 최소 5명 인터뷰 후 진행
**이유**: PM의 가정은 가설일 뿐, 검증 필요

### "경쟁자 없음" 함정
❌ "이런 솔루션 없어요" 자기 위안
✅ 대체재 포함 분석 (사용자가 현재 어떻게 해결?)
**이유**: 거의 모든 경우 대체재 있음

### 친구/지인 인터뷰
❌ 친구 5명에게 물어보고 "사용자 검증 완료"
✅ 타겟 페르소나 5명에게 cold outreach
**이유**: 친구는 bias 있음, 진짜 사용자 아님

### TAM 부풀리기
❌ "TAM이 100조원이에요!" (전체 인구 × 평균 소득)
✅ Bottom-up + Top-down 두 방법 검증, SOM에 집중
**이유**: TAM은 fundraising용, SOM이 진짜 비즈니스

### "1% 점유율" 계산
❌ "이 시장의 1%만 잡아도 X억 매출이에요"
✅ 어떻게 1%를 달성할지 구체적 계획
**이유**: 첫 1% 점유가 가장 어려움

---

## Stage 1: Discovery 안티패턴

### Hypothesis 없는 기능
❌ "이 기능이 사용자에게 좋을 것 같아요"
✅ "We believe X for Y will result in Z. Known when seeing W."
**이유**: 검증 불가 = 학습 불가

### "다 중요해요" P0 폭증
❌ 30개 기능 모두 P0
✅ Top 5만 P0, 나머지는 P1/P2/Future
**이유**: 우선순위 없음 = 우선순위 결정 안 한 것

### Solution-first
❌ "이 기능을 만들고 싶어요. 누구를 위해서?"
✅ "이 사용자가 이 문제로 고통받고 있어요. 어떻게 해결?"
**이유**: 사용자 중심이 아닌 자기 중심

### Persona Bingo
❌ 페르소나가 가상의 인물 + 데이터 없음
✅ 실제 인터뷰 데이터 기반 페르소나
**이유**: Fictional persona는 가정의 가정

### Vague JTBD
❌ "사용자는 좋은 경험을 원함"
✅ "When 출근길 30분, I want X, so I can Y"
**이유**: 추상적 = 측정 불가능

---

## Stage 2: PRD 안티패턴

### PRD 먼저, PR 나중
❌ 50페이지 PRD 작성 후 마케팅 메시지 고민
✅ Working Backwards (PR/FAQ 먼저)
**이유**: PR이 매력적이지 않으면 만들 가치 없음

### Out of Scope 비어있음
❌ Scope: [기능 1, 2, 3, ...20]
✅ Scope: In/Out/Future 명확히 분리
**이유**: 모든 걸 다 하겠다 = 아무것도 못 함

### Success Metrics가 측정 불가능
❌ "사용성 향상", "사용자 만족도 증가"
✅ "Activation rate 30% → 45%", "DAU 1,000 → 5,000"
**이유**: 측정 불가 = 개선 불가

### "TBD" 떡밥
❌ Privacy: TBD, Accessibility: TBD, i18n: TBD
✅ 결정 못해도 옵션 + 추천안 명시
**이유**: TBD 누적 = 의사결정 보류 = 개발 지연

### Marketing Buzzwords
❌ "혁신적인", "최첨단의", "최고의"
✅ "X% 시간 절약", "Y초 안에 완료"
**이유**: Buzzword = 의미 없음

### Hypothesis가 검증 불가능
❌ "사용자가 사랑할 것이다"
✅ "Week 1 retention 40% 이상 + NPS 50 이상"
**이유**: 통과/실패 기준이 명확해야 학습

---

## Stage 3: Technical Spec 안티패턴

### Trade-off 무시
❌ "PostgreSQL이 최고"
✅ "PostgreSQL 선택. 이유: X. Trade-off: Y. 대안: Z"
**이유**: 모든 결정에 trade-off 있음

### Build vs Buy 자동 Build
❌ "직접 만들면 학습 기회"
✅ ADR로 명시적 결정 + 비용 분석
**이유**: 시간 낭비, vendor가 더 잘함

### NFR 무시
❌ "일단 만들고 나중에 최적화"
✅ 사전에 SLO 정의 (latency, error rate)
**이유**: 사후 최적화는 재설계

### Vendor Lock-in 무시
❌ Firebase에 모든 걸 묶음
✅ Lock-in 정도 분석 + 대안 옵션
**이유**: 가격 인상 시 도망갈 곳 없음

### 비용 예측 안 함
❌ "AWS 쓰면 되겠지"
✅ 100명/1000명/10000명 시 월 비용 추정
**이유**: Unit economics 무너짐

### Migration/Rollback 없음
❌ "잘 될 거에요"
✅ Feature flag로 즉시 rollback 가능 구조
**이유**: Murphy's law

---

## Stage 3: Feature Spec 안티패턴

### Edge Case "추후 보강"
❌ "Happy path만 명시, edge case는 개발하면서"
✅ Edge case matrix 사전 작성 (최소 5건/기능)
**이유**: Edge case가 사용자 신뢰 결정

### Empty/Loading/Error State 누락
❌ "데이터 있다고 가정"
✅ Empty state + Loading state + Error state 명시
**이유**: 첫 사용자는 항상 Empty, 모든 사용자가 Loading 봄

### "오류 발생" 메시지
❌ "오류가 발생했습니다"
✅ 무엇이, 왜, 어떻게 해결할지
**이유**: 무의미한 에러는 사용자 이탈

### State Machine 없는 복잡 상태
❌ 주문 상태 5개를 if/else로 처리
✅ State diagram + state machine 명시
**이유**: 상태 전이 누락 발견 못 함

### Accessibility "나중에"
❌ "MVP는 일단 그냥 만들고 a11y는 나중에"
✅ 시작부터 WCAG AA 체크리스트
**이유**: 사후 추가는 5배 비용

---

## Stage 4: UX 안티패턴

### 하나의 거대 플로우
❌ 모든 사용자/시나리오 한 다이어그램
✅ 페르소나/시나리오별 분리
**이유**: 가독성 = 사용성 ≠ 디테일

### "처리" "체크" 모호한 노드
❌ "데이터 처리"
✅ "Server validates email format + checks duplication"
**이유**: 모호한 명세 = 모호한 구현

### 분기 없는 일자 플로우
❌ A → B → C → D → 성공
✅ 각 단계마다 fail/abandon/retry 경로
**이유**: 현실은 일자가 아님

### 페르소나 통합
❌ 모든 사용자가 같은 플로우
✅ 페르소나별 다른 진입/주요 경로
**이유**: One-size-fits-all은 nobody-fits

### Dark Pattern 무의식적 사용
❌ 회원가입 → 자동 마케팅 동의 + 옵트아웃 숨김
✅ 명시적 동의 + 옵트아웃 명확
**이유**: 단기 이익 → 장기 신뢰 파괴

---

## Stage 5: Launch 안티패턴

### "다 잘하자" 채널 폭주
❌ Product Hunt + 모든 SNS + PR + 광고 동시
✅ 2~3개 채널 선택 + 집중
**이유**: 분산 = 어느 곳에서도 안 됨

### Beta 없이 GA 직행
❌ "완벽하게 만들어서 한 번에 출시"
✅ Internal alpha → Closed beta → Open beta → GA
**이유**: 사용자 피드백 없는 출시 = 도박

### 위기 대응 시나리오 없음
❌ "다 잘 될 거예요"
✅ Critical bug / 부정적 PR / DDoS / 경쟁 대응 시나리오
**이유**: Murphy's law

### Post-launch Review 없음
❌ "출시했으니 끝"
✅ T+30 retrospective 필수
**이유**: 학습 없으면 같은 실수 반복

### Stakeholder Alignment 부재
❌ PM 혼자 출시일 결정
✅ Sales/CS/Marketing/Legal 사전 alignment
**이유**: 출시 후 갈등 = 출시 실패

### Press를 위한 거짓 메트릭
❌ "Total signups 100만"
✅ 정확한 메트릭 (Active users, paid users)
**이유**: Vanity metric은 자기 기만

---

## Stage 5: Analytics 안티패턴

### Vanity Metrics
❌ Page views, Total signups
✅ DAU/WAU/MAU, Activation rate, Retention
**이유**: 활동 ≠ 가치

### North Star = Revenue
❌ "매출이 곧 가치"
✅ 사용자 가치 반영 지표 (Slack: Active Teams)
**이유**: 매출은 후행 지표

### 너무 많은 메트릭
❌ Dashboard 50개 지표
✅ NSM 1 + Input 3~5 + Guardrail 3
**이유**: 모든 걸 보려면 아무것도 못 봄

### Naming Convention 무시
❌ feature_click, click_feature, feature_clicked 혼용
✅ 표준 [object]_[verb-past] 규칙
**이유**: 분석 시 노이즈 폭증

### PII를 이벤트에 포함
❌ event properties에 email, 전화번호
✅ user_id만 + 별도 user table에 PII
**이유**: GDPR/PIPA 위반

### A/B Test Peeking
❌ "유의 도달 전에 매일 확인하다가 좋아 보이면 종료"
✅ 사전 정의된 sample size + duration 끝까지
**이유**: False positive 폭증

---

## Cross-stage 안티패턴

### 단계 건너뛰기
❌ Stage 0 → Stage 2 (Discovery 생략)
✅ 모든 단계 필수 (Lite mode로 간소화 가능)
**이유**: 다음 단계에서 비용 5배

### Hypothesis가 단계마다 바뀜
❌ Stage 1과 Stage 5의 가설이 다름
✅ 가설 변경 시 모든 문서 동기화
**이유**: 일관성 = 검증 가능성

### "출시 후 측정" 마인드
❌ 측정 계획 출시 후 작성
✅ 측정 계획이 PRD에 포함
**이유**: 측정 없는 출시 = 학습 없는 도박

### 문서를 위한 문서
❌ PRD 50페이지, 아무도 안 읽음
✅ 핵심만 (1-pager + 18 sections)
**이유**: 문서는 결정의 결과, 결정 자체가 아님

### 기술 부채 무시
❌ "일단 출시 후 정리"
✅ ADR로 명시적 부채 기록 + 갚을 시기
**이유**: 부채는 이자 발생, 침묵하지 않음

---

## PM 자체 안티패턴

### Solo Decision
❌ PM 혼자 결정
✅ Trio (PM + Designer + Engineer) 협업
**이유**: Cross-functional 안 하면 cross-functional 실패

### Roadmap = 약속
❌ "Q3에 X 기능 출시 약속"
✅ Outcome-based roadmap ("Q3에 X% retention 개선")
**이유**: 활동이 아닌 결과가 목표

### Customer = "All Users"
❌ "사용자가 원해서"
✅ "Persona A의 60%가 인터뷰에서 요청"
**이유**: 모든 사용자는 신화

### Feature Factory
❌ "이번 분기에 X개 기능 출시"
✅ "이번 분기에 X 문제 해결"
**이유**: 기능 != 가치

### NIH (Not Invented Here)
❌ "다 우리가 만들자"
✅ Build vs Buy + 핵심에 집중
**이유**: 차별점이 아닌 곳에 시간 쓰면 차별점 못 만듦

### Premature Scale
❌ "성장 시작 전부터 enterprise 기능"
✅ PMF 먼저, 그다음 scale
**이유**: PMF 없으면 scale = 손실 가속화

---

## 자가 진단 체크리스트

기획 진행 중 매주 자문:

- [ ] 이번 주 의사결정에 데이터 근거 있나?
- [ ] 가설을 명시적으로 적었나? 검증 가능한가?
- [ ] 사용자와 이번 주 대화했나?
- [ ] "추후 검토" 항목이 늘었나?
- [ ] Trade-off 의식적으로 했나?
- [ ] 위험 사전에 식별했나?
- [ ] 측정 방법 있나?
- [ ] 팀에 결정 이유 공유했나?

3개 이상 ❌ → 잠시 멈추고 점검 필요.
