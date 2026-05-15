---
name: webdev
description: 웹앱/웹페이지 개발 요청 시 기획→개발→QA→배포 파이프라인을 실행하는 웹개발 팀 스킬. Next.js/Supabase/Vercel 스택 기준.
---

# Web Development Team Skill

웹앱/웹페이지 개발 요청을 받으면 이 스킬을 사용하여 기획→개발→QA→배포 파이프라인을 실행합니다.

## 팀 구성

| 에이전트 | 모델 | 역할 |
|---------|------|------|
| wd-orchestrator | opus | 파이프라인 총괄, 에이전트 활성화 결정 |
| wd-product-manager | opus | 요구사항 명확화, KPI 정의 |
| wd-prd-writer | sonnet | PRD 작성 |
| wd-trd-architect | opus | TRD, 아키텍처, DB 스키마, API 설계 |
| wd-ux-designer | sonnet | 와이어프레임, 사용자 흐름 |
| wd-frontend-dev | sonnet | Next.js/React 컴포넌트 구현 |
| wd-backend-dev | sonnet | API Routes, Supabase, 외부 API 통합 |
| wd-code-reviewer | opus | 코드 품질/보안 리뷰 |
| wd-qa-engineer | sonnet | 테스트, 버그 검증 |
| wd-devops-engineer | sonnet | Vercel 배포, CI/CD |

## 기술 스택

- **Framework**: Next.js 14+ App Router
- **Language**: TypeScript (strict)
- **Styling**: Tailwind CSS + shadcn/ui
- **Database**: Supabase (PostgreSQL + RLS)
- **Auth**: Supabase Auth (Email, Kakao, Google)
- **Deploy**: Vercel (Seoul region: icn1)
- **i18n**: next-intl (Korean + English)
- **Payments**: TossPayments (KR) / Stripe (global)

## 파이프라인

```
Stage 0: 제품 기획 (신규 프로덕트/MVP 필수) ← product-planning 스킬 위임
  /product-planning 6단계 실행
  └─ Stage 0~5: Market Research → Discovery → PRD → TRD → User Flow → Launch
  └─ 산출물: <project>-planning/ 디렉토리 (PRD, TRD, User Flow 포함)
       ↓
Stage 1: 기획 보강 (기존 기능 추가/개선용 — Stage 0 산출물 있으면 스킵)
  wd-product-manager → 요구사항 명확화
       ↓
  wd-prd-writer → PRD 작성
       ↓
  wd-trd-architect + wd-ux-designer (병렬)

Stage 2: 개발
  wd-frontend-dev + wd-backend-dev (병렬 가능)
       ↓
  wd-code-reviewer (APPROVE 시 Stage 3 진행)

Stage 3: QA & 배포
  wd-qa-engineer → GO 판정 시
       ↓
  wd-devops-engineer → Vercel 배포
```

## product-planning 스킬 연계 (CRITICAL)

다음 경우 **반드시 Stage 0에서 `product-planning` 스킬을 먼저 실행**한다:

| 상황 | Stage 0 (product-planning) | Stage 1 (wd-*) |
|------|--------------------------|----------------|
| 새 프로덕트/SaaS/앱 시작 | ✅ 필수 (Full 6단계) | ❌ 스킵 |
| 새 모듈/주요 기능군 추가 | ✅ 권장 (Lite 모드 1~4) | ❌ 스킵 |
| 기존 기능에 신규 화면 추가 | ⚠️ 선택 | ✅ 필수 |
| 버그 수정/리팩토링 | ❌ 스킵 | ❌ 스킵 (Stage 2부터) |
| UI 개선/카피 수정 | ❌ 스킵 | ⚠️ UX만 |

**Stage 0 산출물이 있으면 Stage 1을 스킵**한다.
`<project>-planning/02-prd.md`, `03-trd.md`, `04-user-flow.md`가 곧 Stage 1 산출물 역할.

## 사용 규칙

1. **신규 프로덕트/SaaS**: Stage 0 (product-planning) → Stage 2 직진
2. **신규 기능 (3개+ 파일)**: Stage 0 (Lite) 또는 Stage 1 → Stage 2
3. **버그 수정 (1-2 파일)**: Stage 0/1 스킵, 개발 + 리뷰만
4. **UI 전용 변경**: UX 설계 → 프론트엔드 → 리뷰
5. **API 전용 변경**: TRD → 백엔드 → 리뷰
6. **핫픽스**: 수정 → 리뷰 → 즉시 배포
7. wd-code-reviewer가 BLOCK 판정 시 → 개발자로 반환
8. wd-qa-engineer가 NO-GO 시 → 개발자로 반환

## 실행 방법

```
웹 개발 요청 → wd-orchestrator 호출 → 파이프라인 자동 실행
```

요청 예시:
- "스마트스토어 연동 주문 현황 페이지 만들어줘"
- "Shopify webhook 처리 API 엔드포인트 추가"
- "로그인 페이지 UI 개선"
- "결제 완료 이메일 자동 발송 기능"

## 산출물

| 단계 | 파일 |
|------|------|
| 제품 기획 (Stage 0) | `<project>-planning/00~05-*.md` (product-planning 6단계 산출물) |
| 기획 (Stage 1) | docs/prd-[feature].md |
| 기술설계 | docs/trd-[feature].md |
| UX | docs/ux-[feature].md |
| 리뷰 | docs/review-[feature].md |
| QA | docs/qa-[feature].md |
| 배포 | docs/deploy-[feature].md |

## 관련 스킬

- **product-planning**: 신규 프로덕트/MVP 기획 (Stage 0 위임)
- **brainstorm**: Stage 0 진입 전 아이디어 발산이 필요할 때
- **agent-router**: "기획해 줘" / "PRD 만들어 줘" 키워드 자동 라우팅
