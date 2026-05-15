# Experimentation Plan Template

> Stage 5. A/B test 설계 + 분석 + 의사결정 protocol.

---

# Experimentation Plan — [프로젝트명]

> **Version**: v0.1
> **Reference**: 02-prd.md Section 14, 05-analytics-plan.md
> **Owner**: PM + Data Analyst

---

## 1. Experimentation Culture

### 원칙

1. **Hypothesis-driven**: 모든 실험은 명확한 가설로 시작
2. **One experiment at a time per area**: 영역당 1 실험 (overlap 시 분석 어려움)
3. **Pre-defined success criteria**: 실험 시작 전 합의
4. **No peeking**: Sample size 도달 전 결과 확인 ❌
5. **Document everything**: 결과/학습 모두 기록 (실패 포함)
6. **Action on insight**: 인사이트 → 의사결정 → 변경

---

## 2. Experiment Lifecycle

```
Hypothesis → Design → Implementation → Run → Analyze → Decide → Document
   ↑                                                              ↓
   └──────── Repository / Learnings ─────────────────────────────┘
```

---

## 3. Experiment Brief Template

각 실험 시작 전 작성.

### Experiment ID: `exp_[area]_[shorthand]`

예: `exp_onboarding_skip_tutorial`

### Hypothesis

```
We believe that [change]
for [user segment]
will result in [outcome].
We will know we are right when we see
[primary metric] move from [current] to [target].
```

**예시**:
> "We believe that onboarding 튜토리얼을 skip option으로 만드는 것이
> first-time users에게
> activation rate 개선을 가져올 것이다.
> Known when seeing Activation Rate move from 35% to 45%."

### Variants

| Variant | Description | Traffic % |
|---------|-----------|-----------|
| Control (A) | 현재 버전 (튜토리얼 강제) | 50% |
| Treatment (B) | 새 버전 (skip 가능) | 50% |

(Multi-armed test 가능: A/B/C, ...)

### Metrics

| Type | Metric | Direction |
|------|--------|----------|
| **Primary** | Activation rate | Increase |
| **Secondary** | Time to first value | Decrease |
| **Secondary** | Week 1 retention | Maintain or increase |
| **Guardrail** | Crash rate | No increase |
| **Guardrail** | Support tickets | No increase |

### Sample Size Calculation

```
Inputs:
- Baseline (current) conversion: 35%
- Minimum Detectable Effect (MDE): 5% relative (=1.75% absolute)
- Statistical power: 80%
- Significance level: 5% (one-sided) or 5% (two-sided)

Result: ~6,000 users per variant (총 12,000)
```

**Calculator**: https://www.evanmiller.org/ab-testing/sample-size.html

### Duration

- Sample size 도달 시 종료
- 최소 1주일 (요일 효과 흡수)
- 최대 4주 (외부 변화로 noise ↑)
- **Stop early ❌** (false positive 폭증)

### Target Audience

- [ ] All users
- [ ] New users only
- [ ] Specific segment: ...
- [ ] Geography: ...
- [ ] Platform: ...

### Implementation

- Feature flag: `flag_skip_tutorial`
- Assignment: User-level (not session)
- Stickiness: Permanent (한 번 배정되면 유지)
- Exclusion: Internal users, QA accounts

### Success Criteria (Pre-defined)

#### Go (Ship Treatment)
- Primary metric ↑ ≥ 5% (relative), p < 0.05
- No guardrail violation
- No serious negative secondary

#### Iterate
- Primary 영향 없음 but 학습 가치 있음
- 다른 segment에서 차별적 효과

#### Kill
- Primary metric ↓ statistically significant
- Or guardrail violation

### Risk Assessment (Pre-mortem)

"이 실험이 실패할 가능성 시나리오":
1. ...
2. ...

---

## 4. Sample Size Calculation 상세

### 공식 (간단)

$$n = \frac{2 \cdot (Z_{\alpha/2} + Z_\beta)^2 \cdot p(1-p)}{\Delta^2}$$

- $p$: baseline conversion
- $\Delta$: 절대 변화 (예: 0.35 → 0.40이면 0.05)
- $Z_{\alpha/2}$: 1.96 (95% conf)
- $Z_\beta$: 0.84 (80% power)

### 실용 가이드

