# Pricing & Packaging Playbook

> Stage 2 PRD에서 참조. B2B SaaS / B2C 가격 전략 playbook.
> Stripe, Notion, Linear, Vercel의 가격 패턴 분석 + 한국 시장 적용.

---

## 1. Pricing 결정의 4가지 차원

### 1.1 Value-based (가치 기반) ← 권장
- 사용자가 얻는 가치 기준
- "이 도구가 월 100만원 가치라면 → ₩200,000~₩500,000 받기"
- 어렵지만 마진 ↑

### 1.2 Cost-plus (원가 + 마진)
- 우리 비용 + 30~50% 마진
- 쉬움
- 가치 못 잡음

### 1.3 Competition-based (경쟁사 기준)
- 경쟁사 가격 ± 20%
- 쉬움
- 차별화 어려움

### 1.4 Penetration (시장 침투)
- 일단 낮게 진입, 점유 후 인상
- 위험: 가격 인상 시 churn

**추천 조합**: Value-based + Competition-based 검증.

---

## 2. Packaging Pattern

### 2.1 SaaS 표준: 3-tier

| Tier | Target | Features | Price (예시) |
|------|--------|---------|------------|
| **Free / Personal** | 개인, 평가 | Core 50%, 1 user | $0 |
| **Pro / Team** | SMB, small team | All core + collab | $10~50/user/mo |
| **Business / Enterprise** | 대기업 | + SSO, audit, SLA | $100+/user/mo (or talk to sales) |

### 2.2 Why 3-tier?
- **Anchoring**: Enterprise가 Pro를 싸게 보이게
- **Self-selection**: 사용자가 본인 tier 선택
- **Upgrade path**: 명확한 upgrade 동기
- **Decoy effect**: Middle tier가 매력적 보임

### 2.3 4-tier 함정
- 분석 복잡
- 사용자 선택 마비
- "Pro Plus" 같은 모호 이름

### 2.4 Single-tier 함정
- Upsell 못함
- Plan 변경 동기 없음

---

## 3. Pricing Axis (무엇으로 가격 책정?)

### 3.1 Per-seat (사용자 수)
- **장점**: 예측 가능, B2B 표준
- **단점**: 사용 안 해도 비용 → "phantom seats"
- **예시**: Notion, Linear, Slack, Figma

### 3.2 Per-usage (사용량)
- **장점**: 가치와 정렬
- **단점**: 예측 불가, 청구서 ↑ 불만
- **예시**: AWS, OpenAI API, Twilio

### 3.3 Feature-based
- **장점**: 명확한 upgrade 동기
- **단점**: Feature creep, packaging 복잡
- **예시**: HubSpot, Mailchimp

### 3.4 Hybrid (조합)
- Per-seat + Per-usage cap
- Per-seat + Feature gate
- **예시**: Vercel (seats + bandwidth + builds)

### 3.5 Outcome-based (드물지만 강력)
- ROI 일정 % 또는 결과당 fee
- **예시**: Marketing agency, performance ads

---

## 4. Free vs Freemium vs Free Trial

### 4.1 Free (영구 무료, 기능 제한)
- **언제**: Network effect 필요, 바이럴 product
- **위험**: 영원히 안 사는 사용자
- **예시**: Slack (메시지 10K 보관 limit), Notion (예전)

### 4.2 Freemium (무료 + Premium upgrade)
- **언제**: Free에서 가치 경험 후 자연 upgrade
- **위험**: Free 사용자가 너무 많음 → support 비용
- **Free → Paid 전환율**: 보통 2~5%

### 4.3 Free Trial (시간 제한 무료)
- **언제**: B2B, complex product
- **기간**: 14일 (표준) 또는 30일
- **결제 정보 미리 vs 나중에**:
  - Stripe-style: 카드 사전 등록 → trial 후 자동 charge (전환율 ↑, 신뢰 ↓)
  - Linear-style: 카드 없이 시작 → trial 끝 후 결제 안내 (신뢰 ↑, 전환 ↓)

### 4.4 No Free Tier
- Enterprise / Niche / High-value
- 모든 사용자 paid
- **예시**: Superhuman ($30/mo), Linear Business (이전)

---

## 5. Billing Cycle

| Cycle | 할인 | 사용자 심리 |
|-------|------|---------|
| **Monthly** | 0% | 부담 ↓, churn 쉬움 |
| **Annual** | 15~20% | 헌신 ↑, churn 어려움 |
| **2-year** | 30%+ | Enterprise commitment |

**기본값**: Annual (default selected) → 비율 ↑

---

## 6. 가격 책정 워크플로우

### Step 1: Customer Value Quantification
- 사용자가 우리 도구로 얻는 결과는?
- 그 결과의 $ 가치는?
- 예: "월 10시간 절약 × $50/h = $500 가치"

### Step 2: Willingness to Pay (WTP) Survey
**Van Westendorp Price Sensitivity Meter**:
1. "이 가격에 비싸다고 느낄 가격은?" (Too Expensive)
2. "비싼 편이지만 살 만한 가격은?" (Expensive)
3. "싸다고 느끼지만 품질 신뢰 가능한 가격은?" (Cheap)
4. "너무 싸서 품질 의심되는 가격은?" (Too Cheap)

→ 4개 선의 교차로 가격 범위 결정.

