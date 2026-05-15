# Decision Log Template — ADRs

> Architectural Decision Records. Stripe, Linear, Atlassian 표준.
> 큰 결정은 모두 기록. 이유, 대안, 결과까지.

---

# Decision Log — [프로젝트명]

> **Owner**: PM / Tech Lead
> **Format**: ADR-NNN per decision

---

## 1. Why Decision Log

### 결정의 망각 문제

3개월 후:
> "왜 PostgreSQL이 아니라 MongoDB 썼지?"
> "왜 토스 말고 카카오페이?"
> "왜 Free tier 없애기로 했지?"

답이 없으면 → 처음부터 다시 분석 → 시간 낭비 + 같은 실수 반복.

### Decision Log의 가치
- 결정 reasoning 기록 → 미래에 참조
- 새 팀원 onboarding
- 외부 검토 (감사, due diligence)
- 후회 → 학습

---

## 2. 무엇을 기록?

### 기록 대상 (Important Decisions)
- 기술 스택 선택 (DB, Framework, Cloud)
- Build vs Buy
- API 디자인 (REST vs GraphQL, etc)
- 보안/규제 결정
- 가격/패키징
- Market positioning
- 페르소나 결정
- 핵심 가설
- 출시 전략
- Pivot
- 큰 trade-off

### 기록 안 함
- 작은 UI 결정 (버튼 색상, 텍스트)
- 일상 코딩 결정
- Reversible 결정 (1주일 내 되돌릴 수 있는)

→ **"이 결정 되돌리려면 1개월+ 걸린다면 ADR로"**

---

## 3. ADR Template

각 결정은 ADR-NNN으로:

```markdown
# ADR-001: [짧은 제목]

## Status
[Proposed / Accepted / Deprecated / Superseded by ADR-XXX]

## Date
YYYY-MM-DD

## Author
이름 + 역할

## Stakeholders
의사결정 참여자

## Context
[배경 + 왜 결정 필요?]

## Problem
[해결하려는 문제]

## Options Considered

### Option A: [이름]
**Pros**:
- ...
**Cons**:
- ...
**Cost**: $X / time Y

### Option B: [이름]
**Pros**:
- ...
**Cons**:
- ...

### Option C: [이름]
[...]

## Decision
**선택**: Option [X]

## Rationale
[왜 이 옵션? 다른 옵션 거부 이유?]

## Consequences

### Positive
- ...

### Negative
- ...

### Risks (와 mitigation)
- Risk 1 → Mitigation
- Risk 2 → Mitigation

## When to Revisit
[조건/시점이 바뀌면 재검토]

## References
- Related ADRs
- External docs
```

---

## 4. ADR 예시

### ADR-001: 인증 시스템 — Clerk vs NextAuth vs 자체 구현

## Status
Accepted

## Date
2026-01-15

## Author
PM 김민준, Tech Lead 이지영

## Context
회원가입/로그인, 비밀번호 재설정, 소셜 로그인 (Google, Kakao, Naver), 세션 관리 필요.

## Problem
인증 시스템을 직접 만들 것인가, 외부 솔루션 사용할 것인가?

## Options Considered

### Option A: 자체 구현 (Build)
**Pros**: 완전한 control, vendor lock-in 없음, 비용 없음
**Cons**: 2~4주 개발, 보안 책임, 유지보수 부담
**Cost**: 개발 ₩2,000만 + 매년 유지 ₩500만

### Option B: NextAuth (OSS)
**Pros**: 무료, 표준 OAuth 지원, Next.js 통합
**Cons**: DB 직접 관리, MFA/SAML 구현 직접, 한국 OAuth 추가 코딩
**Cost**: 개발 1주 + 매년 유지 ₩200만

### Option C: Clerk (SaaS)
**Pros**: 빠른 통합 (1일), 보안 검증, Multi-factor, 한국 OAuth 지원
**Cons**: $25/mo + $0.02/MAU (10K MAU 시 월 $225), vendor lock-in
**Cost**: 1년 ₩400만 (5,000 MAU 기준)

### Option D: Supabase Auth
**Pros**: DB와 통합, 한국 OAuth, RLS 연동
**Cons**: Supabase ecosystem lock-in
**Cost**: Supabase Pro 포함 ($25/mo)

## Decision
**선택**: Option D (Supabase Auth)

## Rationale
- 우리는 Supabase를 DB로 이미 사용 결정
- Auth + DB 통합 → 별도 sync 불필요
- 비용: 추가 $0 (DB cost에 포함)
- 한국 OAuth 지원 (Kakao, Naver via custom)
- Row Level Security 통합

