# Product Methodologies

> JTBD, OKR, North Star Framework, RICE, AARRR, Opportunity Solution Tree.
> 글로벌 PM이 사용하는 핵심 방법론을 한 곳에.

---

## 1. Jobs-to-be-Done (JTBD)

**창시자**: Clayton Christensen (Harvard), Tony Ulwick (Strategyn)

### 핵심 원리

> "Customers don't buy products. They hire them to do a job."

사용자는 **제품을 사는 게 아니라 Job을 해결하기 위해 고용**한다.

### 유명한 예: 밀크쉐이크 (Clayton Christensen)

맥도날드가 밀크쉐이크 판매를 늘리려고 했다.
- 시장 조사: "어떤 맛/사이즈/가격을 원하나요?" → 별 효과 없음
- JTBD 접근: "밀크쉐이크를 언제 사나요?"
- 발견: 아침 9시 출근길에 가장 많이 팔림
- Why? "긴 운전길이 지루해서. 한 손으로 들고 천천히 마실 수 있어서. 점심까지 배고프지 않게 해줘서."
- **진짜 Job**: "지루한 출근길을 견디고 점심까지 버티는 것"
- **경쟁자**: 다른 밀크쉐이크가 아닌 → 도넛, 바나나, 베이글
- **개선**: 더 진하게 + 작은 과일 조각 (씹는 재미) + 빨대 작게 (오래 마시기)

### 3가지 Job 유형

| Job 유형 | 정의 | 예시 |
|---------|------|------|
| **Functional Job** | 기능적 결과 | "출퇴근길 시간 보내기" |
| **Emotional Job** | 어떤 감정/내적 상태 원함 | "지루함 안 느끼기" |
| **Social Job** | 다른 사람에게 어떻게 보이고 싶음 | "건강한 사람으로 보이기" |

세 가지를 모두 충족 → 강력한 제품.

### JTBD Statement Format

```
When [situation],
I want to [motivation],
so I can [expected outcome].
```

**예시**:
- "When 출근길 운전 중일 때, I want to 한 손으로 오래 즐길 무언가, so I can 지루함을 잊고 점심까지 버틸 수 있다."

### 4 Forces of Progress (Bob Moesta)

사용자가 새 제품으로 전환하려면 4가지 힘이 작용:

```
[Push] 현재 상황 불만 ───→ [Pull] 새 솔루션 매력
                            ↓
                        전환 발생
                            ↑
[Habit] 현재 습관 ←──── [Anxiety] 새 솔루션 불안
       관성
```

**Push + Pull > Habit + Anxiety** 일 때 전환 발생.

PM의 전략:
- **Push 증폭**: 사용자 현재 불만을 명확히 인식시키기
- **Pull 강화**: 새 솔루션의 매력 명확히 보여주기
- **Anxiety 감소**: 무료 체험, 마이그레이션 도구, 데이터 import
- **Habit 약화**: 현재 도구의 한계를 보여주기

### JTBD Interview

표준 질문:
1. "처음 이 제품을 사용한 게 언제였어요? 그때 무슨 일이 있었나요?"
2. "이 제품을 사기 직전에는 어떤 다른 방법을 써봤나요?"
3. "이 제품을 사고 나서 처음으로 한 일은 뭐였어요?"
4. "이 제품 없이 그 일을 어떻게 해왔나요?"
5. "이상적인 세상에서는 그 일이 어떻게 되면 좋겠어요?"

---

## 2. OKR (Objectives and Key Results)

**창시자**: Andy Grove (Intel) → John Doerr → Google 확산

### 구조

```
Objective: 정성적, 영감적, 도전적 목표
└── KR 1: 정량적, 측정 가능한 결과
└── KR 2: ...
└── KR 3: ...
```

### 좋은 Objective
- 영감적 ("become Asia's leading X")
- 시간 제한 (분기/연간)
- 부서 + 회사 align

### 좋은 Key Result
- 100% 정량적 (활동이 아닌 **결과**)
- 측정 가능 + 검증 가능
- 도전적 (60~70% 달성이 "성공")