### Step 3: Competitor Pricing Audit
- 직접 경쟁자 3개
- 간접 (대체재) 3개
- 평균 + 표준편차

### Step 4: Cost & Unit Economics
- Variable cost per user
- LTV/CAC 3:1 이상?
- Payback period < 12개월?

### Step 5: Pricing 후보 3개 만들기
- Low (10-30% 낮음)
- Mid (시장 평균)
- High (10-30% 높음)

### Step 6: A/B Test (가능시)
- Landing page에 가격 변형
- Conversion rate 비교
- 신뢰 fragile: 기존 사용자 인상 시 churn risk

### Step 7: Launch + Iterate
- 12~18개월 후 가격 인상 가능
- 새 plan으로 grandfathering

---

## 7. Price Anchoring 기법

### 7.1 Decoy
3-tier 중 Middle이 매력적 보이게:
- Basic: $10
- **Pro: $20 (인기)**
- Premium: $50

Premium이 anchor → Pro가 "합리적" 보임.

### 7.2 Strikethrough Pricing
~~$50~~ **$20**

### 7.3 Yearly Default
Monthly $20 vs Yearly $192 (20% off)
→ Yearly default selected.

### 7.4 Per-day Framing
"$1/day" vs "$30/month"
→ 같지만 작아 보임.

### 7.5 Bundling
3 features for $20 vs 1 feature for $10 each

---

## 8. Common Pricing Mistakes

### 8.1 Underpricing
- "사람들이 살까?" 두려움
- 진짜 문제: 메시지/제품 모자람
- 해결: 진짜 가치 명확화 → 자신 있게

### 8.2 Too Many Tiers
- 5~6 tier → 결정 마비
- 권장: 3 (간혹 4)

### 8.3 Hidden Pricing (B2B만 talk to sales)
- 모든 tier "Contact us" → 진입장벽 ↑
- 예외: True enterprise (≥$50K ARR)

### 8.4 Grandfathering 안 하기
- 가격 인상 시 기존 사용자에 같이 적용 → churn
- 권장: Old 사용자 12~24개월 grandfathering

### 8.5 가격 = 마케팅 후순위
- 제품 만든 후 가격 결정
- 실제: 가격 = 제품의 일부 (Pricing is product)

---

## 9. 한국 시장 가격 특수성

### 9.1 글로벌 그대로 적용 ❌
- $X = ₩X×1300 → "비싸다"
- 한국 평균 SaaS 가격 더 낮음

### 9.2 Local Currency Pricing
- ₩X,000 (천원 단위)
- 부가세 별도 vs 포함 명시

### 9.3 결제 수단 다양화
- 카드 (Visa/Master/Amex 모두)
- 토스 / 카카오페이
- 네이버페이
- 휴대폰 결제 (특히 B2C)
- 가상계좌 (B2B)

### 9.4 세금계산서 (B2B 필수)
- 사업자번호 입력 → 자동 발행
- 미발행 시 B2B 결제 불가

### 9.5 한국 + 글로벌 가격 분리
- 한국 사용자: ₩가격
- Global: $가격
- 자동 detect (IP, browser locale)

---

## 10. 예시 가격 결정

### NewGen (주일학교 SaaS) 가격 예시

#### Tier 분석

| Tier | Target | Features | Price |
|------|--------|---------|------|
| **Free** | 작은 교회 (학생 < 30명) | Core 기능, 1 교역자 | ₩0 |
| **Pro** | 중형 교회 (30~150명) | 모든 기능, 교역자 무제한 | ₩99,000/월 |
| **Business** | 대형 교회 (150+) | + 알림톡, 분석, SLA | ₩299,000/월 |

#### 결정 근거
- 작은 교회: 예산 ↓, free → 입소문 + Pro upgrade 예상
- 중형 교회: ₩100K가 carrier (의사결정 쉬움)
- 대형 교회: 알림톡 비용 separate 가능

#### Annual 할인
- 12개월 = 10개월 가격 (17% off)

#### 결제 수단
- 카드 + 토스 + 세금계산서

---

## 11. 가격 인상 가이드

### When to raise
- LTV ↑ 명확 (기능 추가, 가치 ↑)
- 시장 가격 평균 상승
- 무료 단계 → 유료 (점유 후)

### How
1. **Grandfathering**: 기존 12~24개월 유지
2. **Communication**: 60일 전 공지
3. **새 가치 제시**: 가격 인상 이유 명확
4. **Tier 재구성** 옵션: 새 tier 추가, 옛 tier 가격 인상

### Risks
- Churn ↑ (예상 5~15%)
- 부정적 SNS (Notion 2023 가격 인상 backlash)
- 경쟁사 가격 인상 안 함 → 비교 ↑

---

## 12. PRD에서 Pricing 섹션 (PRD Section 13 또는 별도)

```markdown
## Pricing & Packaging

### Model: [Per-seat / Per-usage / Hybrid]

### Tiers
| Tier | Target | Price | Features |
|------|--------|-------|---------|
| ... | ... | ... | ... |

### Key Decisions
- Free vs Trial: ...
- Annual default: yes/no
- Currency: ₩ (Korea) + $ (Global)

### Unit Economics
- LTV: ₩X
- CAC: ₩Y
- LTV/CAC: Z
- Payback: M months

### Open Questions
- ...
```
