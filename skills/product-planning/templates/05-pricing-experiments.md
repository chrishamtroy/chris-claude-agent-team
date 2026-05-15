# Pricing Experiments Template

> 가격 관련 실험 protocol. 일반 A/B test보다 더 신중함 필요.
> Reference: `templates/02-pricing-packaging.md`, `templates/05-experimentation-plan.md`

---

# Pricing Experiments — [프로젝트명]

> **Owner**: PM + Marketing + Finance
> **Frequency**: 분기마다 검토, 연 1~2회 실험
> **Risk Level**: HIGH (신뢰 영향, 되돌리기 어려움)

---

## 1. 왜 Pricing 실험은 다른가?

### 일반 A/B test와의 차이

| 차원 | 일반 A/B test | Pricing test |
|------|-------------|-------------|
| Visibility | 다양 | **공개** (가격은 숨길 수 없음) |
| Reversibility | 쉬움 (flag off) | **어려움** (사용자 인지) |
| Sample needed | Small ~ medium | **Large** (전환율 측정) |
| Time horizon | 1~2주 | **수 개월** (LTV 측정 시) |
| Legal risk | 낮음 | **있음** (가격 차별) |
| Trust impact | 낮음 | **높음** (가격 발견 시 분노) |
| Existing users | 보통 영향 없음 | **민감** (Notion 가격 인상 backlash) |

### 결론
**Pricing experiment는 일반 실험의 10배 신중함 필요**.

---

## 2. 무엇을 실험할 수 있는가

### 2.1 Pricing Level (가격 수준)
- $9 vs $19 vs $29
- ₩9,900 vs ₩14,900 vs ₩19,900
- 위험: **공개 가격 차별** (지역/시간만 가능)

### 2.2 Tier Structure (구조)
- 3-tier vs 2-tier vs 4-tier
- Free vs Paid-only
- 위험: 중간

### 2.3 Tier Names (네이밍)
- Pro vs Business vs Premium vs Plus
- 위험: 낮음

### 2.4 Tier Features (포함 기능)
- Pro에 SSO 포함 vs Business
- 위험: 낮음 (기능 이동은 흔함)

### 2.5 Billing Frequency (결제 빈도)
- Monthly default vs Annual default
- 위험: 낮음

### 2.6 Annual Discount (연간 할인)
- 0% vs 10% vs 20% vs 30%
- 위험: 중간

### 2.7 Trial Length (체험 기간)
- 7 days vs 14 days vs 30 days
- 위험: 낮음

### 2.8 Trial Type
- Card-required vs Card-not-required
- Reverse trial (Pro 시작 → Free downgrade)
- 위험: 낮음

### 2.9 Free Tier Limits (무료 한도)
- 50 vs 100 vs 200 사용자
- 위험: 중간 (현재 사용자 영향)

### 2.10 Discount / Promo
- 첫 달 무료 vs 50% off
- 연간 결제 시 1개월 무료
- 위험: 낮음

### 2.11 Pricing Display
- 월 가격 표시 vs 연 가격 표시
- $/day framing
- VAT 포함 vs 별도
- 위험: 낮음

### 2.12 Bundling
- 개별 기능 vs 묶음
- 위험: 중간

---

## 3. Pre-launch Pricing Research (실험 전)

### 3.1 Van Westendorp Pricing Sensitivity Meter

**언제**: 출시 전 가격 결정

**방법**: 4가지 질문

```
Q1: 이 제품이 너무 비싸서 절대 사지 않을 가격은? (Too Expensive)
Q2: 비싼 편이지만 살 만한 가격은? (Expensive but Acceptable)
Q3: 싸지만 품질이 OK라 생각되는 가격은? (Cheap)
Q4: 너무 싸서 품질을 의심하게 되는 가격은? (Too Cheap)
```

**Sample size**: N=100+ (목표 페르소나)

**Analysis**:
4개 누적 분포 곡선을 그림:
- "Too Cheap" 누적 ↑ (낮은 가격부터)
- "Too Expensive" 누적 ↓ (높은 가격부터)
- 교차점들이 가격 범위 알려줌

```
Acceptable Range:
- Lower: Too Cheap = Expensive 교차점
- Upper: Too Expensive = Cheap 교차점

Optimal Price Point:
- Too Cheap = Too Expensive 교차점 (PME = Price of Marginal Expensiveness)

Indifference Price Point:
- Cheap = Expensive 교차점 (지불의향 평균)
```

**예시**:
- Range: ₩7,000 ~ ₩25,000
- Optimal: ₩15,000
- Indifference: ₩12,000

→ ₩12,000~15,000 로 출시.

### 3.2 Gabor-Granger Technique

**방법**: 단계별 가격 제시

