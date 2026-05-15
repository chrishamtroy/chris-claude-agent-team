# Engineering Estimation Framework

> PM이 Engineering팀과 합리적 약속을 만들기 위한 estimation 전체 가이드.
> Story Points, T-shirt sizing, #NoEstimates, Shape Up까지.

---

## 1. 왜 Estimation이 어려운가

### 인간 인지의 한계
- **Planning Fallacy** (Kahneman): 사람들은 자신의 작업 시간을 항상 과소평가
- **Hofstadter's Law**: "일은 항상 예상보다 오래 걸린다. Hofstadter의 법칙을 고려해도."
- **Optimism Bias**: 가능성을 과대평가, 위험을 과소평가
- **Sunk Cost**: 시작한 작업을 멈추지 못함 (estimate 초과해도 계속)

### 소프트웨어의 본질적 불확실성
- 새로운 영역 (training data 없음)
- 의존성 변화 (라이브러리, API)
- 요구사항 변경 (스코프 크리프)
- 미지의 unknowns (디버깅, 통합 이슈)

### Cone of Uncertainty (Barry Boehm)

```
초기 (Discovery):     0.25x ~ 4x  실제 시간
PRD 작성 후:         0.5x ~ 2x
설계 완료 후:         0.67x ~ 1.5x
구현 시작 후:         0.8x ~ 1.25x
구현 80% 완료:        0.9x ~ 1.1x
```

→ **초기 estimate는 ±400% 불확실성**. 작업이 진행될수록 정확도 ↑.

### 결론
**Estimate는 정확하지 않다. 정확함을 추구하지 말고, 의사결정을 돕는 도구로 쓰자.**

---

## 2. Estimation의 목적

### 목적 ✅
- 우선순위 결정 (RICE의 E)
- Roadmap 가능성 검토
- Stakeholder 기대 관리
- Trade-off 명시 ("이 기능 추가하면 X 늦어짐")
- Capacity planning
- Risk 식별 (큰 추정 = 큰 위험)

### 목적 ❌ (안티패턴)
- 개발자 평가 (productivity 측정)
- 정확한 deadline 약속 (estimate ≠ commitment)
- Micromanagement
- Estimate 자체가 성과 (의미 없음)

---

## 3. Estimation 방법론

### 3.1 Story Points (Agile/Scrum)

가장 널리 쓰임. **상대적 크기**를 Fibonacci 수열로 표현.

```
Fibonacci: 1, 2, 3, 5, 8, 13, 21, 34, ...
```

#### 왜 Fibonacci?
- 큰 작업일수록 불확실성 ↑ → 정밀도 ↓ 의도적
- "8과 9 차이"보다 "8과 13 차이"가 의미 있음
- 토론 시간 단축

#### 의미
- **1**: Trivial — 몇 시간 (간단한 텍스트 변경)
- **2**: Small — 반나절 (작은 component)
- **3**: Medium — 1일 (CRUD 기능)
- **5**: Large — 2~3일 (복잡한 기능)
- **8**: Big — 1주 (architecture 영향)
- **13**: Huge — 2주 (불확실성 큼) → **쪼개야 함 신호**
- **21+**: Too big → **반드시 쪼개기**

#### 시간이 아닌 이유
- "5시간"이라고 하면 시계로 측정됨
- "Joe는 빠르고 Mary는 느림" → 같은 작업 다른 시간
- **상대적 크기**: "이건 저것의 두 배 크기" → 객관적

#### Velocity (속도)
- 한 sprint(보통 2주)에 팀이 완료한 story points 총합
- 3 sprint 평균 = 팀 velocity
- 다음 sprint 계획: velocity만큼 가져옴

```
Sprint 1: 32 points 완료
Sprint 2: 28 points 완료
Sprint 3: 30 points 완료
→ 평균 30 points = 팀 velocity
→ Sprint 4 계획: 30 points 어치 story 가져옴
```

#### Velocity 안티패턴
- ❌ 팀 간 velocity 비교 (단위 다름)
- ❌ Velocity 늘리기 압박 (point inflation)
- ❌ Manager가 velocity 평가에 사용

---

### 3.2 T-shirt Sizing

더 단순. Story Points 학습 부담 ↓.

| Size | 의미 | 시간 (참고) |
|------|------|----------|
| **XS** | Trivial | < 4 hours |
| **S** | Small | 1 day |
| **M** | Medium | 2~3 days |
| **L** | Large | 1 week |
| **XL** | Very large | 2 weeks → **쪼개기** |
| **XXL** | Too big | → **반드시 쪼개기** |

