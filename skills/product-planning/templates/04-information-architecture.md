# Information Architecture Template

> Stage 4 산출물 1/2. 사이트맵, 화면 인벤토리, navigation pattern.

---

# Information Architecture — [프로젝트명]

> **Version**: v0.1
> **Reference**: 02-prd.md, 03-feature-spec.md

---

## 1. Sitemap

### Public (미인증)
```
/                          Landing page
├── /pricing               요금
├── /about                 회사 소개
├── /blog                  블로그
├── /contact               문의
├── /privacy               개인정보처리방침
├── /terms                 서비스 약관
└── /auth
    ├── /signin            로그인
    ├── /signup            회원가입
    └── /forgot-password   비밀번호 재설정
```

### Authenticated (일반 사용자)
```
/dashboard                  메인 hub (로그인 직후)
├── /[main-feature-1]       [기능 영역 1]
│   ├── /                   리스트
│   ├── /new                생성
│   ├── /:id                상세
│   └── /:id/edit           편집
├── /[main-feature-2]       [기능 영역 2]
│   └── ...
├── /messages               메시지
│   ├── /                   인박스
│   └── /:id                대화
└── /settings               설정
    ├── /profile
    ├── /notifications
    ├── /billing
    └── /security
```

### Admin (관리자)
```
/admin
├── /users                 사용자 관리
├── /analytics             분석
├── /content               콘텐츠 관리
└── /system                시스템
```

---

## 2. Navigation Pattern

### Primary Navigation

선택한 패턴: **[Top nav / Side nav / Bottom nav / Hamburger]**

이유: ...

| Pattern | 적합 | 부적합 |
|---------|-----|------|
| Top nav | 데스크톱, 5개 이하 메뉴 | 모바일 |
| Side nav | 콘텐츠 많은 SaaS | 모바일 |
| Bottom nav | 모바일 우선 | 5개 초과 |
| Hamburger | 모바일 보조 | 탐색성 ↓ |

### Secondary Navigation
- 검색
- 알림
- 사용자 메뉴 (drop-down)
- Help / Feedback

### Mobile Navigation
- Top: 로고 + 햄버거 + 알림
- Bottom: 핵심 5개 (홈/검색/+/알림/마이)

---

## 3. Screen Inventory

| ID | Screen | Route | Purpose | Priority | Related Features |
|----|--------|-------|---------|---------|----------------|
| S001 | Landing | / | 미가입자 첫 화면 | P0 | (마케팅) |
| S002 | Signup | /signup | 회원가입 | P0 | 1.1.1 |
| S003 | Signin | /signin | 로그인 | P0 | 1.1.2 |
| S004 | Dashboard | /dashboard | Hub | P0 | 1.2.x |
| S005 | [Feature1] List | /feature1 | 리스트 | P0 | 2.1.x |
| S006 | [Feature1] Detail | /feature1/:id | 상세 | P0 | 2.1.2 |
| S007 | Settings | /settings | 설정 | P1 | 1.3.x |
| ... | | | | | |

---

## 4. URL Naming Convention

원칙:
- 명사 사용 (동사 ❌)
- 복수형 (resources)
- kebab-case (snake_case ❌)
- 짧고 명확
- SEO 친화적 (한글 URL ❌, 영문 ✅)

예시:
- ✅ `/students/123`
- ❌ `/getStudent/123`
- ✅ `/billing/subscriptions`
- ❌ `/billing_subscriptions`

---

## 5. Page Hierarchy

```
Level 1 (Top nav 항목)
   Level 2 (Side nav 또는 sub nav)
      Level 3 (개별 페이지)
         Level 4 (모달 / 디테일)
```

3-depth 이상은 navigation 어려움 → modal 또는 inline 처리.

---

## 6. Responsive Strategy

### Breakpoints
- Mobile: < 768px
- Tablet: 768~1024px
- Desktop: > 1024px

### Mobile-first vs Desktop-first
선택: [Mobile-first / Desktop-first]
이유: ...

### Mobile-specific 화면
- 일부 화면은 모바일에서 단순화 또는 다른 레이아웃
- 예: 데스크톱 multi-column → 모바일 single column + tab

---

## 7. Empty / Error Routes

- 404 page: 친절한 메시지 + 홈으로 / 검색
- 500 page: "잠시 후 다시" + 상태 페이지 링크
- 503 (maintenance): 예상 복구 시간
- 403 (forbidden): 권한 안내
- 401 (unauthorized): 로그인 페이지로 redirect

---

## 8. SEO 구조 (Public 페이지)

### Meta 표준
- Title: [Page] | [Brand]
- Description: ~155자
- OG image: 1200x630

### URL 구조
- 공개 페이지: SEO 친화
- /blog/[slug] (날짜 X, 영구 URL)
- 다국어: /ko/blog/... + hreflang tag

### Sitemap.xml + robots.txt
- 정적 페이지 + 동적 페이지 (블로그, 상품)
- 비공개 페이지 disallow

---

## 9. Information Hierarchy 원칙

### 7±2 규칙 (Miller)
- 한 메뉴에 5~9개 항목
- 더 많으면 그룹화

### Hick's Law
- 선택지 ↑ → 결정 시간 ↑
- 핵심 액션 1~2개만 prominent

### F-pattern / Z-pattern
- 사용자 시선 흐름 고려
- 중요한 정보 좌상단

### Progressive Disclosure
- 한 번에 모든 기능 노출 ❌
- 필요할 때 점진적 공개
