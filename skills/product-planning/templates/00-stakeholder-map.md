# Stakeholder Management Template

> Stage 0~5 어디서나 참조. PM의 가장 큰 work-time 소요.

---

# Stakeholder Map — [프로젝트명]

> **Owner**: PM
> **Update frequency**: Quarterly

---

## 1. Stakeholder 식별

### Mind Map
프로젝트 영향 받는 모든 사람/조직:

```
[프로젝트]
   ├─ 내부
   │   ├─ Executive (CEO, CTO, CFO)
   │   ├─ Product (PM peers, Director of Product)
   │   ├─ Engineering (TL, Senior Eng, Junior Eng)
   │   ├─ Design (Lead, Designer)
   │   ├─ Marketing
   │   ├─ Sales
   │   ├─ CS / Support
   │   ├─ Legal
   │   ├─ Finance
   │   └─ Operations
   │
   └─ 외부
       ├─ Users (현재)
       ├─ Prospects (잠재 사용자)
       ├─ Customers (B2B)
       ├─ Partners (integration, channel)
       ├─ Investors
       ├─ Press
       ├─ Regulators
       ├─ Vendors (Supabase, Clerk, etc)
       └─ Competitors (intel 차원)
```

---

## 2. Power / Interest Grid

각 stakeholder를 매트릭스에 배치:

```
        Interest LOW           Interest HIGH
       ┌──────────────────┬──────────────────┐
P. HIGH│ Keep Satisfied   │ Manage Closely  │
       │ (informed but    │ (top priority,  │
       │  minimal effort) │  high touch)    │
       ├──────────────────┼──────────────────┤
P. LOW │ Monitor          │ Keep Informed   │
       │ (minimal effort) │ (regular updates)│
       └──────────────────┴──────────────────┘
```

### Our Project Mapping

| Stakeholder | Power | Interest | Quadrant | Action |
|-----------|-------|---------|---------|--------|
| CEO | High | High | Manage Closely | Weekly 1:1 |
| CTO | High | High | Manage Closely | Bi-weekly sync |
| Sales Lead | Medium | High | Keep Informed | Weekly digest |
| CFO | High | Low | Keep Satisfied | Monthly update |
| Marketing | Medium | High | Manage Closely | Weekly sync |
| Legal | Medium | Medium | Keep Informed | Ad-hoc |
| External users | Low | High | Keep Informed | Newsletter + Beta |
| Press | Low | Variable | Monitor | T-30 outreach |
| Regulators | Variable | Low usually | Monitor | Compliance review |

---

## 3. Stakeholder Profile (per person)

각 핵심 stakeholder별 상세:

### [Stakeholder Name]
- **Role**: ...
- **Quadrant**: Manage Closely / Keep Satisfied / etc
- **What they care about**: ...
- **What they fear**: ...
- **Their primary metric**: ...
- **Communication style**: Verbal / Written / Data-driven
- **Decision style**: Fast / Slow / Data-only / Intuition
- **Time zones**: ...
- **Preferred channel**: Slack / Email / In-person
- **Update frequency**: Daily / Weekly / Monthly
- **Influence on this project**: High / Medium / Low

### 예시: CTO

- **What they care about**: Engineering quality, tech debt, hiring
- **What they fear**: Outage, security breach, talent attrition
- **Their primary metric**: Engineering velocity, uptime
- **Communication style**: Data + diagrams
- **Decision style**: Considered, evidence-based
- **Preferred channel**: GitHub PR + Notion
- **Update frequency**: Bi-weekly 1:1
- **What I need from them**: Tech direction approval, eng resource allocation

---

## 4. Communication Plan

### 채널별 빈도

| Channel | 빈도 | Audience |
|---------|------|---------|
| All-hands | 분기 | 전사 |
| Product weekly | 주 | Product, Eng, Design |
| Exec sync | 주/격주 | Executive |
| 1:1 | 주 | Direct stakeholders |
| Newsletter | 월 | All employees |
| Public blog | 주/월 | External |
| Slack updates | 일 | Team |

### Document별 audience

| Document | Read by |
|----------|--------|
| One-pager (PR/FAQ) | Executive, Marketing, Sales |
| PRD | Product, Eng, Design, Marketing |
| TRD | Eng, Security |
| Feature spec | Eng, Design, QA |
| Launch plan | All stakeholders |
| Analytics plan | PM, Data, Eng |
| Decision Log (ADR) | All decision makers |

---

## 5. Alignment Meetings

### Kick-off (Stage 0)
- **Attendees**: PM, key stakeholders
- **Outcome**: Goals, scope, timeline, RACI