#### 언제 사용
- 새 팀 (Story Points 도입 부담)
- Roadmap planning (대략 크기)
- Cross-team coordination (다른 팀 작업 크기 빠르게 이해)

---

### 3.3 #NoEstimates Movement

**철학**: Estimation 자체가 시간 낭비. 작업을 충분히 작게 쪼개고, 그냥 한다.

#### 원칙
- 모든 task = 1~3일 이내
- 더 큰 작업은 쪼갬
- "이번 주 N개 task 완료" 만 추적
- Velocity = task 수

#### 대표 회사
- **Linear**: M / L / XL 정도만, deadline 없는 cycle (6주)
- **Basecamp**: Shape Up (아래)

#### 한계
- 큰 프로젝트 일정 묻는 stakeholder에게 답 어려움
- 작은 작업 쪼개기에 익숙한 팀 필요

---

### 3.4 Shape Up (Basecamp)

Jason Fried & DHH의 방식. 2019년 공개.

#### 핵심 개념

**Appetite (예산), not estimate**

> "이 작업이 얼마나 걸릴지" (estimate) 묻지 말고
> "이 작업에 얼마나 시간 투자할 가치 있는지" (appetite) 물어라.

- **Small batch**: 2주
- **Big batch**: 6주
- **6주 cycle**: 그 안에 끝내거나 안 끝내면 다음 cycle로 보냄 (kill)

#### Fixed Time, Variable Scope

```
전통:  Scope 고정, Time 변동 → 일정 무한 연기
Shape Up: Time 고정, Scope 변동 → 6주에 맞춰 scope 조정
```

#### 6-week Cycle Structure

```
Cycle 1 (6주)        2주 Cool-down       Cycle 2 (6주)
[큰 작업 1]                              [큰 작업 4]
[큰 작업 2]          버그 fix           [큰 작업 5]
[큰 작업 3]          기술 부채 정리      ...
                     다음 cycle 준비
```

#### Hill Chart (진행 추적)

```
       Unknown ↑          ↑ Known but doing
              .
            .   .
          .       .
        .           .
      .               .
    .                   .
   Problem                Solution
```

- 왼쪽 (uphill): 문제 정의 단계 (불확실)
- 정상: 문제 명확
- 오른쪽 (downhill): 해결 실행 (예측 가능)

→ 작업이 어디 있는지 시각화. "아직 uphill에 있으면 진행 못 예측."

---

### 3.5 PERT (3-point Estimation)

각 작업에 3가지 추정:

```
Optimistic (O):    가장 낙관적 (모든 게 잘 되면)
Most Likely (M):   가장 가능성 높은
Pessimistic (P):   가장 비관적 (문제 다 생기면)

Expected = (O + 4M + P) / 6
Std Dev = (P - O) / 6
```

#### 예시
- 회원가입 기능
- O: 2일 (잘 되면)
- M: 4일 (보통)
- P: 10일 (문제 생기면)
- Expected = (2 + 16 + 10) / 6 = **4.67일**
- Std Dev = (10 - 2) / 6 = **1.33일**
- 95% 신뢰구간: 4.67 ± 2.66 = **2~7.3일**

#### 장점
- 불확실성 명시
- "이 작업은 매우 불확실 (large range)" 라고 인정

#### 단점
- 시간 소요 ↑
- 3가지 다 추정 어려움

---

### 3.6 Planning Poker

팀이 함께 추정하는 의식.

#### 진행
1. PM이 story 설명
2. Engineer가 질문 (요구사항 명확화)
3. 모두 동시에 카드 노출 (Fibonacci)
4. 가장 낮은 사람 + 가장 높은 사람이 이유 설명
5. 다시 카드 → 수렴
6. 합의

#### 왜 강력한가
- **편향 제거**: 동시 노출 → senior 영향력 ↓
- **지식 공유**: 차이가 클 때 토론 → 모든 사람이 작업 이해
- **암묵적 위험 발견**: 한 사람만 13 → 그가 알고 있는 위험

#### 안티패턴
- ❌ Manager가 추정 강요 ("3 아니야? 1로 하자")
- ❌ 첫 추정에서 평균 내기 (토론 없이)
- ❌ 매번 모든 story 추정 (시간 낭비, 큰 story만)

---

## 4. Capacity Planning

### 4.1 이상 vs 현실

```
이상: 1 person × 1 week = 40시간 작업
현실: 1 person × 1 week = 20~25시간 작업

차이:
- 회의 (5시간/주)
- 이메일/Slack (3시간/주)
- 코드 리뷰 (3시간/주)
- 인터럽트 (2시간/주)
- 버그 fix (2시간/주)
- 기타 (2시간/주)
```