### 예시

```
Objective: NewGen이 한국 중소형 교회의 표준 도구가 된다 (2026 Q4)
├── KR1: Active Churches 500개 (현재 50)
├── KR2: Daily Active Users (Teachers) 5,000명
├── KR3: NPS 50 이상
└── KR4: 유료 전환율 30% 이상
```

### 안티패턴
- ❌ KR이 활동 목록 ("Marketing 캠페인 3개 실행")
- ❌ 100% 달성 가능한 KR ("X% 성장" 같은 stretch goal 없음)
- ❌ 너무 많은 OKR (회사 3-5개, 팀 3-5개가 적정)
- ❌ Annual review와 연계 (OKR은 학습 도구, 평가 도구 아님)

---

## 3. North Star Framework

**창시자**: Sean Ellis (Growth Hacker), Amplitude 정립

### 구조

```
North Star Metric (1)
   ├── Input Metric 1
   ├── Input Metric 2
   ├── Input Metric 3
   └── Input Metric 4
```

### Good NSM의 조건

1. **고객 가치 반영** (단순 매출 아님)
2. **회사 성장과 연결**
3. **팀이 직접 영향 가능**
4. **선행 지표** (lagging이 아닌 leading)

### 유명 예시

| 회사 | North Star | Why |
|------|-----------|-----|
| Airbnb | Nights Booked | 호스트도 게스트도 가치 받음 |
| Spotify | Time spent listening | 더 들을수록 더 좋아함 + 추천 데이터 |
| Slack | Daily Active Teams | 팀 단위 채택이 핵심 |
| Linear | Weekly Issues Closed | 실제 일이 끝남 (활성 아님) |
| Discord | Connection Quality (음성 통화 시간) | 핵심 가치 |
| Wise | Cross-border $ Sent | 핵심 가치 |
| HubSpot | Weekly Active Customers (WACs) | 도구를 실제로 씀 |

### Input Metrics 구조

NSM이 "Total Nights Booked"이면:

```
Total Nights Booked
├── 신규 부킹 (Acquisition)
│   ├── 검색 수
│   ├── 검색 → 예약 전환율
│   └── ...
├── 반복 부킹 (Retention)
│   ├── DAU
│   ├── 재방문율
│   └── ...
└── 평균 부킹 길이 (Engagement)
    └── ...
```

각 input은 측정 가능한 leverage point.

---

## 4. RICE Scoring

**창시자**: Sean McBride (Intercom)

### Formula

```
RICE = (Reach × Impact × Confidence) / Effort
```

### 변수

| 변수 | 의미 | 단위 |
|-----|-----|-----|
| **Reach** | 분기당 영향 받는 사용자 수 | 명/분기 |
| **Impact** | 사용자당 영향 정도 | 3 (massive), 2 (high), 1 (medium), 0.5 (low), 0.25 (minimal) |
| **Confidence** | 추정 자신감 | 100%, 80%, 50% |
| **Effort** | 개발 공수 | person-months |

### 예시

| 기능 | R | I | C | E | RICE | Rank |
|------|---|---|---|---|------|------|
| Mobile 출석 입력 | 1000 | 3 | 100% | 1 | 3,000 | 1 |
| 학부모 자동 알림 | 800 | 2 | 80% | 2 | 640 | 2 |
| 달란트 게이미피케이션 | 500 | 1 | 50% | 3 | 83 | 5 |

### RICE의 한계

- "Reach" 추정이 모호하면 신뢰성 낮음
- Effort 추정 항상 underestimate
- Strategic value 반영 안 됨 (방어적 기능, 전략적 베팅)

→ RICE는 90% 결정. 10%는 strategic judgment.

### 대안 / 보완

- **ICE**: Impact × Confidence × Ease (RICE 간소화)
- **WSJF** (Weighted Shortest Job First): Cost of Delay / Job Size
- **Kano Model**: Basic / Performance / Delighter 분류

---

## 5. AARRR (Pirate Metrics)