```
"₩9,000에 사실 의향?" → Yes/No
Yes면: "₩14,000?" → ...
No면: "₩7,000?" → ...
```

각 가격대별 수용율 측정 → 수요 곡선.

**Output**:
| Price | % Willing |
|-------|----------|
| ₩5,000 | 90% |
| ₩9,000 | 70% |
| ₩14,000 | 50% |
| ₩19,000 | 30% |
| ₩25,000 | 15% |

**Revenue 최대화**:
- 가격 × 수용율 = Expected Revenue per user
- ₩14,000 × 50% = ₩7,000 (best)

### 3.3 Conjoint Analysis

**방법**: 여러 plan을 비교하게 함

```
다음 중 어느 것을 선택?

[Option A]               [Option B]              [Option C]
₩9,000/월                ₩15,000/월              ₩25,000/월
3 users                  5 users                 무제한
Email support            Email + Chat            All channels
기본 기능                기본 + Analytics         All + SSO

[다른 조합 반복...]
```

**Sample size**: N=200+
**Output**: 각 feature가 가격 결정에 미치는 영향력 수치화.

**예시**:
- "무제한 users"는 +₩8,000 가치
- "SSO"는 +₩5,000 가치
- "Chat support"는 +₩3,000 가치

→ Tier 구조 설계의 데이터.

---

## 4. Live Pricing Experiment Protocol

### 4.1 사전 확인사항

✅ **무엇이 결정 가능한 결과**:
- 어떤 가격이 최적?
- 어떤 packaging이 conversion ↑?
- 어떤 trial이 paid 전환 ↑?

❌ **무엇이 어려운가**:
- LTV 측정 (수개월 ~ 1년)
- Long-term churn 영향
- 브랜드 인식 영향

### 4.2 사용자 분리

#### 새 사용자만 실험 (안전)
- 가입 시 random 배정
- 기존 사용자 영향 ❌
- 실험 가능

#### 기존 사용자 변경 (위험)
- 가격 인상 시 모든 사용자 영향
- Grandfathering 필수
- 별도 communication

#### 지리적 분리 (공개 가격 차별 우회)
- 한국 vs 미국 다른 가격 (합법)
- 다른 마케팅 메시지
- 위험: VPN 우회

### 4.3 가격 공개 vs 비공개

#### Public Pricing Page (공개)
- 모든 가격 visible
- 실험은 "Variant" 페이지 분기로
- Risk: 사용자가 다른 가격 발견

#### Sales-led (비공개)
- "Talk to sales"
- 협상 가격 (개인별)
- 실험 자유
- Risk: Friction ↑

---

## 5. Experiment Design Template

### Experiment ID: `pricing_[area]_[shorthand]`

예: `pricing_annual_discount_20pct`

### Hypothesis

```
We believe [pricing change]
for [user segment]
will result in [conversion/ARPU/LTV change].
Known when [primary metric] moves from [X] to [Y].
```

**예시**:
> "We believe Annual default + 17% discount
> for new signups
> will increase Annual plan adoption rate.
> Known when Annual ratio moves from 30% to 50%."

### Variants

| Variant | Description | Traffic % |
|---------|-----------|----------|
| Control | Monthly default, no annual discount | 50% |
| Treatment | Annual default + 17% off | 50% |

### Audience

- [ ] New signups only (recommended)
- [ ] Specific country/region
- [ ] Specific source (organic vs paid)
- [ ] Pre-existing 사용자 (위험)

### Metrics

#### Primary
- **Annual plan ratio** (Annual / Total signups)

#### Secondary
- Conversion rate (Visitor → Paid)
- ARPU at signup
- MRR per user

#### Long-term (필수 추적)
- Churn rate at month 3 / 6 / 12
- LTV
- NPS / CSAT

#### Guardrails
- Total signups (cannot drop ↓)
- Support ticket volume
- Refund rate

### Sample Size & Duration

#### Sample size 계산
```
Baseline annual ratio: 30%
MDE: 50% relative (= 15%p absolute, 30→45%)
Power: 80%
Significance: 5%

→ Sample per variant: ~150 conversions
→ Need: 1,500 signups per variant (at 10% conversion)
→ Duration: 1~2 months (의존: 트래픽)
```

#### Duration 결정
- **단기 metric (conversion)**: 2~4주
- **장기 metric (LTV, churn)**: 6+ months
- → Phase 1: 단기 결정, Phase 2: 장기 모니터링

### Implementation

#### Technical
- Feature flag: `pricing_test_v1`
- Assignment: User-level (sticky)
- Storage: User record (가격은 영구 변경 불가)
- Backup: 실험 종료 후에도 사용자별 가격 유지