**Focus Factor**: 50~70% (Senior일수록 ↓, 회의 ↑)

### 4.2 Sprint Capacity 계산

```
팀: 5명
Sprint: 2주 (10 working days)
이론적 capacity: 5 × 10 = 50 person-days

조정:
- 휴가 (-3 person-days)
- 공휴일 (-5 person-days, 추석)
- On-call rotation (-3 person-days)
- Focus factor 60%

실제 capacity: (50 - 3 - 5 - 3) × 0.6 = 23.4 person-days

→ 약 24 person-days 어치 작업만 가져옴
```

### 4.3 Time Allocation

표준 분배:

| 영역 | % |
|------|---|
| 새 기능 (Roadmap) | 60% |
| 버그 fix + CS escalation | 15% |
| 기술 부채 (refactoring) | 15% |
| Innovation / Hack time | 10% |

(회사/단계마다 다름. Early stage 70/10/10/10, Mature 50/20/20/10)

---

## 5. INVEST Principle (좋은 Story 기준)

좋은 user story는:

| 글자 | 의미 |
|------|------|
| **I**ndependent | 다른 story와 독립적 (병렬 가능) |
| **N**egotiable | 세부 사항 협상 가능 |
| **V**aluable | 사용자에게 가치 있음 |
| **E**stimable | 추정 가능 (너무 크지 않음) |
| **S**mall | 한 sprint 내 완료 |
| **T**estable | 명확한 acceptance criteria |

#### 큰 story 쪼개기 방법
1. **Workflow steps**: 회원가입 → email validation → onboarding → first action
2. **Business rule variations**: free user 회원가입 vs paid user
3. **Effort variations**: MVP 회원가입 → SSO 회원가입
4. **Data variations**: 한국 사용자 → 글로벌 사용자
5. **Operations**: CRUD에서 R 먼저, CRD 나중

---

## 6. Re-estimation Cadence

Estimate는 한 번이 아님:

### 정기 재추정
- **Sprint planning**: 새 story 추정
- **Mid-sprint**: 진행 상황 보고, 위험 신호 식별
- **Sprint review**: 실제 vs 추정 비교 → 학습
- **Quarterly**: Velocity 재평가

### Estimate 변경 trigger
- 새 정보 발견 (의존성, 위험)
- Scope 변경
- 팀 변동 (인원, 휴가)
- 기술 결정 변화

### 변경 communication
> "원래 5 points로 추정했는데, X 발견하면서 13으로 늘었습니다.
> 이유: [구체적 이유]
> 영향: 출시 1주 지연 가능. 다음 옵션:
> 1. 그대로 진행 (1주 지연)
> 2. Scope 축소 (Y 기능 빼기, 일정 유지)
> 3. 다음 sprint로 이월"

---

## 7. Estimate Padding (Buffer)

### Why
- Unknown unknowns
- 인터럽트
- 통합 이슈
- 디버깅

### How

| 단계 | Padding |
|------|---------|
| Story-level | 0% (story points에 이미 반영) |
| Sprint-level | 10~20% (capacity 미달성) |
| Quarter-level | 30% |
| Release / Annual | 50%+ |

**규칙**: 더 멀리 볼수록 padding ↑.

### Bezos's "Type 2 Decisions" 원칙
- Reversible 결정: 빠르게, 정보 70%에서
- Irreversible 결정: 신중하게, 정보 90%에서

→ Estimate도 작업의 reversibility 따라 정밀도 조정.

---

## 8. Common Anti-patterns

### 8.1 "Engineer가 말한 그대로 약속"
❌ "Eng가 3일 걸린다 했으니 3일 후 deliver"
✅ Eng estimate × 1.5 (또는 PERT 사용) + 다른 일정 고려

### 8.2 "PM이 estimate 강요"
❌ "이거 1주 안에 가능해야 해"
✅ PM은 priority/scope, Eng는 estimate 결정

### 8.3 "이상치 capacity 가정"
❌ "5명 × 2주 = 50일 작업"
✅ Focus factor + 휴가/회의 차감 → 20~25일

### 8.4 "Estimate vs Actual 추적 안 함"
❌ Sprint 끝나고 비교 안 함
✅ 매 sprint 끝 비교, 패턴 발견 → 다음 추정 보정

### 8.5 "큰 story 그대로 추정"
❌ "이거 21 points로"
✅ 21+ 나오면 쪼개기 신호

