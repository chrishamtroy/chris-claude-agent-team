# Example: NewGen (주일학교 통합 관리 플랫폼)

> 이 스킬을 실제로 적용한 canonical 예시.
> 한국 중소형 교회 주일학교를 위한 SaaS 기획 전 과정.
> **각 단계 산출물의 "어떻게 보여야 하는지" 참고용.**

---

# Stage 0 — Pre-Discovery

## 00-market-research.md (요약)

### TAM (Total Addressable Market)
- 한국 개신교 교회 약 60,000개 (2024)
- 주일학교 운영 교회 ~30,000개 (50%)
- 평균 ARPA $500/year × 30K → **TAM ₩200억**

### SAM (Serviceable Available Market)
- 100~500명 규모 교회 (디지털 도구 필요성 큼)
- 약 15,000개
- ARPA ₩100만 (Pro tier 가정) → **SAM ₩150억**

### SOM (3년 목표)
- 시장의 5% (~750 교회)
- ARR ₩7.5억 (3년차)
- 1년차 50 교회 (Free + 일부 Pro)

### Trends (Why now)
1. 코로나 이후 디지털 도구 채택 가속화 — 교회 카카오톡, 줌 일상화
2. MZ 세대 부모 — 디지털 알림 기대 (SMS → 카톡)
3. 작은 교회의 인력 부족 — 자동화 도구 필요

---

## 00-competitive-analysis.md (요약)

### 직접 경쟁자

| 회사 | 강점 | 약점 | 가격 |
|------|-----|------|-----|
| 더예수 (더예수컴) | 교회 풀스택 ERP | 무겁고 복잡, 주일학교 특화 ❌ | 협상 (대형 교회용) |
| 주만나 | 무료, 출석부 | 기능 적음, UX 구식 | 무료 |
| 한국교회연합전산 | 안정성 | 클라우드 ❌, UI ❌ | 라이센스 |

### 간접 경쟁자 (대체재)
- Excel + 카카오톡 단톡방 (가장 큰 경쟁자!)
- Google Forms + Spreadsheet
- 종이 출석부

### Porter's 5 Forces
- 신규 진입 위협: 중간 (개발자 + 교회 네트워크 필요)
- 공급자 협상력: 낮음 (Cloud, PG 흔함)
- 구매자 협상력: 중간 (예산 limit + 의사결정 느림)
- 대체재 위협: **높음** (Excel + KakaoTalk이 무료)
- 산업 경쟁: 낮음 (시장이 fragmented)

### Unfair Advantage
- 창업자가 현역 목회자 — domain expertise + 교회 네트워크
- "교역자가 만든 도구" → 신뢰 ↑

---

## 00-user-research.md (요약)

### 인터뷰 N=8 (교역자 5, 교사 2, 학부모 1)

### 핵심 인사이트

#### Insight #1: 출석 입력이 가장 큰 짜증
- 교사 2명 모두: "주일에 출석부 종이로 받고 월요일에 엑셀 입력"
- 인용: <cite>"엑셀 시트 누적하다 보면 200줄, 정신 없어요"</cite>
- 빈도: 주 1회, 시간 평균 30분

#### Insight #2: 학부모 알림이 손으로
- 교역자 5명 중 4명: 카톡 단톡방에 수동 공지
- 인용: <cite>"행사 안내를 100명 학부모에게 일일이 카톡 못 보내요"</cite>

#### Insight #3: 달란트 관리 종이
- 교사 모두: 종이 달란트 → 분실, 부정행위
- "디지털화 되면 좋겠지만 비용..."

### JTBD (Primary persona: 교역자)
- **When**: 주중에 주일 준비할 때
- **I want to**: 학생 정보, 출석, 알림을 한 곳에서 관리
- **So I can**: 행정 작업 줄이고 사역에 집중

### 4 Forces of Progress
- **Push**: Excel 누적 부담, 카톡 일일 발송 피로
- **Pull**: 자동화 + 한 곳에서 관리
- **Anxiety**: 학습 곡선, 비용 부담
- **Habit**: Excel + KakaoTalk 익숙함

---

# Stage 1 — Discovery

## 01-discovery.md

### One-liner
"한국 중소형 교회 주일학교를 위한, 출석/알림/달란트 통합 관리 SaaS"

### Hypotheses

