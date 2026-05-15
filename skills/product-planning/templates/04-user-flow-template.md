# User Flow Template

> Stage 4 산출물 2/2. Mermaid 다이어그램으로 시각화.

---

# User Flows — [프로젝트명]

> **Version**: v0.1
> **Reference**: 02-prd.md, 03-feature-spec.md, 04-information-architecture.md

---

## Mermaid 표기법

### Node Types
- `A[Rectangle]` — 화면/페이지
- `B(Rounded)` — 사용자 액션
- `C{Diamond}` — 분기/조건
- `D[(Cylinder)]` — 데이터/저장
- `E((Circle))` — 시작/종료
- `F>Banner]` — 알림/Toast
- `G[/Trapezoid/]` — 입력 폼

### Color Coding (일관성)
```mermaid
flowchart TD
    Start((Start)):::terminal
    Screen[Screen]:::screen
    Action(Action):::action
    Decision{Decision}:::decision
    Success[Success]:::success
    Error[Error]:::error
    Empty[Empty]:::empty
    Loading[Loading]:::loading

    classDef terminal fill:#212121,color:#fff
    classDef screen fill:#e3f2fd
    classDef action fill:#f3e5f5
    classDef decision fill:#fff9c4
    classDef success fill:#c8e6c9
    classDef error fill:#ffcdd2
    classDef empty fill:#f5f5f5
    classDef loading fill:#fff3e0
```

---

## Flow 카테고리 (모두 작성)

### 1. Onboarding Flow

> 첫 사용자가 핵심 가치를 경험하는 흐름. "Time to Value" 단축이 핵심.

```mermaid
flowchart TD
    Land((Landing)):::terminal --> Signup[Signup Page]:::screen
    Signup --> EmailForm[/Email Form/]:::screen
    EmailForm --> Submit(Submit):::action
    Submit --> Valid{Valid?}:::decision
    Valid -->|No| InlineError[Inline error]:::error
    InlineError --> EmailForm
    Valid -->|Yes| EmailSent[Verification email sent]:::success
    EmailSent --> CheckEmail((Check email)):::terminal
    CheckEmail --> Verify[Click verify link]:::action
    Verify --> Onboarding[Onboarding Step 1]:::screen
    Onboarding --> Profile[Profile Setup]:::screen
    Profile --> FirstValue[First Value Moment]:::success
    FirstValue --> Dashboard((Dashboard)):::terminal

    classDef terminal fill:#212121,color:#fff
    classDef screen fill:#e3f2fd
    classDef action fill:#f3e5f5
    classDef decision fill:#fff9c4
    classDef success fill:#c8e6c9
    classDef error fill:#ffcdd2
```

**핵심 지표**:
- Activation rate (Signup → First value)
- Time to first value
- Drop-off per step

---

### 2. Main Usage Flow (Persona별)

#### Persona A: [페르소나명] 메인 사용

```mermaid
flowchart TD
    Open((Open app)):::terminal --> Dashboard[Dashboard]:::screen
    Dashboard --> Has{데이터?}:::decision
    Has -->|No| Empty[Empty state<br/>+ CTA]:::empty
    Empty --> CreateNew(Create new):::action
    Has -->|Yes| Loading[Loading<br/>Skeleton]:::loading
    Loading --> Loaded{성공?}:::decision
    Loaded -->|Yes| List[List view]:::screen
    Loaded -->|No| Error[Error<br/>+ Retry]:::error
    List --> ItemClick(Click item):::action
    ItemClick --> Detail[Detail view]:::screen
    Detail --> Edit(Edit):::action
    Edit --> Form[/Edit form/]:::screen
    Form --> Save(Save):::action
    Save --> Saved>Saved toast]:::success
    Saved --> Detail
```

#### Persona B: [페르소나명] 메인 사용
[다이어그램]

---

### 3. Payment / Conversion Flow

```mermaid
flowchart TD
    Free[Free plan user]:::screen --> Trigger(가격 페이지 방문):::action
    Trigger --> Pricing[Pricing page]:::screen
    Pricing --> PlanSelect(플랜 선택):::action
    PlanSelect --> Checkout[/Checkout/]:::screen
    Checkout --> PaymentMethod{결제 수단?}:::decision
    PaymentMethod -->|카드| CardForm[/Card form/]:::screen
    PaymentMethod -->|토스/카카오| PGRedirect[PG redirect]:::screen
    CardForm --> Pay(Pay):::action
    PGRedirect --> Pay
    Pay --> Processing[Processing]:::loading
    Processing --> Result{성공?}:::decision
    Result -->|Yes| Success[Subscription active]:::success
    Result -->|No| Failed[Payment failed<br/>+ Retry]:::error
    Failed --> CardForm
    Success --> Welcome((Welcome to Pro)):::terminal
```