### 8.6 "기술 부채 / Bug 시간 미고려"
❌ 100% capacity를 새 기능에
✅ 60% 새 기능 + 15% bug + 15% 부채 + 10% 기타

### 8.7 "Re-estimation 없음"
❌ 초기 추정으로 끝까지 계획
✅ 정보 들어올 때마다 update

### 8.8 "Velocity 비교"
❌ "Team A가 30 points, Team B가 20 points = A가 우수"
✅ Velocity는 팀 내부 도구. 팀 간 비교 의미 없음.

---

## 9. Estimate를 Deadline으로 변환

PM은 estimate를 stakeholder 약속으로 변환해야 함.

### 변환 공식 (rough)
```
Deadline = Estimate × Buffer × Cone of Uncertainty 가중치

예시:
- Eng estimate: 8 weeks
- Buffer: 1.5x
- Discovery 단계 (Cone 2x): 8 × 1.5 × 2 = 24 weeks
- 구현 시작 (Cone 1.25x): 8 × 1.5 × 1.25 = 15 weeks
```

### 외부 발표 시
- ❌ "정확히 X월 X일 출시"
- ✅ "Q3 중반 출시 목표" (range)
- ✅ "8월 vs 9월" (early signal)

### Re-commit 단계
- Discovery 완료 → 첫 commit (with wide range)
- PRD 완료 → 다시 commit (narrower)
- Design 완료 → 다시
- 구현 80% → final commit (narrow)

---

## 10. Risk-adjusted Estimation

### Risk 식별
각 story에서:
- **External dependency** (다른 팀, vendor): +50%
- **New technology** (처음 사용): +100%
- **Unclear requirements**: +50%
- **Cross-team coordination**: +30%
- **Compliance/Security review** 필요: +30%

### Risk-adjusted estimate
```
Base estimate × (1 + Σ risk factors) = Adjusted estimate

예시:
Base: 8 points
+ External dependency: +50%
+ Unclear requirements: +50%
Adjusted: 8 × 2 = 16 points
```

### Risk 명시
> "이 작업 추정: 16 points (기본 8, 외부 의존성 + 요구사항 불명확)
> Risk: 의존성 팀 일정 미정 → 1주 지연 가능"

---

## 11. PM과 Eng 협업

### Estimate session 운영

#### 1. PM 준비 (전)
- Story 명확하게 (acceptance criteria)
- Dependencies 식별
- 우선순위 명시

#### 2. Estimate 세션 (1~2 hours)
- PM: Story 설명 + Q&A
- Engineer: 질문 → 추정
- Planning poker 또는 토론
- Risk 식별
- 결과 기록

#### 3. PM 후 작업
- 우선순위 vs estimate 조합 → Sprint plan
- Stakeholder 약속 (with buffer)
- Re-estimation 일정

### Engineer가 추정 거부할 때
- "정보 부족해서 추정 못 함" → Spike (research task) 추가
- "큰 위험 있음" → Risk 명시
- "Rough range만" → wide range 받아들이기

---

## 12. Tools

| Tool | 주 용도 |
|------|--------|
| Linear / Jira | Story tracking, sprint planning |
| Notion | Documentation, estimates |
| Planning Poker apps | 분산 팀 추정 (Scrum Poker, Planitpoker) |
| Excel / Sheets | Velocity tracking |
| Mermaid Gantt | 일정 시각화 |

---

## 13. 추천 출발점

### 신규 팀
1. T-shirt sizing 시작 (단순)
2. Velocity 3~6 sprints 측정
3. Capacity planning 정착
4. 필요 시 Story Points 전환

### 성숙 팀
1. Story Points + Planning Poker
2. PERT 3-point (불확실 큰 작업)
3. Shape Up cycle 도입 검토
4. Re-estimation 정기화

### 글로벌 표준
- Linear: M/L/XL + cycle
- Stripe: Story Points + Sprints (Atlassian)
- Basecamp: Shape Up
- Amazon: 6-pager + milestone

---

## 14. PM이 기억할 것

> **"Estimate는 약속이 아니다. 정보다."**

- Estimate 자체에 책임을 묻지 마라
- 변화에 열려 있어라
- Buffer를 넣어라
- 의사결정의 근거로 써라, 평가의 도구로 쓰지 마라
- Engineer의 estimate를 존중하라 (그들이 전문가)
- 그러나 challenge는 해라 ("왜 그 큰가?")
- Re-estimate 정기적으로 하라
- 실패한 추정에서 배우라 (postmortem)