#### Legal/Compliance
- [ ] 약관에 "가격 변경 가능" 명시
- [ ] 한국 PIPA 영향 없음 (개인정보 아님)
- [ ] 동일 시점 동일 가격 (지역별만 차이)

### Success Criteria

#### Ship Treatment
- Primary metric ↑ ≥ 20% (relative), p < 0.05
- No 6-month churn 악화
- No guardrail violation

#### Iterate
- Conversion 차이 작지만 ARPU ↑

#### Kill
- Conversion ↓ 명확
- Churn ↑ 명확
- 신뢰 손실 (SNS backlash)

---

## 6. 실제 가격 실험 예시

### Case 1: Annual Default 실험

**Hypothesis**: Annual을 기본 선택으로 두면 annual 비율 ↑

**Variant A (Control)**:
```
[●] Monthly  ₩19,900/월
[ ] Annual   ₩199,000/년 (월 ₩16,580, 17% 절약)
```

**Variant B (Treatment)**:
```
[ ] Monthly  ₩19,900/월
[●] Annual   ₩199,000/년 (월 ₩16,580, 17% 절약)
   ⭐ Most popular
```

**결과 (3개월)**:
- Annual ratio: Control 30% → Treatment 52%
- Total conversion: 변화 없음
- 6-month churn: Annual 사용자가 5% 낮음

**Decision**: Ship Treatment → 글로벌 default.

---

### Case 2: Price Increase 실험 (위험)

**Hypothesis**: ₩9,900 → ₩14,900으로 인상해도 conversion 큰 영향 없음

**Variant**:
- Control (50%): ₩9,900
- Treatment (50%): ₩14,900

**기존 사용자**: Grandfathering, 영향 X

**결과 (2개월)**:
- Conversion: 10% → 8% (-20%)
- ARPU: ₩9,900 → ₩11,920 (+20%)
- Total revenue per visitor: 약간 ↑

**Long-term (6개월)**:
- Churn 비슷
- NPS 비슷

**Decision**: Ship Treatment, but with caveats:
- 신규 사용자만
- 기존 사용자 grandfathering 영구
- Public messaging: "더 많은 기능 추가, 가격 조정"

---

### Case 3: Free Tier Limit 변경 (위험)

**Hypothesis**: Free 한도 100명 → 50명으로 줄이면 Free → Pro 전환 ↑

**큰 위험**:
- 기존 Free 사용자에게 적용? → backlash 확실
- 신규만? → 기존/신규 차별 → confusion

**Approach**:
- Treatment: 신규 가입자 only, 50명 한도
- Control: 기존 정책 유지

**결과 (2개월)**:
- 신규 Free → Pro 전환: 3% → 5%
- 그러나 Free 가입 자체 ↓ 25%
- 총 신규 Pro 사용자: 약간 ↑

**Decision**: Half-ship — 75명 한도로 (compromise).

---

### Case 4: Trial Length 실험

**Hypothesis**: 14-day trial → 7-day trial이 전환 ↑

**Variant**:
- Control: 14-day trial
- Treatment: 7-day trial

**결과 (1개월)**:
- Trial → Paid 전환: 25% → 35%
- 그러나 Trial start 자체 ↓ 5%
- 총 Paid 사용자: ↑ 5%

**Why**: 짧은 trial → urgency ↑ → 결제 결정 빨라짐

**Decision**: Ship Treatment.

**그러나 caveat**:
- 복잡한 product는 14일 필요할 수 있음
- 7일에 first value 도달 못 하면 churn ↑

---

## 7. Grandfathering Strategy

가격 인상 시 필수.

### 옵션 1: Permanent Grandfathering
- 기존 사용자 영원히 옛 가격
- 신뢰 ↑
- 매출 손실 ↑

### 옵션 2: Temporary Grandfathering (12~24개월)
- 12~24개월 후 점진적 인상
- 사전 6개월 communication
- 가장 균형

### 옵션 3: Plan Migration
- 기존 plan은 더 이상 가입 불가
- 기존 사용자는 그대로
- 신규 사용자만 새 plan

### 옵션 4: Plan Sunset (위험)
- 옛 plan 종료, 모두 새 plan으로
- Backlash 확실
- 6+ 개월 사전 공지 필수

### Communication

```
대상: 기존 사용자
시점: 변경 60~90일 전
채널: 이메일 + 인앱 + 블로그

내용:
1. 변경 사항 (구체적)
2. 변경 이유 (왜)
3. 영향 (얼마)
4. 선택지 (Grandfathered, Migration, Cancel)
5. 추가 가치 (왜 가격 인상 정당)
6. 시점 (언제부터)
7. 연락 (질문 시)
```

---

## 8. Pricing Experiment 안티패턴