### Weekly Status
- **Attendees**: Core trio + key stakeholders
- **Format**: 5-min written + 30-min sync
- **Content**: Progress, risks, asks

### Stage Gate Reviews
- **Attendees**: Decision makers + reviewers
- **Format**: Review documents + Q&A
- **Decision**: Proceed / Pivot / Stop

### Pre-launch Review
- **Attendees**: All stakeholders
- **Outcome**: Final go/no-go

### Post-launch Retro
- **Attendees**: All stakeholders
- **Outcome**: Learnings, action items

---

## 6. RACI per Major Decision

큰 결정마다 RACI 명시:

| Decision | R (do) | A (sign-off) | C (consulted) | I (informed) |
|----------|--------|-----------|-----------|---------|
| Product strategy | PM | Head of Product | Marketing, Sales | Eng, Design |
| Tech stack | TL | CTO | PM, Senior Eng | Design |
| Pricing | PM | CFO + CEO | Sales, Marketing, Finance | All |
| Launch date | PM | CEO | Marketing, Sales, Eng | All |
| Privacy/Security | TL | CISO + Legal | PM | All |
| Brand/Messaging | Marketing | CMO | PM, Design | All |

---

## 7. Stakeholder Resistance 처리

### Type 1: Confused (정보 부족)
- **Signal**: 질문 많음, 같은 질문 반복
- **Action**: 더 자주 + 단순한 업데이트, FAQ

### Type 2: Disagree (다른 의견)
- **Signal**: 반대 의견, 대안 제시
- **Action**: 1:1 미팅, 그들의 우려 깊이 듣기, 데이터로 응답
- "Disagree and commit" framework

### Type 3: Lacking Authority (다른 사람 동의 필요)
- **Signal**: "내 boss와 얘기해야"
- **Action**: 직접 boss와 미팅 + 그들도 참석

### Type 4: Power Play (정치)
- **Signal**: 합리적 reasons 없이 반대, 정보 hold
- **Action**: 위로 escalate, 1:1로 motivation 파악

### Type 5: Frustrated (감정적)
- **Signal**: 화 / 답답함
- **Action**: 1:1 emotion 인정, 그들의 입장 듣기

---

## 8. Influence without Authority

PM은 보통 decision authority 없음. 영향력만으로 alignment:

### Tactic 1: Data Storytelling
- 메트릭으로 case 만들기
- "고객 인터뷰 N건에서 같은 문제"
- "Competitor가 이미 함"

### Tactic 2: Pre-meeting Alignment
- 미팅 전 핵심 stakeholder 1:1로
- "큰 그림 align" 후 미팅 → 미팅은 confirmation
- "No surprises in meetings"

### Tactic 3: Reciprocity
- 그들에게 도움 먼저
- 그 후 협조 요청

### Tactic 4: Coalition Building
- 영향력 있는 동맹 만들기
- 직접 반대 아닌 동맹의 발언으로

### Tactic 5: Frame as Choice
- "A 또는 B 중 선택" (옵션 제시)
- Yes/No 보다 결정 쉬움

### Tactic 6: Disagree and Commit
- 토론 후 결정 → 모두 commit
- 결정 후 sniping ❌

---

## 9. External Stakeholders (Customers)

### Customer Advisory Board (CAB)
- 8~12명 핵심 고객
- 분기 미팅
- 향후 roadmap feedback
- Beta access

### Customer Office Hours
- 월 1회 공개 office hour
- 어느 고객이나 PM과 직접 대화
- 실시간 피드백

### Customer Newsletter
- 월간 (또는 격월)
- 출시 기능, upcoming, 사례
- 클릭률 / 응답 추적

### NPS / Survey
- 분기 NPS
- 분기 CSAT
- 자유 피드백 분석

---

## 10. Investor / Board Updates

### Format
- 분기 board deck
- 월간 investor update (이메일)

### Content
- Top metrics (NSM, MRR, growth, churn)
- This month wins
- This month challenges
- Asks (intros, advice)
- Cash runway

### 정직성
- 좋은 소식 + 나쁜 소식 균형
- Surprises 최소화
- 데이터 truthful

---

## 11. Press / Media Relations

### Pre-launch
- Embargoed brief (T-14일)
- Demo + Q&A
- Press kit 제공

### Post-launch
- Follow-up 인터뷰
- 데이터 share (출시 결과)
- Thought leadership (블로그)

### Crisis
- Single spokesperson
- Pre-prepared statements
- "No comment" 회피
- Update 후 30분 내 응답

---

## 12. Stakeholder Map 정기 업데이트

분기마다:
- 새 stakeholder 추가?
- Power/Interest 변화?
- 새 정치적 dynamics?
- Communication 효과적?

조직 변화 시 즉시 update.