| Baseline | MDE (relative) | Sample per variant |
|----------|--------------|--------------------|
| 5% | 10% | ~30,000 |
| 10% | 10% | ~15,000 |
| 20% | 10% | ~6,000 |
| 50% | 10% | ~2,000 |
| 10% | 20% | ~3,500 |
| 10% | 5% | ~60,000 |

→ Baseline 낮거나 MDE 작으면 sample size 폭증.

---

## 5. Analysis (Post-experiment)

### Statistical Tests

#### Frequentist
- Two-proportion Z-test (conversion 비교)
- T-test (continuous metric)
- Chi-square (categorical)

#### Bayesian (선호 회사 증가 추세)
- Beta-Binomial for conversion
- "Treatment 가 더 나을 확률" 직관적

### Decision Rules

```
IF Primary p-value < 0.05 AND Effect Size ≥ MDE:
   → Significant winner
ELSE IF p > 0.05 after full sample size:
   → No detectable difference (NOT "no difference")
ELSE IF guardrail violated:
   → Kill regardless of primary
```

### Segmentation Analysis

전체 결과 단일 ❌. 세그먼트별 분석:
- New vs Returning users
- Platform (web vs mobile)
- Geography
- Plan type
- Acquisition channel

세그먼트 간 차이 큼 → 더 정교한 실험 또는 segment-specific 출시

---

## 6. Anti-patterns

### Pre-experiment
❌ Hypothesis 없이 "한번 해보자"
❌ Success criteria 사전 미정의
❌ MDE 무한히 작게 (sample size 폭증)
❌ Multi-area 동시 실험 (영향 분리 어려움)

### During experiment
❌ Peeking (매일 결과 확인하면 false positive ↑)
❌ Sample size 도달 전 종료
❌ Treatment 만 조정 (실험 무효화)

### Post-experiment
❌ p-hacking (subgroup에서 significant 찾기)
❌ HARKing (Hypothesizing After Results Known)
❌ Negative 결과 무시 (학습 기회)
❌ Single experiment에 의존 (replication 없음)

---

## 7. Experiment Repository

### 모든 실험 추적

| Exp ID | Hypothesis | Result | Decision | Date | Owner | Link |
|--------|-----------|--------|--------|------|-------|------|
| exp_001 | ... | +5% Activation | Ship | 2026-01-15 | PM | [link] |
| exp_002 | ... | No detectable | Iterate | 2026-01-22 | PM | [link] |
| exp_003 | ... | -2% Retention | Kill | 2026-02-05 | PM | [link] |

### Learnings Library

각 실험에서 학습한 일반화 가능한 통찰:

> **Learning #1**: 한국 사용자에게 onboarding skip option은 activation 향상 + retention 영향 없음
> - 출처: exp_001
> - 관련 영역: Onboarding, Activation
> - 일반화: 강요된 단계는 frustration ↑, optionality 제공이 retention 안 해침

> **Learning #2**: ...

장기 축적 = 우리만의 "playbook"

---

## 8. 출시 직후 실행할 실험 (Launch 후 첫 2주)

### Experiment Queue (출시 후 우선 실행)

| Priority | Experiment | Hypothesis | Expected Impact |
|---------|-----------|-----------|----------------|
| P0 | exp_onboarding_skip | activation ↑ | +5-10% activation |
| P0 | exp_pricing_default_annual | 연간 비율 ↑ | +15% ARR |
| P1 | exp_email_subject_variants | open rate ↑ | +20% open |
| P1 | exp_dashboard_layout | engagement ↑ | +5% DAU |
| P2 | ... | ... | ... |

각 실험 brief 별도 작성.

---

## 9. Holdout Group (선택)

장기 영향 측정용. 일부 사용자(5%)는 모든 신규 기능 제외.

- 전체 신규 기능 + 변화의 누적 효과 측정
- 6개월 ~ 1년 단위
- Holdout vs Treatment의 LTV/Retention/NRR 비교

→ Mature stage에서 유용 (Stripe, Linkedin 사용)

---

## 10. Experimentation Maturity

| Level | Capability |
|-------|-----------|
| 0 | 실험 없음 (HiPPO 의사결정) |
| 1 | Ad-hoc 실험, 분석 단편적 |
| 2 | 표준 process, 일관된 sample size |
| 3 | Hypothesis library, Learning repo |
| 4 | Continuous experimentation, 매주 5+ 실험 |
| 5 | Causal inference, Holdout, Long-term LTV measurement |

목표: Level 3 (1년 차), Level 4 (3년 차).