**Customer Hypothesis**:
> 100~500명 규모 교회의 교역자가 우리의 primary user.

**Problem Hypothesis**:
> 교역자는 Excel + 카톡 조합으로 학생 관리 → 주 평균 3~5시간 행정 작업.

**Solution Hypothesis**:
> 출석 입력, 학부모 알림톡 자동화, 디지털 달란트 통합 도구가 그들의 시간을 50% 절약.

**Riskiest Assumption**:
> "교역자가 디지털 도구 학습 + 매주 사용 의지가 있을 것" — IT 친숙도 낮은 50대+ 교역자도 사용?

### Top 3 Features (P0)
1. 모바일 출석 입력 (교사가 주일에 즉시)
2. 학부모 카카오 알림톡 자동 발송
3. 학생/학부모 기본 정보 관리

### Differentiation
- "교역자가 만든 도구" 메시지
- 카카오 알림톡 통합 (다른 도구 X)
- 학생/학부모 분리 + 권한 (다른 도구 X)

### Risk Matrix

| Risk | Impact | Probability | Mitigation |
|------|------|----------|---------|
| 교역자 디지털 친숙도 낮음 | High | High | Onboarding 30초, 모바일 first |
| 알림톡 비용 부담 | Medium | High | Free tier 월 100건 포함 |
| 작은 교회 예산 | High | Medium | Free tier + Pro ₩9.9만/월 |
| Excel + Kakao 익숙함 | High | High | Import 도구 + 단톡방 보완 메시지 |

---

## 01-lean-canvas.md (요약)

| Box | Content |
|-----|---------|
| Problem | 출석 관리 30분/주, 학부모 알림 수동, 달란트 종이 |
| Customer | 100~500명 교회 교역자 (Early) → 더 큰 교회 (Later) |
| UVP | "교역자의 행정 시간 50% 절감하는 주일학교 SaaS" |
| Solution | 모바일 출석, 알림톡 자동, 디지털 달란트 |
| Channels | 교역자 네트워크 (창업자), 교회 컨퍼런스, 알림톡 |
| Revenue | Free (50명 이하) / Pro ₩99K/mo / Business ₩299K/mo |
| Cost | 호스팅 ₩30만/월 + 알림톡 사용량 + 개발 |
| Metrics | DAU 교사, 알림톡 발송수, MRR |
| Unfair | 창업자 = 현역 목회자 + 도메인 지식 |

---

## 01-opportunity-solution-tree.md

```
Outcome: 1년차 Active 교회 50개 + 교역자 NPS 50+
   |
   ├─ Opportunity: 출석 관리 너무 오래 걸림
   |    ├─ Solution: 모바일 + 한 탭 출석 ⭐
   |    ├─ Solution: 학생 자가 체크인 (QR)
   |    └─ Solution: 자동 알림 (출석 안 한 학생 학부모에게)
   |
   ├─ Opportunity: 학부모 알림이 손으로
   |    ├─ Solution: 알림톡 자동 발송 ⭐
   |    ├─ Solution: SMS 백업
   |    └─ Solution: 앱 푸시
   |
   └─ Opportunity: 달란트 종이 분실
        ├─ Solution: 디지털 달란트 + 게임화
        └─ Solution: 학생 본인 앱

⭐ = 우선 실험
```

---

# Stage 2 — Strategy & PRD

## 02-one-pager.md (요약 PR)

### Headline
"교역자가 만든 주일학교 SaaS 'NewGen' 출시 — 한국 100개 교회 무료 사용 시작"

### Paragraph 1
NewGen은 오늘 한국 중소형 교회 주일학교를 위한 통합 관리 SaaS를 출시한다.
교역자는 출석, 학부모 알림, 달란트를 한 곳에서 관리할 수 있게 된다.

### Paragraph 4 (사용자 인용)
> "주일 끝나면 월요일은 출석부 입력 + 카톡 알림에 하루 보냈었는데,
> 이제 1시간이면 다 끝나요." — 김민호 전도사, 서울 J교회 주일학교 부장

### External FAQ
- Q: 무엇? A: 주일학교 통합 관리 SaaS
- Q: 누구를 위해? A: 100~500명 규모 교회 교역자/교사
- Q: 얼마? A: Free (학생 50명 이하), Pro ₩99K, Business ₩299K

