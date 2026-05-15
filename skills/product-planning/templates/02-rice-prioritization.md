# RICE Prioritization Template

> Intercom의 Sean McBride가 만든 우선순위 점수 시스템.
> Stage 2 PRD의 P0/P1/P2 분류를 PM 직감이 아닌 정량으로.

---

# RICE Scoring — [프로젝트명]

> **Date**: YYYY-MM-DD

---

## Formula

```
RICE Score = (Reach × Impact × Confidence) / Effort
```

---

## 변수 정의

### Reach
**분기 (또는 출시 후 첫 기간)당 영향 받는 사용자 수**

- 단위: 명/분기
- 측정 방법: 데이터 또는 추정
- 예: "분기에 1,000명이 이 기능 사용"

### Impact
**사용자당 영향 정도**

| 값 | 의미 |
|----|----|
| 3 | Massive impact — 매우 큼 |
| 2 | High impact |
| 1 | Medium impact |
| 0.5 | Low impact |
| 0.25 | Minimal impact |

### Confidence
**추정 자신감**

| 값 | 의미 |
|----|----|
| 100% | 데이터로 입증된 강력한 자신감 |
| 80% | 합리적 추정 |
| 50% | 가설 수준 |

50% 미만이면 "moonshot"으로 분류, 별도 관리.

### Effort
**개발 공수**

- 단위: person-months (1명이 1달 작업 = 1)
- 예: "3 person-months" = 1명이 3달, 또는 3명이 1달

---

## 기능별 RICE Score

| 기능 ID | 기능 | Reach (분기) | Impact (3/2/1/0.5/0.25) | Conf. (100/80/50%) | Effort (PM) | RICE | Priority |
|---------|------|------|------|------|------|------|---------|
| F1 | [모바일 출석 입력 최적화] | 1000 | 3 | 100% | 1 | 3000 | P0 |
| F2 | [학부모 알림 자동화] | 800 | 2 | 80% | 2 | 640 | P0 |
| F3 | [달란트 게이미피케이션] | 500 | 1 | 50% | 3 | 83 | P2 |
| F4 | [...] | | | | | | |
| F5 | [...] | | | | | | |

### Priority 분류 (자동)

- Top 30% (highest RICE) → **P0** (출시 필수)
- Next 40% → **P1** (출시 후 빠르게)
- Bottom 30% → **P2** (보류 / Future)

---

## 계산 예시

### 기능 F1: 모바일 출석 입력 최적화

- **Reach**: 분기당 100명 교사 × 주 10번 사용 = 분기 1,000 사용자-인스턴스
- **Impact**: 3 (매주 사용하는 핵심 기능)
- **Confidence**: 100% (사용자 인터뷰 N=8 중 7명이 요청)
- **Effort**: 1 person-month (Frontend 작업)

**RICE = (1000 × 3 × 1.0) / 1 = 3000** → P0

### 기능 F3: 달란트 게이미피케이션

- **Reach**: 분기당 50명 학생 × 게임 참여 = 50
  - (참여율 100% 가정 시 500까지)
- **Impact**: 1 (재미는 있지만 핵심 기능 아님)
- **Confidence**: 50% (인터뷰에서 명확히 언급 안 됨)
- **Effort**: 3 person-months (게임 로직 + 디자인)

**RICE = (500 × 1 × 0.5) / 3 = 83** → P2

---

## RICE의 한계 + 보완

### 한계
- "Reach" 추정 모호 → 신뢰성 낮음
- Effort는 항상 과소평가됨 (2x 곱하기 권장)
- Strategic value 반영 안 됨 (방어적 기능, 베팅)

### 보완

#### 1. Strategic Multiplier
전략적 중요도 ×1~×2:
- 핵심 차별점: ×2
- 방어적 (경쟁사 대응): ×1.5
- 일반: ×1

```
Adjusted RICE = RICE × Strategic Multiplier
```

#### 2. Engineering Sanity Check
Engineer가 effort 재추정 → 차이 크면 다시 분석.

#### 3. PM Judgment Override
RICE 결과와 직감이 다르면 명시적 reasoning 추가:
> "F3은 RICE 점수 낮지만 학부모 만족도 핵심이라 P1으로 승격. 가설: ..."

---

## RICE Pitfalls 안티패턴

❌ Reach를 너무 크게 잡음 ("이 기능 모두가 쓸 거예요" → 1,000,000)
❌ Impact를 다 3으로 (모든 게 중요하면 우선순위 없음)
❌ Confidence를 다 100% (자기 기만)
❌ Effort 과소평가 (보통 실제는 2x)
❌ 한 번 계산하고 끝 (학습할수록 업데이트)

---

## Iteration

분기마다 재계산:
- 새 데이터 → Reach/Impact 업데이트
- 새 가설 검증 → Confidence 업데이트
- Engineering 깊이 분석 → Effort 업데이트

| Iteration | Date | Changes |
|-----------|------|---------|
| v1 | YYYY-MM-DD | Initial scoring |
| v2 | YYYY-MM-DD | F3 Confidence 50% → 80% (user test 결과) |

---

## RICE Alternative: ICE

빠른 점검용. RICE 너무 복잡하면 ICE:

```
ICE = Impact × Confidence × Ease
```

(Ease = 1/Effort, 더 직관적)

초기 stage 회사에 적합.
