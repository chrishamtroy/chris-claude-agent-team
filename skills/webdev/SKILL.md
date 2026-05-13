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
Stage 1: 기획 (신규 기능 필수)
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

## 사용 규칙

1. **신규 기능 (3개+ 파일)**: Stage 1 완료 후 Stage 2 시작
2. **버그 수정 (1-2 파일)**: Stage 1 스킵, 개발 + 리뷰만
3. **UI 전용 변경**: UX 설계 → 프론트엔드 → 리뷰
4. **API 전용 변경**: TRD → 백엔드 → 리뷰
5. **핫픽스**: 수정 → 리뷰 → 즉시 배포
6. wd-code-reviewer가 BLOCK 판정 시 → 개발자로 반환
7. wd-qa-engineer가 NO-GO 시 → 개발자로 반환

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
| 기획 | docs/prd-[feature].md |
| 기술설계 | docs/trd-[feature].md |
| UX | docs/ux-[feature].md |
| 리뷰 | docs/review-[feature].md |
| QA | docs/qa-[feature].md |
| 배포 | docs/deploy-[feature].md |
