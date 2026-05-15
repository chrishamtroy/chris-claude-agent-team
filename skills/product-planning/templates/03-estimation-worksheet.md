# Estimation Worksheet Template

> Stage 3에서 사용. PM + Engineer가 함께 작성.
> Reference: `references/engineering-estimation.md`

---

# Estimation — [프로젝트명] / [Sprint or Quarter]

> **Date**: YYYY-MM-DD
> **Facilitator**: PM
> **Participants**: PM, Tech Lead, Senior Eng, [Designer]
> **Method**: Story Points / T-shirt / PERT / Mixed

---

## 1. Team Capacity (Sprint 단위)

### Sprint 정보
- **Sprint**: [번호] (YYYY-MM-DD ~ YYYY-MM-DD)
- **Sprint length**: 2 weeks (default)
- **Working days**: 10

### 인원 capacity

| Member | Role | Working days | Vacation | On-call | Effective days |
|--------|-----|-----------|---------|---------|-------------|
| Engineer A | Senior FE | 10 | 0 | 0 | 10 |
| Engineer B | FE | 10 | 2 | 0 | 8 |
| Engineer C | Senior BE | 10 | 0 | 3 | 7 |
| Engineer D | BE | 10 | 0 | 0 | 10 |
| Engineer E | Mobile | 10 | 1 | 0 | 9 |
| **Total** | | 50 | 3 | 3 | **44** |

### Focus Factor 적용
- Effective days: 44
- Focus factor: 0.65 (회의 + 인터럽트 차감)
- **Realistic capacity: 44 × 0.65 = 28.6 person-days**

### Velocity 기반 capacity
- 지난 3 sprints velocity: 32, 28, 30
- 평균: **30 story points**

→ **이번 sprint commitment: 28~32 story points**

---

## 2. Time Allocation (분기 단위)

| 영역 | Allocation | This Sprint |
|------|---------|------------|
| 새 기능 (Roadmap) | 60% | 18 points |
| 버그 fix | 15% | 4.5 points |
| 기술 부채 | 15% | 4.5 points |
| 기타 (Innovation, On-call response) | 10% | 3 points |
| **Total** | 100% | **30 points** |

---

## 3. Story-level Estimation

### Story List

| ID | Story | Owner | Points (Fibonacci) | T-shirt | Risk | Notes |
|---|-------|------|-----------|---------|------|-------|
| S-001 | [Story 1 description] | A | 3 | S | Low | |
| S-002 | [Story 2] | B | 5 | M | Med | External API |
| S-003 | [Story 3] | C+D | 8 | L | High | New tech |
| S-004 | [Story 4] | E | 5 | M | Low | |
| S-005 | [Story 5] | A | 2 | XS | Low | |
| ... | | | | | | |
| **Total** | | | **30** | | | |

### Story 상세 (각 story마다)

#### S-001: [Story title]

**Description**:
[User story format]
- As a [persona]
- I want [action]
- So that [outcome]

**Acceptance Criteria**:
- [ ] Criterion 1
- [ ] Criterion 2
- [ ] Criterion 3

**Estimate**:
- Story points: 3
- T-shirt: S
- Confidence: High / Medium / Low

**Estimation reasoning**:
[왜 이 사이즈? 비슷한 작업과 비교]

**Risks**:
- ...

**Dependencies**:
- Internal: ...
- External: ...

**Definition of Done**:
- [ ] Code complete + reviewed
- [ ] Unit tests written
- [ ] Integration tests pass
- [ ] Deployed to staging
- [ ] Designer QA
- [ ] PM acceptance
- [ ] Documentation updated

---

## 4. Planning Poker Session 기록

### Story S-002 추정 과정

**Round 1**:
- Engineer A: 5
- Engineer B: 5
- Engineer C: 13
- Engineer D: 8
- Engineer E: 5

**Discussion**:
- C (13): "External API 처음 사용. 인증 문제 가능"
- A (5): "기본 CRUD인데 왜 13?"
- C: "API rate limit 처리, error handling, monitoring 추가"

**Round 2**:
- 모두: 8
- 합의: **8 points** (외부 의존성 위험 반영)

---

## 5. Risk-adjusted Estimate

큰 risk 있는 story:

| Story | Base | Risk Factors | Multiplier | Adjusted |
|------|------|---------|----------|---------|
| S-002 | 5 | External API (+50%) | 1.5 | 7.5 → 8 |
| S-003 | 5 | New tech (+100%), Cross-team (+30%) | 2.3 | 11.5 → 13 |