### Internal FAQ
- Q: Why now? A: 코로나 후 디지털 채택 + 알림톡 보편화 + 교회 인력 부족
- Q: Risk? A: 디지털 친숙도 (mitigated by onboarding ↓)

---

## 02-prd.md (요약)

(전체는 18 sections, 핵심 발췌)

### 11. Success Metrics

**North Star**: 주 1회 이상 출석 입력한 활성 교사 수 (Weekly Active Teachers)

**Input Metrics**:
- 신규 교회 가입 / 주
- 활성화 (가입 → 첫 출석 입력) %
- 알림톡 발송 / 교회 / 주
- W4 retention

**Guardrail**:
- 알림톡 발송 실패율 < 1%
- App crash rate < 0.1%
- 페이지 로딩 < 2s (P95)

### 14. Hypothesis & Experimentation

**Primary Hypothesis**:
> 교역자에게 모바일 출석 + 알림톡 자동화를 제공하면 행정 시간 50% 단축 + W4 retention 60%+ 달성

**Pre-launch**: Closed beta 5개 교회, 2개월
**Post-launch**: 
- A/B: Onboarding 짧은 버전 vs 긴 버전 (Activation 측정)
- A/B: Default 알림톡 vs SMS (선호 측정)

### 15. Privacy

- 학생 데이터: 미성년자 보호 (PIPA + COPPA equivalent)
- 14세 미만 → 학부모 동의 필수
- 학부모 연락처 → 알림 발송 외 미사용
- 데이터 위치: 한국 (AWS Seoul)
- 보관 기간: 학기 종료 후 1년

### 16. Accessibility

- 모바일 first → Touch target 44x44
- 한글 폰트 가독성 (Noto Sans KR)
- 50대+ 사용자: 글자 크기 ↑ option

---

## 02-rice-prioritization.md (요약)

| 기능 | R | I | C | E | RICE | P |
|------|-|-|-|-|------|-|
| 모바일 출석 입력 | 200 | 3 | 100% | 1 | 600 | P0 |
| 학부모 알림톡 | 800 | 3 | 80% | 2 | 960 | P0 |
| 학생/학부모 관리 | 200 | 2 | 100% | 1 | 400 | P0 |
| 달란트 디지털 | 100 | 1 | 60% | 3 | 20 | P2 |
| 자가 체크인 (QR) | 200 | 2 | 50% | 2 | 100 | P1 |

P0: Top 3 → MVP

---

## 02-pricing-packaging.md

| Tier | Target | Features | Price |
|------|--------|---------|-------|
| **Free** | 학생 50명 이하 | Core, 알림톡 100건/월 | ₩0 |
| **Pro** | 학생 50~300명 | All, 알림톡 1000건/월 | ₩99,000/월 |
| **Business** | 학생 300+ | All, 알림톡 5000건/월, 분석 | ₩299,000/월 |

Annual 17% off (12개월 = 10개월 가격).

---

# Stage 3 — Technical & Feature

## 03-trd.md (요약)

### Tech Stack
- Frontend: Next.js 14 (mobile-first PWA)
- Backend: Next.js API + tRPC
- DB: PostgreSQL (Supabase) — RLS for 교회별 격리
- Auth: Supabase Auth + Kakao OAuth
- Notification: Solapi (알림톡 + SMS)
- Hosting: Vercel
- Monitoring: Sentry + Vercel Analytics

### Cost Estimate

| 항목 | 50명 (Free 1 church) | 1,000명 (10 Pro churches) | 10,000명 (50 Pro + 20 Business) |
|------|--------|--------|--------|
| Vercel | $20 | $50 | $200 |
| Supabase | $25 | $100 | $300 |
| Solapi 알림톡 | $0 (Free 100건/월) | $50 (1만건/월) | $500 (10만건/월) |
| Total | $45 | $200 | $1,000 |

### ADRs
- ADR-001: Supabase Auth (DB 통합)
- ADR-002: 알림톡 발송: Solapi (vs 비즈톡, vs 자체 카카오)
- ADR-003: Mobile PWA vs Native App (PWA 선택, 출시 후 native 검토)
- ADR-004: RLS 기반 교회별 데이터 격리

---

## 03-feature-spec.md (트리 구조)

