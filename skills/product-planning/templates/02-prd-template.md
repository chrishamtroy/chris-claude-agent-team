# PRD Template — 18 Sections

> Stripe/Linear/Notion 수준 PRD 템플릿. 글로벌 SaaS 표준.

---

# PRD — [프로젝트명]

> **Version**: v0.1 (Draft)
> **Author**: prd-writer agent
> **Stage**: 2/6
> **Status**: Draft / Review / Confirmed
> **Last updated**: YYYY-MM-DD
> **Stakeholders**: [PM, Designer, Eng Lead, Marketing, ...]

---

## 1. One-liner

[누구]를 위한 [무엇]을 [어떻게] 제공하는 [카테고리]

> 예: "강남 직장인을 위한 30분 보장 도시락 배달 서비스"

---

## 2. Goals

### 2.1 Business Goals
- 출시 후 3개월: ...
- 출시 후 6개월: ...
- 출시 후 1년: ...

### 2.2 User Goals
- 사용자가 [어떤 가치]를 얻음
- 사용자의 [무엇이] 개선됨

### 2.3 Non-Goals (이번 버전에 안 함)
- ...
- ...

---

## 3. Background & Why Now?

### 3.1 시장 컨텍스트
[Stage 0 market research 요약]

### 3.2 Why Now? (3 trends)
1. **[Trend 1]** — [영향]
2. **[Trend 2]** — [영향]
3. **[Trend 3]** — [영향]

### 3.3 우리가 이 기회를 잡아야 하는 이유
[Unfair Advantage]

---

## 4. Core Value Proposition

> **For** [target customer]
> **who** [statement of need],
> **our** [product] **is a** [category]
> **that** [statement of key benefit].
> **Unlike** [primary alternative],
> **our product** [differentiation].

---

## 5. Problem Statement

### 5.1 어떤 문제인가
[구체적, 측정 가능]

### 5.2 누구의 문제인가
[페르소나]

### 5.3 얼마나 큰 문제인가
- 빈도: ...
- 심각도: ...
- 영향 받는 인구: ...

### 5.4 현재 어떻게 해결되고 있는가
[Existing alternatives]

---

## 6. Solution Overview

### 6.1 우리의 해결책 (high-level)
[1단락 솔루션 설명]

### 6.2 핵심 작동 원리
1. ...
2. ...
3. ...

### 6.3 사용자가 받는 결과
- ...
- ...

---

## 7. Differentiation

### 7.1 경쟁자 매트릭스
| 차원 | 경쟁사 A | 경쟁사 B | 우리 |
|------|--------|--------|-----|
| [차원 1] | | | |
| [차원 2] | | | |
| [차원 3] | | | |

### 7.2 Unfair Advantage
[복제 불가능한 것]

---

## 8. Target Users

### 8.1 Primary Persona
[Stage 0/1 페르소나]

- 이름 / 데모그래픽
- JTBD (Functional/Emotional/Social)
- 행동 패턴
- 인용구

### 8.2 Secondary Persona
[있다면]

### 8.3 Anti-personas (이 사용자는 우리 타겟 아님)
- ...

---

## 9. User Scenarios

### 9.1 Scenario A: [페르소나 X의 메인 사용]
> "[페르소나]가 [상황]에서 [목표] 달성하기 위해..."
> 1. ...
> 2. ...

### 9.2 Scenario B: [Edge case 시나리오]
[권한 없음 / 오프라인 / 첫 사용 등]

---

## 10. High-level Features

각 기능에 RICE 점수 부여 (`02-rice-prioritization.md` 참조):

| 기능 | Priority | RICE | Description |
|------|---------|------|------------|
| [기능 1] | P0 | 3000 | ... |
| [기능 2] | P0 | 2400 | ... |
| [기능 3] | P1 | 1200 | ... |
| [기능 4] | P2 | 400 | ... |

상세는 `03-feature-spec.md` 참조.

---

## 11. Success Metrics

### 11.1 North Star Metric
**[메트릭 이름]**: [정의] — 목표 [수치]

### 11.2 Input Metrics (선행 지표)
1. ...
2. ...
3. ...

### 11.3 Guardrail Metrics (성능 저하 모니터링)
- Error rate < 0.1%
- P95 latency < 200ms
- Crash rate < 0.05%

→ 상세는 `05-analytics-plan.md`

---

## 12. Risks & Open Questions

### 12.1 Risk Matrix
| 리스크 | 영향도 | 가능성 | 대응 전략 |
|--------|------|------|--------|
| [리스크 1] | High | Medium | ... |
| [리스크 2] | Medium | High | ... |

### 12.2 Open Questions (의사결정 보류)
- [Q1] — 결정 필요 시점: YYYY-MM-DD
- [Q2] — ...

### 12.3 Assumptions (검증 필요)
- [가정 1] — 검증 방법: ...
- [가정 2] — ...