NextAuth 거부 이유: DB 직접 관리 부담
Clerk 거부 이유: 비용 ↑ (10K MAU 시 월 $225), vendor lock-in
자체 구현 거부 이유: 시간 ↑ + 보안 책임

## Consequences

### Positive
- 빠른 출시 (1주 vs 4주)
- DB와 자연스러운 통합
- 검증된 보안 (Supabase 인증 standard)

### Negative
- Supabase ecosystem lock-in (DB 옮기면 Auth도 옮겨야)
- 한국 OAuth는 custom provider 작성 필요

### Risks
- Risk: Supabase 가격 인상 / 서비스 종료
  - Mitigation: ADR-005 (Data export strategy), DB는 Postgres → portable
- Risk: 한국 OAuth (Kakao) 구현 복잡
  - Mitigation: 출시 1차에는 Email + Google. Kakao는 V1.1

## When to Revisit
- MAU 50K 초과 시 (Clerk 가성비 재검토)
- Supabase 가격/SLA 변경 시
- 새 인증 요구사항 (SAML, SCIM 등)

## References
- ADR-002: DB 선택
- Supabase Auth docs

---

### ADR-002: PaymentGateway 선택 — Stripe vs 토스페이먼츠

[같은 구조로...]

---

## 5. ADR Lifecycle

### Status 전이
```
Proposed
  ├─ Accepted (의사결정 완료)
  ├─ Rejected (옵션 검토 후 거부)
  └─ Withdrawn (제안자 철회)

Accepted
  ├─ Deprecated (더 이상 권장 안 함, but 유지)
  └─ Superseded by ADR-XXX (다른 결정으로 대체)
```

### Superseded 예시
- ADR-001 v1: "MongoDB 사용"
- 1년 후 PostgreSQL이 더 적합 발견
- ADR-001 status → "Superseded by ADR-042"
- ADR-042: "PostgreSQL 사용 (왜 MongoDB에서 옮기는지)"

---

## 6. ADR Storage

### Option 1: Git Repository
- `docs/adr/ADR-001-auth-system.md`
- PR로 변경
- 코드와 함께 versioned

### Option 2: Notion / Confluence
- ADR DB 페이지
- 검색 ↑
- 비개발자 접근 ↑

### Option 3: Linear / Issue Tracker
- Issue 형태
- 의사결정 토론 추적

**추천**: Git (개발자 결정) + Notion (제품/비즈니스 결정).

---

## 7. ADR Catalog (이 프로젝트)

| ADR | Title | Status | Date | Owner |
|-----|------|--------|------|-------|
| 001 | 인증 시스템 | Accepted | 2026-01-15 | TL |
| 002 | PG 선택 | Accepted | 2026-01-20 | PM+TL |
| 003 | DB | Accepted | 2026-01-22 | TL |
| 004 | Mobile vs Web 우선 | Accepted | 2026-01-25 | PM |
| 005 | Free tier 정책 | Accepted | 2026-02-01 | PM |
| 006 | i18n strategy | Proposed | 2026-02-10 | TL |
| ... | | | | |

---

## 8. ADR Review

### When
- 분기마다 catalog 검토
- 새 결정 전 관련 ADR 검토
- 큰 변화 시 (technology change, regulation)

### 검토 질문
- 이 결정이 여전히 valid?
- "When to revisit" 조건 도달?
- Superseded 필요?
- 새 ADR 필요한 결정 했는데 기록 안 함?

---

## 9. Decision Quality 향상

### Pre-decision Checklist
- [ ] 충분한 옵션 검토? (최소 3개)
- [ ] 비용/시간 정량화?
- [ ] Trade-off 명시?
- [ ] Stakeholder 참여?
- [ ] Reversibility 분석?
- [ ] Risk + Mitigation?

### Post-decision Review (3~6개월 후)
- 예측이 맞았나?
- Negative consequences가 예상보다 큰가?
- 다른 옵션이 더 나았나?
- 학습 → 다음 결정 개선

---

## 10. Anti-patterns

❌ ADR 없이 큰 결정
❌ "전부 다 그렇게 했으니까"라는 reasoning
❌ Option A 하나만 적고 끝 (대안 분석 ❌)
❌ Trade-off 명시 안 함 ("이게 최선")
❌ 작성 후 다시 보지 않음
❌ Reversible 결정까지 ADR (과잉)
✅ Reversible 결정은 trio 빠른 결정, irreversible만 ADR