```
1. 인증
   1.1 회원가입 (교역자/교사)
   1.2 로그인 (이메일/카카오)
   1.3 교회 가입/생성
2. 학생/학부모 관리
   2.1 학생 등록 (개별/Excel import)
   2.2 학부모 연결
   2.3 반/학년 그룹
3. 출석 관리
   3.1 ⭐ 모바일 출석 입력 (P0)
   3.2 출석 통계
4. 알림
   4.1 ⭐ 알림톡 발송 (P0)
   4.2 알림 템플릿
5. 달란트 (P2)
6. 관리자
```

⭐ = MVP 핵심

---

# Stage 4 — UX & Design

## 04-information-architecture.md (요약)

### Sitemap
```
/                          Landing
/auth/signup
/auth/signin
/dashboard                 (교역자)
├── /students
├── /attendance            (오늘 출석)
├── /notifications         (알림 발송)
├── /settings
/teacher                   (교사 — 모바일 우선)
└── /attendance/:class     (반별 출석)
/admin                     (slug per church)
```

### Mobile-first
- 교사 → 모바일 only (PWA)
- 교역자 → 모바일 + 데스크톱

---

## 04-user-flow.md (요약)

### 교사의 주일 출석 입력 플로우
```
교사 폰에서 PWA 열기
→ 자동 로그인 (저장된 세션)
→ 오늘 반 선택
→ 학생 리스트 (사진 + 이름)
→ 한 번 탭 = 출석, 더블 탭 = 결석
→ "20명 출석 완료" 자동 저장
→ 출석 안 한 학생 학부모에게 자동 알림톡 (옵션)
```

목표: 1분 이내 완료.

### 교역자 학부모 알림톡 플로우
```
대시보드
→ 알림 발송 새로 만들기
→ 템플릿 선택 (행사/공지/생일)
→ 대상 선택 (반/학년/개별)
→ 메시지 작성 (자동 변수: {{이름}}, {{날짜}})
→ 미리 보기
→ 발송 (또는 예약)
```

---

# Stage 5 — Launch & Measurement

## 05-launch-plan.md (요약)

### Launch Type: Phased Beta → GA

- T-60: Closed beta 5개 교회
- T-30: Open beta 20개 교회
- T = 0: GA + PR + 교회 컨퍼런스 발표

### Top 3 Channels
1. **교역자 네트워크** (창업자 직접) — 가장 강력
2. **목회 컨퍼런스** (오프라인 + 디지털 광고)
3. **유튜브 영상** (사용법 + 사용 후기)

### Crisis Scenarios
- 알림톡 발송 오류 → Solapi 백업 + SMS fallback
- 학생 데이터 유출 → PIPA 통보 + 보안 강화
- 카카오 알림톡 정책 변경 → SMS / 자체 푸시 백업 plan

---

## 05-analytics-plan.md (요약)

### NSM
**Weekly Active Teachers** = 주 1회 이상 출석 입력한 교사 수

### Event Catalog
- `church_signed_up`
- `teacher_invited`
- `attendance_recorded` ⭐ (NSM 이벤트)
- `notification_sent`
- `subscription_upgraded`

### Dashboards
- Daily: 신규 교회, 활성 교사, 알림톡 발송
- Weekly: WAT, retention curve, churn
- Monthly: MRR, NPS

---

## 05-experimentation-plan.md (요약)

### Experiment 1: Default 알림 채널
- Variant A: 알림톡 default
- Variant B: SMS default  
- 가설: 알림톡 default 시 발송 빈도 ↑

### Experiment 2: Onboarding length
- Variant A: 5-step (현재)
- Variant B: 3-step (간소화)
- 가설: 3-step 시 activation +10%p

---

# 종합 학습

### 이 프로젝트에서 배울 점

1. **Customer가 PM** — 창업자가 도메인 expert (목회자)
2. **Free tier = marketing** — 작은 교회 free → 입소문
3. **Mobile first** — 교사는 모바일만 씀
4. **한국 시장 특수성** — 알림톡 = 필수 (SMS 부족)
5. **Unfair Advantage** — 단순 기술 아닌 네트워크 + 신뢰

### 실패 가능성 (Pre-mortem)
1. 50대+ 교역자가 도구 안 씀 → 학습 ↓ → 사용 ↓
2. Excel + 카톡 너무 익숙 → Habit ↑
3. 알림톡 비용 부담 → upgrade 안 함

→ Mitigation: Onboarding 30초, 카톡 import 도구, Free tier 100건.