---

### 4. Error / Exception Flows

#### 권한 없음
```mermaid
flowchart LR
    Request(Request action) --> CheckPerm{권한?}
    CheckPerm -->|No| Modal[Permission modal]:::error
    CheckPerm -->|Yes| Proceed[Proceed]
    Modal --> Request_Permission(Request)
    Request_Permission --> WaitApproval[Wait approval]
```

#### 오프라인
```mermaid
flowchart LR
    Action(User action) --> Connection{Connected?}
    Connection -->|No| Cache[Save locally]
    Cache --> OfflineBanner>You're offline]
    Connection -->|Yes| Send[Send to server]
    OfflineBanner --> Reconnect{Reconnected?}
    Reconnect -->|Yes| Sync[Sync local data]
```

#### Rate Limit
```mermaid
flowchart LR
    Many(Many requests) --> RateLimit{Limit?}
    RateLimit -->|Exceed| Toast>Slow down]:::error
    RateLimit -->|OK| Process
    Toast --> Wait[Wait 60s]
```

---

### 5. Notification / Retention Flow

```mermaid
flowchart TD
    Trigger[(Event in app)] --> NotifLogic{Notify?}
    NotifLogic -->|Yes| Channel{Channel?}
    Channel -->|Push| PushSent[Push notification]:::action
    Channel -->|Email| EmailSent[Email sent]:::action
    Channel -->|KakaoTalk| KakaoSent[Kakao alimtalk]:::action
    PushSent --> UserAction{Click?}
    UserAction -->|Yes| Deeplink[Deep link to feature]:::screen
    UserAction -->|No| Discard[No engagement]
    Deeplink --> Feature((Feature page)):::terminal
```

---

### 6. Admin Flow (해당 시)

```mermaid
flowchart TD
    AdminLogin((Admin login)):::terminal --> AdminDash[Admin dashboard]:::screen
    AdminDash --> SelectAction{Action?}:::decision
    SelectAction -->|User mgmt| UserList[User list]:::screen
    SelectAction -->|Content| Content[Content management]:::screen
    SelectAction -->|System| System[System settings]:::screen
    UserList --> SelectUser(Select user):::action
    SelectUser --> UserDetail[User detail]:::screen
    UserDetail --> AdminAction{Action?}:::decision
    AdminAction -->|Ban| Confirm[Confirm modal]:::screen
    AdminAction -->|Reset password| ResetSent>Email sent]:::success
    Confirm --> AuditLog[(Audit log)]
```

---

## Mobile vs Desktop

플로우가 다르다면 분리:

### Mobile-specific
- 단일 column
- Bottom nav
- Swipe gestures
- 한 손 사용 고려

### Desktop-specific
- Multi-column
- Keyboard shortcuts
- Hover interactions
- Multi-window

---

## Interaction Details

플로우 노드만 그리지 말고 인터랙션 디테일도:
- Hover state
- Active state
- Disabled state
- Animation 타이밍 (200~300ms 권장)
- Haptic feedback (모바일)

---

## ⭐ WCAG 2.1 AA 체크리스트

### Perceivable
- [ ] alt text 모든 의미 있는 이미지
- [ ] 색상 대비 4.5:1+ (텍스트), 3:1+ (UI)
- [ ] 색상만으로 정보 전달 ❌
- [ ] 자막 (영상)

### Operable
- [ ] 키보드만으로 모든 기능 사용 가능
- [ ] Focus indicator 명확
- [ ] Skip navigation 링크
- [ ] Touch target 44x44px+
- [ ] 시간 제한 → 연장 옵션

### Understandable
- [ ] 명확한 라벨 + 지시문
- [ ] Inline error + 구체적
- [ ] Predictable navigation
- [ ] Auto-complete

### Robust
- [ ] Valid HTML
- [ ] ARIA 적절 사용
- [ ] Screen reader 테스트

---

## 검증 질문

각 플로우 완료 후:
- [ ] 페르소나가 명확한가?
- [ ] Happy path만 있지 않은가?
- [ ] Empty/Loading/Error state 포함?
- [ ] Drop-off 가능 지점 명시?
- [ ] 모바일 호환?
- [ ] Accessibility 고려?
- [ ] 노드 명이 구체적? ("처리" 같은 모호함 X)
