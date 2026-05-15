# Analytics Plan Template

> Stage 5 산출물. North Star + Event Taxonomy + Funnels + Dashboards.

---

# Analytics Plan — [프로젝트명]

> **Version**: v0.1
> **Reference**: 02-prd.md Section 11, 03-feature-spec.md
> **Owner**: Data Analyst + PM

---

## 1. North Star Framework

### North Star Metric (NSM)

**Definition**: [정확한 정의]
**Formula**: [측정 방법]
**Current**: [현재 값 또는 0]
**Target T+90**: [목표]
**Target T+365**: [목표]

**Why this NSM?**
- 고객 가치 반영: ...
- 회사 성장과 연결: ...
- 팀이 직접 영향 가능: ...
- 선행 지표: ...

### Input Metrics (NSM에 직접 영향)

| Metric | Definition | Target | Owner |
|--------|-----------|--------|-------|
| [Input 1] | ... | ... | |
| [Input 2] | ... | ... | |
| [Input 3] | ... | ... | |

### Guardrail Metrics (성능/품질 저하 모니터링)

| Metric | Threshold | Alert Channel |
|--------|----------|--------------|
| Error rate | < 0.1% | PagerDuty |
| P95 latency | < 200ms | Slack #alerts |
| Crash rate | < 0.05% | Sentry → Slack |
| CSAT | > 4.0 | Weekly review |
| Churn rate | < 5%/mo | Monthly review |

---

## 2. Event Taxonomy

### Naming Convention

Format: `[object]_[verb-past]`

- ✅ `user_signed_up`
- ✅ `subscription_started`
- ✅ `feature_x_completed`
- ❌ `signup` (object/verb 불분명)
- ❌ `clickSignupButton` (camelCase, 너무 구체적)
- ❌ `event_1` (의미 없음)

### Standard Properties (모든 이벤트에 포함)

```json
{
  "user_id": "uuid",
  "session_id": "uuid",
  "timestamp": "ISO-8601",
  "platform": "web" | "ios" | "android",
  "app_version": "1.2.3",
  "user_type": "free" | "pro" | "team" | "enterprise",
  "experiment_variants": { "exp_name": "variant_id" }
}
```

### Event Catalog

#### Lifecycle Events (AAARRR)

##### Acquisition
- `page_viewed` — properties: page_name, referrer, utm_*
- `landing_visited` — properties: source, campaign

##### Activation
- `user_signed_up` — properties: method (email/google/kakao), source
- `email_verified`
- `onboarding_started`
- `onboarding_step_completed` — properties: step_number, step_name
- `onboarding_completed` — properties: duration_seconds, steps_completed
- `first_value_experienced` — properties: feature, time_to_value_seconds **← Activation 핵심**

##### Engagement
- `[feature]_initiated`
- `[feature]_completed`
- `[feature]_failed` — properties: error_type
- `[feature]_abandoned` — properties: last_step
- `session_started`
- `session_ended` — properties: duration_seconds

##### Monetization
- `pricing_viewed`
- `plan_selected` — properties: plan_name, billing_cycle
- `checkout_started`
- `checkout_completed` — properties: plan, amount, currency, payment_method
- `checkout_abandoned` — properties: last_step
- `subscription_renewed`
- `subscription_cancelled` — properties: reason

##### Retention
- `app_opened`
- `feature_engagement_30d` — habitual usage 측정
- `notification_received`
- `notification_clicked` — properties: notification_type

##### Referral
- `invite_sent` — properties: channel (email/link/social)
- `invite_accepted`
- `nps_submitted` — properties: score (0-10), comment

#### Feature-specific Events
[기능별 4가지 표준 이벤트 — `03-feature-spec.md` 참조]

---

## 3. Conversion Funnels

### Funnel 1: Acquisition → Activation

```
Landing page visit
↓ X% (Step 1 conversion)
Signup form viewed
↓ X%
Signup completed
↓ X%
Email verified
↓ X%
Onboarding completed
↓ X%
⭐ First value experienced (Activation)
```

**Activation 정의**: [무엇이 핵심 가치 경험인가]
**예시**:
- Slack: 워크스페이스에 2000 메시지 (팀 차원)
- Dropbox: 1개 파일 업로드 + 다른 기기에서 열기
- Figma: 1개 디자인 공유

### Funnel 2: Activation → Monetization

```
Activated user
↓ X%
Pricing page viewed
↓ X%
Plan selected
↓ X%
Checkout started
↓ X%
⭐ Subscription started
```

### Funnel 3: First Subscription → Retention

```
Subscription started
↓ X%
Week 1 active
↓ X%
Week 4 active (1 month)
↓ X%
⭐ Month 3 active
```

---

## 4. Cohort Analysis

### Retention Curves (week-by-week)

Cohort = 같은 주에 가입한 사용자.

| Cohort | Week 0 | Week 1 | Week 2 | Week 4 | Week 8 | Week 12 |
|--------|--------|--------|--------|--------|--------|---------|
| Jan 1주차 | 100% | 50% | 35% | 25% | 22% | 20% |
| Jan 2주차 | 100% | 55% | 40% | 30% | 25% | - |
| ... | | | | | | |

**Healthy Retention Curve**:
- 처음 급락 후 평탄화 (smile curve) → PMF 신호
- 계속 하락 → PMF 없음 → 핵심 가치 재정의 필요

