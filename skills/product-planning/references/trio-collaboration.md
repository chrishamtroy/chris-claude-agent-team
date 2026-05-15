# Trio Collaboration Protocol

> PM + Designer + Engineer 협업 모델. Spotify Squad, Linear/Vercel/Stripe 표준.

---

## 왜 Trio인가

### Solo PM의 한계
- PM 혼자 결정 → 디자인 모르고 기술 모름
- 의사결정 늦음 (계속 다른 사람에게 묻기)
- 핸드오프 부담 (PRD 작성 → "이대로 만들어")
- Re-work 폭증 (디자이너/엔지니어가 본 후 "이건 안 됨")

### Trio 모델
- 3명이 함께 **discovery + delivery**
- 각자 전문 영역에서 책임지지만 의사결정에 함께 참여
- "내 영역 아냐" 불가
- Continuous Discovery (Teresa Torres)

### 결과
- 의사결정 ↑ 속도
- Re-work ↓
- 더 나은 솔루션 (3개 관점)
- 팀 만족도 ↑

---

## Trio Composition

### Core Trio
- **PM**: Customer value, Why, prioritization
- **Designer**: User experience, How (UX), Vision
- **Engineer**: Feasibility, How (Tech), Constraints

### Optional Extensions
- **Data Analyst**: 데이터로 결정 검증 (Quarrio)
- **User Researcher**: Generative + Evaluative 리서치
- **Marketer**: Positioning + Messaging (출시 단계)

---

## 책임 분담 (RACI)

| 영역 | PM | Designer | Engineer | Note |
|------|-----|---------|---------|------|
| Customer discovery | R | C | C | 모두 참여 |
| Problem definition | R/A | C | C | |
| Solution exploration | A | R | R | Designer + Eng가 솔루션 ownership |
| Wireframes / Mockups | C | R/A | C | |
| Prototyping | I | R | C/R | Lo-fi: Designer, Hi-fi: 협업 |
| Technical design | I | I | R/A | Eng owns |
| Estimation | C | C | R/A | Eng commits |
| Implementation | I | C | R/A | Designer reviews UI |
| QA | C | R | R/A | Designer: visual QA |
| Launch decision | R/A | C | C | PM final |
| Post-launch analysis | R | C | C | |

---

## Trio 모임 표준

### Weekly Trio Meeting (60분)

**Agenda**:
1. **Customer touchpoint** (15분)
   - 이번 주 인터뷰/피드백 review
   - New insights

2. **Opportunity review** (15분)
   - Opportunity Solution Tree 업데이트
   - 새 opportunity 추가? 우선순위 변경?

3. **Current work check-in** (15분)
   - 현재 진행 중인 솔루션 상태
   - Blockers
   - Risks

4. **Next experiment** (10분)
   - 이번 주 무엇 검증?
   - Hypothesis + Method

5. **Action items** (5분)
   - Who does what by when

### Daily Standup (15분)
- 어제 한 일
- 오늘 할 일
- Blockers

(Slack async standup도 가능)

### Bi-weekly Retro (60분)
- What worked?
- What didn't?
- Action items

---

## Discovery 단계 협업

### Continuous Discovery (Teresa Torres) 방식

```
Outcome
  ↓
Opportunity (사용자 문제)
  ↓
Solution (여러 가능성)
  ↓
Assumption Test (작은 검증)
```

**Trio 역할**:
- PM: Outcome + Opportunity 정의 주도
- Designer: Solution 시각화, prototyping
- Engineer: 기술적 viability check

### Weekly Customer Interview

**누가 인터뷰**:
- PM (questions lead)
- Designer (관찰자, 후속 질문)
- Engineer (관찰자, 가능 시 참여)

→ 모두가 사용자 목소리 직접 들음. 한 명이 전달 ❌.

---

## Delivery 단계 협업

### PRD → Solution → Build

#### Old (안티패턴)
```
PM writes PRD → throws to Designer → throws to Engineer → builds → launches → blame
```

#### Trio Mode
```
PM + Designer + Engineer collaborate from Day 1
  → Lean PRD (10 pages) + early prototype
  → Sprint planning together
  → Daily standup
  → Joint QA
  → Joint launch
```

### Design Review Sessions

- Designer 작업 일찍 공유 (lo-fi → hi-fi)
- PM 검토: 비즈니스 가치 충족?
- Engineer 검토: 기술적 어려움 + 비용?
- → 일찍 catch, 일찍 수정

### Technical Design Review

- Engineer 기술 설계 일찍 공유
- PM 검토: 비즈니스 영향?
- Designer 검토: UX 영향?
- → Architecture가 UX 막지 않게

---

## 의사결정 Protocol

### Type 1: Reversible (대부분의 결정)
- Trio 합의로 빠르게 결정
- 잘못되면 되돌리기
- "Speed > consensus"

### Type 2: Irreversible (큰 결정)
- Stakeholder 참여 (CTO, Head of Product, etc)
- ADR 작성
- 합의 필요 (또는 명시적 escalation)

### Disagreement Resolution

```
1. 각자 입장 1줄로 (서면)
2. 데이터 / 사용자 voice 찾기
3. 작은 실험으로 검증
4. 검증 불가 시: PM이 최종 결정 (with reasoning)
5. Disagree but commit
```

---

## 회의 외 협업 도구

### Async-first
- **Slack**: 일상 소통 (15분 응답)
- **Linear / Jira**: 작업 추적
- **Notion / Confluence**: 문서 (PRD, ADR, Retro)
- **Figma**: 디자인 (FigJam: 화이트보드)
- **Loom**: 비동기 비디오

### Sync 회의는 다음 경우만
- 의사결정 필요 + 토론 필요
- Brainstorming
- Customer interview
- Retro

---

## Anti-patterns

### 1. "Throw over the wall"
❌ PM → Designer → Engineer (직선)
✅ 동시에 함께

### 2. "PM-only customer touchpoint"
❌ PM만 사용자 만남, 결과 요약 전달
✅ Trio 모두 인터뷰 참여

### 3. "Spec ownership만"
❌ "PM 영역, 디자인 영역, 기술 영역"
✅ "Outcome 함께 책임"

### 4. "Async 거부"
❌ 모든 결정 회의
✅ 80% async, 20% sync

### 5. "회의 폭주"
❌ 회의 5개/일
✅ 회의 < 3시간/주 (PM도)

### 6. Trio 외 사람들 무시
❌ Marketing/Sales 출시 직전에 알림
✅ Stage 2부터 참여

---

## 시작하는 법

### Week 1
- Trio 멤버 확정
- Weekly meeting 시간 잡기
- Customer interview 일정 잡기
- 공통 도구 정렬 (Linear, Figma, Notion)

### Month 1
- 첫 Continuous Discovery cycle
- 첫 Opportunity Solution Tree
- 첫 작은 실험

### Month 3
- Retro 결과로 process 개선
- 더 빠른 학습 루프
- Trio 사이 신뢰 강화

### Month 6
- Trio가 자율적
- PM이 micromanage 없이도 작동
- "Empowered team" 상태

---

## 추가 자료

- Marty Cagan, "Empowered" — Trio + Empowered teams
- Teresa Torres, "Continuous Discovery Habits"
- Spotify Engineering Culture (영상)
- Linear / Vercel / Stripe 공개 블로그
