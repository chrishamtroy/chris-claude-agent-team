# Roadmap Template — Now / Next / Later + Quarterly OKR

> Stage 1~5 어디서나 참조. Outcome-based roadmap.
> Linear, Vercel, Stripe 스타일.

---

# Roadmap — [프로젝트명]

> **Last updated**: YYYY-MM-DD
> **Owner**: PM
> **Stage**: Discovery / Beta / GA / Growth

---

## 1. Roadmap Philosophy

### Outcome-based > Output-based

❌ **Output Roadmap** (안티패턴):
> "Q1: 로그인 기능, Q2: 결제 기능, Q3: 모바일 앱"
>
> 문제: 기능 약속. 우선순위 바뀌면 약속 깨짐.

✅ **Outcome Roadmap**:
> "Q1: Activation 35% → 45% (Onboarding 개선)"
> "Q2: Free → Paid 전환 3% → 5% (Pricing experiment)"
> "Q3: Retention W4 25% → 40% (Habit-forming features)"
>
> 좋은 점: 결과 약속. 방법은 유연.

### Now / Next / Later 모델

```
NOW (이번 분기 진행 중)
  - Outcome 1 + 솔루션 후보
  - Outcome 2 + 솔루션 후보

NEXT (다음 분기 후보)
  - Outcome 3 (가능성)
  - Outcome 4 (가능성)

LATER (1년 이내 가능성)
  - Outcome 5 (vision)
  - Outcome 6 (vision)
```

**확실성 ↓ 따라 거리 ↑.** Now만 확약, Next/Later는 방향 표시.

---

## 2. Quarterly OKR

### Quarter: [YYYY Qx]

#### Company OKR
**O**: [Strategic objective]
- KR1: [Quantitative measurable]
- KR2: ...
- KR3: ...

#### Product OKR (Company OKR 일부)
**O**: [Product objective]
- KR1: ...
- KR2: ...
- KR3: ...

#### Team OKR (Product OKR 일부)
**O**: [Team objective]
- KR1: ...

---

## 3. Now (현재 분기, 확정)

### Outcome 1: [Description]

**Why**: ...
**Hypothesis**: ...
**Target metric**: [Current] → [Target]
**Owner**: PM ___
**Status**: 🟢 In progress / 🟡 At risk / 🔴 Off track

**Solutions being explored**:
- Solution A: [Feature/experiment 1]
- Solution B: [Feature/experiment 2]
- Solution C: [Feature/experiment 3]

→ Opportunity Solution Tree 참조

---

### Outcome 2: [Description]

[같은 구조]

---

### Outcome 3: [Description]

[같은 구조]

---

## 4. Next (다음 분기 가능성)

| Outcome | Why | Confidence | Dependencies |
|---------|-----|----------|------------|
| [Outcome A] | ... | High/Med/Low | ... |
| [Outcome B] | ... | ... | ... |
| [Outcome C] | ... | ... | ... |

⚠️ Next는 약속 아닌 **방향**. 학습으로 변경 가능.

---

## 5. Later (1년 이내 vision)

| Outcome | Theme |
|---------|------|
| [Outcome X] | [Strategic theme] |
| [Outcome Y] | ... |

---

## 6. Done (과거 분기 달성)

### Q[X-1]
- ✅ Outcome 1: 35% → 47% (목표: 45%) — Hit
- ⚠️ Outcome 2: 3% → 4.2% (목표: 5%) — Miss (학습: X)
- ❌ Outcome 3: 25% → 23% (목표: 40%) — Off (학습: Y)

→ 다음 분기 계획에 반영.

---

## 7. Now/Next/Later Communication Templates

### To Executive Board
**Format**: Quarterly slide
- This quarter focus (3 outcomes)
- Last quarter results (vs OKR)
- Next quarter direction
- Risks + asks

### To Customers (Public)
**Format**: Roadmap page on website
- Shipped (지난 분기)
- In progress (이번 분기)
- Coming soon (다음 분기 가능)
- Considering (Later) — 모호하게

→ **공개 roadmap의 함정**: 약속처럼 보임. "We may build..." 명시.

### To Team
**Format**: Notion / Linear Roadmap view
- 모든 outcome 상세
- 솔루션 후보
- 실험 결과
- Blockers

---

## 8. Roadmap Cadence

### Daily
- 진행 상황 standup

### Weekly
- Outcome 진행 review (메트릭 추세)
- New insights → solution 조정?

### Monthly
- Now outcomes 진행도
- Next 후보 검토

### Quarterly
- OKR 결과 평가
- 다음 분기 OKR
- Roadmap 재정렬

### Annually
- Vision 재검토
- Strategic 변경

---

## 9. Outcome 변경 Protocol

분기 도중에 outcome 변경?
1. **Significant change**: stakeholder alignment (board, leadership)
2. **Minor pivot**: PM 결정으로 변경 + 문서화
3. **Solution 변경** (outcome 유지): 자유롭게

### 변경 사유 기록
- 새 데이터?
- 외부 변화?
- 가설 검증 실패?

---

## 10. Anti-patterns

### ❌ Feature Roadmap
"Q1에 X기능, Q2에 Y기능..." → 약속 깨짐, 학습 거부

### ❌ 너무 많은 outcome
분기당 outcome 10개 → 집중 ↓
권장: 분기당 3개 (1 핵심 + 2 보조)

### ❌ Roadmap = 변경 불가
약속에 묶여 더 좋은 기회 무시

### ❌ Stakeholder 사후 알림
출시 직전 "Q1 plan 바뀌었어요"

### ❌ Output 측정
"기능 5개 출시 완료" (outcome 측정 ❌)
✅ "Activation +12%p"

### ❌ Vanity Quarter Goal
"Best product ever ship"
✅ "Activation 35% → 45%"

---

## 11. Reorganization Tool: Opportunity Solution Tree

각 Outcome은 OST로 분해:

```
Outcome: Activation 35% → 45%
   |
   ├─ Opportunity: Onboarding too long
   |    ├─ Solution: Skip tutorial option
   |    ├─ Solution: Shorter tutorial (5 steps → 3)
   |    └─ Solution: Interactive tutorial
   |
   ├─ Opportunity: First value unclear
   |    ├─ Solution: Default workspace
   |    ├─ Solution: Example data
   |    └─ Solution: Guided first action
   |
   └─ Opportunity: Email verification friction
        ├─ Solution: Magic link
        └─ Solution: SSO (Google/Kakao)
```

→ 각 Solution을 실험. 가장 큰 효과의 Solution이 분기 우선 작업.

---

## 12. Linear's Approach (reference)

Linear는 roadmap을 공개적으로 다음 형식으로 운영:

> **Backlog** → **Up Next** → **In Progress** → **Done**

- Backlog: 검토 중인 모든 outcome/idea
- Up Next: 다음 cycle (6주)
- In Progress: 이번 cycle
- Done: 완료

**Cycle 단위**: 6주 (Quarter보다 짧음)

장점: 빠른 학습, 약속 줄임
단점: Roadmap 멀리 못 봄

---

## 13. Multi-team Roadmap (Scale)

회사 커지면 1개 roadmap 부족.

### Roadmap 계층:
- **Company roadmap**: 전사 OKR
- **Product Area roadmap**: 영역별 (예: Growth, Core, Platform)
- **Team roadmap**: 팀별
- **Personal**: 개인

상위 → 하위로 연결. 하위 outcome이 상위 outcome 기여.