---

## 6. PERT (높은 불확실성)

큰 작업에 적용:

### S-003: [복잡한 마이그레이션 작업]

| Estimate | Value |
|----------|-------|
| Optimistic (O) | 5 days |
| Most Likely (M) | 10 days |
| Pessimistic (P) | 25 days |
| **Expected** = (O + 4M + P) / 6 | **11.7 days** |
| Std Dev = (P - O) / 6 | 3.3 days |
| 95% range | 5.1 ~ 18.3 days |

→ Story points: 13 (Pessimistic 반영)

---

## 7. Estimate vs Actual Tracking

지난 sprints 비교:

| Sprint | Estimated | Actual | Variance | Notes |
|--------|----------|-------|---------|-------|
| 15 | 30 | 28 | -7% | 휴가 1명 미반영 |
| 16 | 32 | 35 | +9% | Bug 시간 부족 |
| 17 | 30 | 30 | 0% | 정확 |
| 18 | 30 | ? | ? | 이번 sprint |

### 패턴 분석
- 평균 variance: ±10%
- 큰 작업일수록 underestimate
- Bug 시간 충분히 할당 필요

### 다음 sprint 조정
- Bug fix capacity 15% → 20%
- Big stories (8+) PERT 적용

---

## 8. Commitment vs Stretch

### Sprint Commitment (확실히 완료)
- S-001 (3 points)
- S-004 (5 points)
- S-005 (2 points)
- 합: 10 points

### Sprint Stretch (시간 남으면)
- S-002 (8 points)
- S-003 (13 points)
- 합: 21 points

### 총 30 points (commitment 33%, stretch 67%)

---

## 9. Risks & Mitigation

| Risk | Probability | Impact | Mitigation |
|------|----------|------|----------|
| Engineer C 휴가 연장 | Low | High | Cross-training 진행, S-003 buddy 배정 |
| External API 변경 | Med | Med | Adapter pattern, easy swap |
| Scope creep | High | Med | PM이 sprint 중 새 요청 거부 |
| 회의 시간 ↑ | High | Low | 회의 60분 → 30분 제한 |

---

## 10. Re-estimation Triggers

이번 sprint 중 다음 trigger 발생 시 즉시 재추정:

- [ ] 새 정보 발견 (의존성, 위험)
- [ ] Acceptance criteria 변경
- [ ] 인력 변동
- [ ] 외부 의존성 변경
- [ ] 작업 70% 완료 시점에 expected 초과 신호

### 재추정 후 조치
- Stakeholder 알림
- Scope 조정 (stretch goal 제거)
- 다음 sprint로 이월

---

## 11. Sprint Retrospective (Sprint 끝나고 작성)

### Estimate Accuracy
- Commitment 달성: ___%
- Estimate vs Actual variance: ___%

### What worked
- ...

### What didn't
- ...

### Action items
- [ ] [개선 항목 1] — Owner: ___
- [ ] [개선 항목 2] — Owner: ___

---

## 12. Quarterly Velocity Trend

| Quarter | Avg Velocity | Trend |
|---------|------------|-------|
| Q1 | 25 | - |
| Q2 | 28 | +12% |
| Q3 | 30 | +7% |
| Q4 | 30 | 0% |

→ 안정화 신호 (velocity plateau). 다음 단계: 작업 깊이 ↑ (per point 더 큰 가치).

---

## 13. PM Checklist (estimation 전)

- [ ] Story들이 INVEST 충족?
  - Independent
  - Negotiable
  - Valuable
  - Estimable
  - Small
  - Testable
- [ ] Acceptance criteria 명확?
- [ ] Dependencies 식별됨?
- [ ] Risks 식별됨?
- [ ] 우선순위 명시?

부족하면 estimation 전에 story 정제.

---

## 14. Engineer가 estimate 거부할 때

### Case 1: "정보 부족"
→ **Spike 추가**: 1~2일 research task. 끝나면 재추정.

### Case 2: "이거 너무 복잡해서 가늠 안 됨"
→ **쪼개기**. 큰 작업 = 큰 위험. 작게 만들어 추정.

### Case 3: "Rough range만 줄 수 있음"
→ Range 받아들이기. PERT 적용.

### Case 4: "이거 의존성이 외부에 있어서"
→ External dependency 명시. Risk factor 추가.

---

## Reference

- `references/engineering-estimation.md` (방법론 전체)
- `templates/05-experimentation-plan.md` (실험 estimation)