### Segment별 Retention
- By acquisition channel
- By plan type
- By feature usage
- By geography

---

## 5. Dashboards

### Daily Dashboard (자동 갱신)
- DAU
- 신규 가입자
- Critical errors (real-time)
- P95 latency
- Today's revenue
- Active experiments

### Weekly Dashboard
- WAU
- W/W growth
- 핵심 funnel conversion rates
- Top features by usage
- Churn this week
- Support ticket volume

### Monthly Dashboard
- MAU
- MRR / ARR
- Net Revenue Retention (NRR)
- LTV / CAC
- Cohort retention
- NPS score
- Customer Health Score distribution

### Quarterly Business Review (QBR)
- OKR progress
- Strategic experiments outcomes
- Customer interviews insights
- Roadmap progress
- Financial KPIs

---

## 6. A/B Testing Setup

### 실험 인프라

| 항목 | Choice | 이유 |
|------|--------|------|
| Feature flagging | LaunchDarkly / Vercel Flags / Statsig | |
| Experiment platform | PostHog / Amplitude / Optimizely | |
| Stat method | Frequentist / Bayesian | |

### Experiment Naming
Format: `exp_[area]_[hypothesis-shorthand]`
- 예: `exp_onboarding_skip_tutorial`
- 예: `exp_pricing_annual_discount_30pct`

→ 상세 실험 설계: `05-experimentation-plan.md`

---

## 7. Tools Stack

| Layer | Tool | Why |
|-------|------|-----|
| Product analytics | PostHog (open source, self-hostable) | 가성비, EU 데이터 위치 |
| Web analytics | Vercel Analytics + GA4 | Vercel 통합 |
| Error tracking | Sentry | 업계 표준 |
| Session replay | PostHog / FullStory | UX 인사이트 |
| Heatmaps | Hotjar / PostHog | |
| User feedback | Canny / Pendo | |
| Surveys/NPS | Delighted / Refiner | |
| Data warehouse | BigQuery / Snowflake | (Scale 시) |
| ETL | Fivetran / Segment | (Scale 시) |
| Reverse ETL | Census / Hightouch | (CDP 시) |
| BI | Metabase (OSS) / Looker | |

### Privacy 고려
- 모든 도구 GDPR/PIPA 준수 확인
- 쿠키 동의 배너
- IP 익명화
- PII 분리 저장

---

## 8. PostHog 구현 예시

### 클라이언트 (Next.js)
```typescript
import posthog from 'posthog-js'

// _app.tsx
posthog.init(process.env.NEXT_PUBLIC_POSTHOG_KEY!, {
  api_host: 'https://app.posthog.com',
  capture_pageview: true,
  autocapture: false, // 명시적 이벤트만
})

// 이벤트 추적
posthog.capture('user_signed_up', {
  method: 'email',
  source: 'pricing_page'
})

// 사용자 식별
posthog.identify(userId, {
  email: user.email,
  user_type: 'pro',
  signup_date: user.createdAt
})

// 그룹 (B2B)
posthog.group('company', companyId, {
  name: 'Acme Inc',
  plan: 'enterprise'
})
```

### 서버 사이드 (Node.js)
```typescript
import { PostHog } from 'posthog-node'

const client = new PostHog(process.env.POSTHOG_KEY!, {
  host: 'https://app.posthog.com',
})

client.capture({
  distinctId: userId,
  event: 'subscription_started',
  properties: {
    plan: 'pro',
    amount: 19,
    currency: 'USD',
    billing_cycle: 'monthly'
  }
})
```

---

## 9. PII 처리

❌ Event properties에 절대 넣지 말 것:
- 이메일 (해시 OK)
- 전화번호
- 실명
- 비밀번호 (말할 것도 없음)
- 신용카드 정보
- 주민등록번호

✅ 사용자 테이블에만 저장 + user_id로 join.

---

## 10. Data Quality Checks (월간)

- [ ] 모든 핵심 이벤트가 발생하는가? (sampling 검증)
- [ ] Property naming convention 일관?
- [ ] Duplicate events 없음?
- [ ] User identification 정상?
- [ ] Funnel drop-off 합리적?
- [ ] Cohort 데이터 시간 흐름 정상?
- [ ] PII가 잘못 들어가지 않았는가?

---

## 11. Insight → Action 루프

### Weekly Insight Meeting
1. Top metrics 변화
2. Funnel 변화 (어디서 drop-off 증가?)
3. Cohort retention 변화
4. New insights (사용자 인터뷰 + 데이터)
5. **Action items** (이번 주에 무엇 시도?)

### Insight Repository
- 모든 인사이트 문서화 (Notion/Linear)
- 시간 흐름에 따라 추적
- 의사결정에 사용된 인사이트 명시
- 잘못된 인사이트도 기록 (학습)

---

## 12. 안티패턴 회피

❌ Vanity metrics ([Total signups, Page views] 단독)
❌ Activity ≠ Value 혼동
❌ 너무 많은 메트릭 (50개 dashboard)
❌ 자동수집 의존 (의도된 이벤트 누락)
❌ Naming convention 무시
❌ Cohort 분석 없이 trend만
❌ "데이터 있으면 좋겠다" (가설 없는 수집)
✅ Hypothesis → Event 정의 → Implementation → Insight → Action