**창시자**: Dave McClure (500 Startups)

### 5단계

```
Acquisition  → 유입
Activation   → 첫 가치 경험
Retention    → 재사용
Referral     → 추천
Revenue      → 수익
```

(나중에 **AAARRR** 로 Awareness 추가도 있음)

### 각 단계 측정 예시 (SaaS)

| 단계 | 측정 |
|------|------|
| Acquisition | 방문자, signups, CAC |
| Activation | "Aha moment" 도달율 (예: 첫 5명 초대) |
| Retention | DAU/WAU/MAU, Cohort retention |
| Referral | NPS, Viral coefficient, K-factor |
| Revenue | MRR, ARPU, LTV |

### Funnel별 최적화 전략

**Acquisition 낮음**: 마케팅, SEO, 콘텐츠
**Activation 낮음**: 온보딩 개선, time-to-value 단축
**Retention 낮음**: 핵심 가치 강화, habit 형성
**Referral 낮음**: 추천 인센티브, 공유 기능
**Revenue 낮음**: 가격 모델, upsell, packaging

### 우선순위 (보통)

> "Retention > Acquisition"

새 사용자 모으는 것보다 기존 사용자 유지가 비용 효율적. Retention 좋으면 자연 referral도 일어남.

---

## 6. Opportunity Solution Tree (Teresa Torres)

### 구조

```
Outcome (비즈니스 목표)
└── Opportunity (사용자 문제/기회)
    ├── Solution 1
    ├── Solution 2
    └── Solution 3 ← 가장 viable
        └── Experiments (검증 방법)
```

### 단계별

1. **Outcome**: NSM 또는 분기 OKR
2. **Opportunity Mapping**: 사용자 인터뷰에서 발견한 문제들
3. **Solution Ideation**: 각 Opportunity 당 3+ solutions
4. **Solution Evaluation**: RICE 또는 기타 평가
5. **Experiments**: 가장 위험한 가정 검증

### 왜 강력한가

- **Outcome → Output 연결** 명확
- "왜 이 기능?" 질문에 답 가능
- 한 Opportunity 당 여러 Solution 비교 → 더 나은 것 선택
- Discovery 과정 시각화 → 팀 alignment

---

## 7. ICE Scoring (lightweight)

RICE의 간소화 버전.

```
ICE = Impact × Confidence × Ease
```

- 빠른 우선순위 결정용
- Reach가 모호할 때
- 초기 stage 회사에 적합

---

## 8. Continuous Discovery (Teresa Torres)

### 원칙
- **주 1회 이상** 사용자와 대화
- **PM + Designer + Engineer** 함께 참여 (trio)
- 디스커버리는 **이벤트가 아니라 습관**

### 실행

- **Weekly customer touchpoints**: 주 1회 인터뷰
- **Continuous opportunity mapping**: 새 발견 즉시 tree에 추가
- **Continuous experimentation**: 항상 1~3개 실험 진행

### vs Waterfall Discovery

❌ Waterfall: Discovery → Build → Launch (직선)
✅ Continuous: Discovery ↔ Build ↔ Launch (순환)

---

## 종합 적용

| 단계 | 사용 방법론 |
|------|----------|
| Stage 0 (Research) | JTBD, 4 Forces of Progress |
| Stage 1 (Discovery) | JTBD, Opportunity Solution Tree |
| Stage 2 (PRD) | RICE, North Star, OKR |
| Stage 3 (Tech) | (방법론보다 엔지니어링 원칙) |
| Stage 4 (UX) | JTBD (each flow는 어떤 Job 해결?) |
| Stage 5 (Launch) | AARRR, North Star tracking |

---

## 참고 자료

- Tony Ulwick, "Jobs to Be Done: Theory to Practice"
- Clayton Christensen, "Competing Against Luck"
- Teresa Torres, "Continuous Discovery Habits"
- Marty Cagan, "Inspired" / "Empowered"
- John Doerr, "Measure What Matters" (OKR)
- Amplitude, "The North Star Playbook"
- Sean Ellis, "Hacking Growth"
