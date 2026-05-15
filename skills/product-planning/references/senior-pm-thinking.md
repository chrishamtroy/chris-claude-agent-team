# Senior PM Thinking Frameworks

> 글로벌 SaaS 회사 시니어 PM이 매일 사용하는 5가지 추론 도구.
> 각 에이전트는 자신의 도메인에서 이 도구들을 활용합니다.

---

## 1. First Principles Thinking (Elon Musk, Aristotle)

### 정의
업계 관례나 유추(analogy)가 아니라, **근본적 진리**까지 분해한 후 다시 합성하는 사고 방식.

### 적용 방법
```
Step 1: 통념을 그대로 받아들이지 말고, "왜 그런가?" 5번 묻기
Step 2: 분해해서 가장 기본 단위의 진리에 도달
Step 3: 그 기본 단위에서 다시 추론하기
```

### 예시: SaaS 가격 책정

**유추 방식 (Analogy)**:
> "다른 SaaS 회사가 월 $9.99로 시작해서 $19.99/$49.99 3-tier 구조니까 우리도 그렇게 하자"

**First Principles**:
> "사용자가 우리 제품으로 얻는 가치는 얼마인가?
> 그 가치 중 사용자가 지불 의향이 있는 비율은?
> 우리 cost는 얼마인가?
> Unit economics 작동하려면 LTV/CAC 어느 수준?
> → 그 수치로 가격 역산"

### PM이 First Principles를 적용할 영역
- 가격 책정
- 기능 우선순위 (관례적 P0 ❌)
- 메트릭 선택 (남들이 추적하는 것 ❌)
- 출시 채널 (남들이 가는 곳 ❌)
- 팀 구조 (관례적 PM/Designer/Dev ❌)

### 위험
- 모든 걸 처음부터 의심하면 의사결정 느려짐 → 핵심 영역만 적용
- "다르게 하는 것" 자체가 목적이 되면 안 됨 → 더 나은 결과가 목적

---

## 2. Working Backwards (Amazon, Jeff Bezos)

### 정의
**최종 결과물(사용자가 손에 쥐는 것, 보도자료, 메트릭)부터** 거꾸로 설계하는 방식.

### Amazon의 6-Pager + PR/FAQ

Bezos: "PR/FAQ를 먼저 못 쓰면 만들지 마라."

#### 작성 순서
1. **Press Release** — 출시 시점 기준 가상의 보도자료
2. **External FAQ** — 고객이 물어볼 질문 + 답
3. **Internal FAQ** — 임원/스태프가 물어볼 질문 + 답
4. **Appendix** — 데이터, 디자인 mockup

#### PR 작성 원칙
- 회사가 아닌 **고객 관점**으로 작성
- 출시 시점에 사실인 것처럼 **과거형**
- 마케팅 용어 금지 ("혁신적", "최고의" 등)
- **고객 인용구** 포함 (가상이라도)
- **측정 가능한 결과** 포함

#### Working Backwards 적용 단계
```
Step 1: 출시 후 보도자료 헤드라인은?
Step 2: 출시 6개월 후 메트릭이 어때야 성공인가?
Step 3: 사용자가 제품 첫 사용 후 친구에게 1줄로 추천한다면?
Step 4: 그 결과를 만들려면 무엇이 필요한가?
Step 5: 그 무엇이 필요하려면...
... (거꾸로 계속)
```

### 왜 강력한가
- 비전 명확해짐
- 불필요한 기능 제거 ("이 기능이 PR에 들어갈 만큼 임팩트 있나?")
- 팀 alignment

---

## 3. Pre-mortem Analysis (Gary Klein)

### 정의
"Post-mortem"의 반대. 출시 **전에** 실패 상황을 가정하고 원인을 찾기.

### 진행 방법

#### 1. 시점 설정
> "1년 후. 이 제품이 완전히 실패했다. 무슨 일이 일어난 건가?"

#### 2. 팀 전체가 5분간 조용히 적기
각자 가장 가능성 높은 실패 원인 5가지.

#### 3. 모아서 분류
- 시장 실패 (market risks)
- 제품 실패 (product risks)
- 실행 실패 (execution risks)
- 외부 실패 (external risks)

#### 4. 가장 위험한 가정 식별
가능성 × 영향이 가장 큰 항목 → **출시 전 검증**.

### 왜 Post-mortem보다 효과적인가
- Post-mortem: "왜 이렇게 됐지?" (방어적)
- Pre-mortem: "왜 이렇게 될까?" (탐색적)
- 사람들이 더 솔직해짐 (가상의 실패니까)
- 의사결정 전에 정보 → 변경 가능

### 예시 (NewGen 출시 Pre-mortem)
```
출시 1년 후, NewGen이 사용 안 됨. 원인:

[시장]
- 다른 교회 관리 SW(예: 더예수)와 차별점 약함
- 교회 규모가 너무 작아 디지털 도구 필요성 못 느낌

[제품]
- 교사가 모바일에서 입력하기 어려워서 안 씀
- 학부모 알림 기능이 카카오 알림톡으로 보내져야 했는데 비용 부담

[실행]
- 출시 마케팅 채널 (목회자 네트워크) 활용 못 함
- 무료 → 유료 전환 시 이탈 80%

[외부]
- 코로나 종식으로 온라인 도구 수요 감소
- 카카오톡 단톡방이 더 편하다고 인식
```