---

## 13. Scope

### 13.1 In Scope (이번 버전 포함)
- ...
- ...

### 13.2 Out of Scope (이번 버전 제외)
- ...
- ...
→ Out of scope 비어있으면 "모든 걸 다 하겠다"는 의미. 반드시 채울 것.

### 13.3 Future (다음 버전 고려)
- ...

---

## 14. ⭐ Hypothesis & Experimentation Plan

### 14.1 Primary Hypothesis
```
We believe [feature] for [users]
will result in [outcome].
We will know we are right when we see [measurable signal].
```

### 14.2 Pre-launch validation
- [ ] User interview N=5
- [ ] Prototype usability test
- [ ] Concierge MVP / Wizard of Oz test (해당 시)

### 14.3 Post-launch validation
- [ ] A/B test: [variant] vs [control]
- [ ] Sample size: N (80% power, 5% MDE)
- [ ] Duration: ~2 weeks
- [ ] Success criteria: ...
- [ ] Failure → Rollback or pivot

### 14.4 Counter-hypothesis (Inversion)
"만약 이 기능이 실패한다면..." 가장 가능성 높은 실패 시나리오 3가지:
1. ...
2. ...
3. ...

→ 상세 실험 설계: `05-experimentation-plan.md`

---

## 15. ⭐ Privacy & Compliance

### 15.1 수집 데이터
| 데이터 항목 | 민감도 | 목적 | 보관 기간 | 암호화 |
|-----------|------|-----|--------|------|
| 이메일 | PII | 인증 | 회원 탈퇴까지 | At-rest |
| ... | | | | |

### 15.2 적용 규제
- [ ] **GDPR** (EU 사용자)
- [ ] **CCPA** (캘리포니아)
- [ ] **한국 개인정보보호법** (PIPA)
- [ ] **PCI-DSS** (결제)
- [ ] **COPPA** (13세 미만)
- [ ] **HIPAA** (의료)
- [ ] 기타: ...

### 15.3 Data Subject Rights (DSR) 지원
- [ ] 열람권
- [ ] 정정권
- [ ] 삭제권 ("Right to be forgotten")
- [ ] 이동권
- [ ] 처리 거부권

### 15.4 보안 요구사항
- [ ] Transport: HTTPS / TLS 1.2+
- [ ] At-rest: AES-256
- [ ] 인증: OAuth 2.0 / OIDC
- [ ] Audit log
- [ ] Pen test 출시 전 1회

---

## 16. ⭐ Accessibility

### 16.1 준수 표준
- WCAG 2.1 AA (필수)
- ARIA 1.2

### 16.2 체크리스트
- [ ] 키보드 only 사용 가능
- [ ] 스크린 리더 호환 (VoiceOver, NVDA, JAWS)
- [ ] 색상 대비 4.5:1+ (텍스트), 3:1+ (UI)
- [ ] 색상만으로 정보 전달 ❌
- [ ] 폼 모든 입력 명시적 라벨
- [ ] Error 메시지 스크린 리더 announce
- [ ] Focus indicator 명확
- [ ] Skip navigation
- [ ] alt text 모든 의미 있는 이미지
- [ ] 동영상 자막

---

## 17. ⭐ Internationalization (i18n)

### 17.1 지원 언어
- v1: 한국어 (기본)
- v1.1: 영어
- v2: ...

### 17.2 기술 요구사항
- [ ] UI 텍스트 외부화 (.json/.po)
- [ ] 날짜/시간/숫자/통화 locale-aware
- [ ] Pluralization 규칙
- [ ] RTL 대응 (추후 확장)

### 17.3 Localization
- [ ] 한국: 토스/카카오페이
- [ ] 미국: Stripe / Apple Pay
- [ ] 일본: PayPay (해당 시)

---

## 18. ⭐ Telemetry & Analytics Plan

### 18.1 추적할 핵심 이벤트 (요약)
- user_signed_up
- onboarding_completed
- [핵심 기능]_initiated / completed / failed
- subscription_started
- ...

### 18.2 Funnel 정의
1. Acquisition: visitor → signup
2. Activation: signup → first value
3. Monetization: free → paid

### 18.3 Tools
- Product Analytics: PostHog / Amplitude / Mixpanel
- Web Analytics: Vercel Analytics + GA4
- Session Replay: PostHog / FullStory

→ 상세: `05-analytics-plan.md`

---

## Changelog

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| v0.1 | YYYY-MM-DD | | Initial draft |
| v0.2 | YYYY-MM-DD | | [변경 내용] |

---

## References

- One-pager: `02-one-pager.md`
- RICE: `02-rice-prioritization.md`
- TRD: `03-trd.md` (기술)
- Feature Spec: `03-feature-spec.md`
- User Flow: `04-user-flow.md`
- Analytics: `05-analytics-plan.md`
- Launch: `05-launch-plan.md`