### ❌ 1. 공개 가격 차별
같은 시점, 같은 페이지, 다른 사용자에게 다른 가격 → 발견 시 분노

→ 항상 same-time same-page 동일 가격. Variant는 다른 페이지로.

### ❌ 2. 기존 사용자 무경고 가격 인상
Notion 2023년 backlash 사례:
- 갑작스러운 가격 인상
- Communication 부족
- 사용자 SNS 분노

→ 60~90일 사전 공지, 명확한 가치 message.

### ❌ 3. 단기 metric만 측정
- "Conversion ↑" → Ship
- 6개월 후 churn 폭증 발견 → 너무 늦음

→ 항상 long-term 메트릭 (6개월+) 추적.

### ❌ 4. Sample size 부족
- 1주 후 "결과 좋아 보임" → ship
- 통계 유의 안 도달 → false positive

→ Sample size 계산 후 끝까지.

### ❌ 5. 단일 실험 결정
- 1 실험 결과로 전체 가격 정책 변경
- 외부 요인 (시즌, 경쟁사) 무시

→ Replication, 다른 segment 테스트.

### ❌ 6. Variant 너무 많음
- 6가지 가격 동시 테스트
- 각 variant sample 부족
- 분석 복잡

→ 2~3 variants만.

### ❌ 7. Cohort 분석 없음
- "Average 만 봄"
- 신규 vs 기존, 지역별 효과 다름

→ 항상 segment 분석.

---

## 9. Pricing Communication 전략

### 가격 인상 시 framing

#### ❌ 안 좋은 framing
- "가격 인상합니다"
- "비용이 올랐어요"
- "더 비싸게 받겠습니다"

#### ✅ 좋은 framing
- "X, Y, Z 기능 추가하며 가격 조정"
- "현재 사용자는 12개월 grandfathering"
- "더 큰 가치 → 정당한 가격"

### 가격 인하 시
- "더 많은 사용자에게 가치 전달하려 가격 인하"
- 위험: "예전이 너무 비쌌나?" 인식

### 무료화 (Free tier 도입)
- "더 많은 사용자에게 접근성 ↑"
- 유료 사용자: "그럼 내가 손해?" → 가치 강조

---

## 10. Pricing Experiment Quarterly Review

분기 review:
- [ ] 지난 분기 실험 결과 정리
- [ ] Learnings repository update
- [ ] 다음 분기 실험 계획 (1~2개 최대)
- [ ] Tier 구조 재검토
- [ ] 경쟁사 가격 vs 우리
- [ ] Cohort retention by price point
- [ ] LTV trend by price

---

## 11. Pricing Experiment Roadmap (예시)

| Quarter | Experiment | Hypothesis | Status |
|---------|-----------|-----------|--------|
| Q1 | Annual default | Annual ratio 30%→50% | Done ✅ |
| Q2 | Trial length 14→7 | Conversion ↑ | Done ✅ |
| Q3 | Price increase test (new users) | Revenue per visitor ↑ | Planning |
| Q4 | Tier name (Pro→Business) | Brand perception ↑ | Backlog |

---

## 12. Tools

| Tool | 용도 |
|------|------|
| Feature flag (LaunchDarkly, Statsig) | 가격 variant 분배 |
| Stripe / Toss | 결제 + Tier 관리 |
| PostHog / Amplitude | Conversion 추적 |
| 사용자 DB | 사용자별 가격 영구 저장 |
| Stripe Pricing Tables | 동적 가격 (사용자별) |
| Recurly / Chargebee | Subscription billing |
| Surveys (Typeform, Refiner) | Pre-launch research |

---

## 13. Legal / 한국 특수

### 가격 차별 (Price Discrimination)
- **개인별 다른 가격**: 가능, but 차별적 기준 (인종/성별) 불법
- **지역별 다른 가격**: 합법 (한국 vs 미국)
- **시점별 다른 가격**: 합법 (출시 시 vs 1년 후)
- **A/B test 가격**: Gray area, 사용자에게 가격 변경 가능 동의 필요

### 한국 시장 특이사항
- **부가세 표시**: ₩9,900 + 부가세 또는 ₩10,890 (VAT incl)
- **자동결제 동의**: 명시적 동의 필수 (전자금융거래법)
- **청약 철회**: 7일 (B2C, 디지털 콘텐츠는 즉시 사용 시 예외)
- **가격 인상 통보**: 30일 전 명확히

### B2B 협상 가격
- Public price + 협상 → 흔함
- Enterprise 50%+ off → 가능
- 그러나 작은 고객이 알면 분노 → NDA 권장

---

## Reference

- `templates/02-pricing-packaging.md` (가격 전략 기본)
- `templates/05-experimentation-plan.md` (A/B test 일반)
- `references/methodologies.md` (RICE 등)