→ 가장 위험: "교사 모바일 입력 사용성" → 출시 전 사용성 테스트 필수

---

## 4. Inversion (Charlie Munger, Carl Jacobi)

### 정의
**"어떻게 성공할까?"** 가 아니라 **"어떻게 실패할까?"** 를 먼저 묻기.

### Munger의 격언
> "Invert. Always invert."
> "내가 어디서 죽을지 알면, 거기에 절대 안 갈 거다."

### PM 적용 사례

#### 사례 1: 사용자 행복 (Activation)
- ❌ "사용자를 어떻게 행복하게 할까?"
- ✅ "사용자를 어떻게 짜증나게 할까? 그것을 피하자."
  - 회원가입 7단계
  - 첫 화면에 빈 dashboard
  - 강제 튜토리얼 5분
  - 너무 많은 알림
  - 모바일 인터페이스 무시

#### 사례 2: 데이터 보안
- ❌ "어떻게 안전하게 할까?"
- ✅ "어떻게 데이터 유출이 일어날까? 그것을 막자."
  - SQL injection
  - 권한 누락 (BOLA, BFLA)
  - 평문 비밀번호
  - 미인증 API
  - 백업 미암호화

#### 사례 3: 좋은 PRD
- ❌ "좋은 PRD란?"
- ✅ "나쁜 PRD란? 그것을 피하자."
  - 가설 없음
  - 우선순위 없음
  - 측정 기준 없음
  - Edge case 없음
  - 결정 보류 [TBD] 많음

### 효용
- 위험 평가에서 강력
- Edge case 발굴
- Security review
- Privacy review

---

## 5. The "10 Whys" (Toyota Production System 확장)

### 정의
Toyota의 "5 Whys"를 더 깊게. 표면 답변에 멈추지 않고 본질에 닿을 때까지 묻기.

### 진행 방법
```
Q1: 왜 X인가? → A1
Q2: A1이 왜 그런가? → A2
Q3: A2가 왜 그런가? → A3
... (적어도 5번, 가능하면 10번)
```

마지막 답이 **비즈니스 본질**과 닿아야 함.

### PM 적용

#### 예시 1: 기능 우선순위
```
Q: 왜 푸시 알림 기능을 만드는가?
A1: 사용자 재방문율을 높이려고

Q: 왜 재방문율이 중요한가?
A2: 활성 사용자가 많아져야 매출 늘어남

Q: 왜 활성 사용자가 매출과 연결되는가?
A3: 우리 매출 구조가 광고/구독 기반이라

Q: 왜 그 구조를 택했나?
A4: 무료 진입장벽 낮추고 광고로 수익화하는 게 SaaS 표준이라

Q: 왜 그게 우리에게도 맞나?
A5: ... [본질 도달]
```

마지막에 "정확히 모름" 또는 "당연하다 가정함"이 나오면 → 검증 필요한 가설.

### 5 Whys만으로 부족한 경우
- 표면 답변이 정해진 답으로 끝남 (e.g., "고객이 원해서")
- 답변이 일반적/추상적 (e.g., "사용성 때문에")
- 답변에 정량적 근거 없음

→ 10번까지 가서 진짜 근본 추론으로.

---

## 종합 적용 가이드

### 단계별 사용

| Stage | 주로 사용할 도구 |
|-------|--------------|
| 0 (Research) | First Principles, 10 Whys |
| 1 (Discovery) | Working Backwards, Inversion |
| 2 (PRD) | Working Backwards (PR/FAQ), Pre-mortem |
| 3 (Tech/Feature) | Inversion (security/edge cases) |
| 4 (UX) | Inversion (UX dark patterns 피하기) |
| 5 (Launch) | Pre-mortem (launch risks) |

### Cross-functional 적용
- PM: 모든 5가지
- Engineer: First Principles, Inversion
- Designer: Inversion (anti-patterns)
- Data Analyst: First Principles, 10 Whys
- Marketing: Working Backwards, Pre-mortem

---

## 안티패턴

❌ 도구 하나만 의존 (First Principles로 모든 결정)
❌ 도구 자체가 목적이 됨 ("멋있어 보이려고 Working Backwards")
❌ 결론이 정해진 상태로 도구 적용 (motivated reasoning)
❌ 깊이 추론 없이 한 번 적용하고 끝
❌ 팀과 공유 안 함 → 혼자만의 추론

### 좋은 신호
✅ 추론 도중 "어, 이 가정이 틀렸을 수도?" 라는 발견
✅ 처음 직관과 다른 결론 도달
✅ 추론 과정을 동료에게 설명할 수 있음
✅ 추론 결과로 의사결정이 바뀜
