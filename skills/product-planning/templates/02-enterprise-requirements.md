# Enterprise Requirements Template

> Stage 2 산출물. 기본 PRD 외에 Enterprise tier에 필요한 추가 명세.
> Reference: `references/enterprise-sales-motion.md`

---

# Enterprise Requirements — [프로젝트명]

> **Reference**: 02-prd.md, 02-pricing-packaging.md
> **Owner**: PM + Tech Lead + CISO

---

## 1. Enterprise Tier 정의

### Target Customer
- **Company size**: 500+ employees / $50M+ ARR
- **Decision process**: Procurement + Security + Legal review
- **Sales motion**: Sales-led, 6~18 month cycle
- **ACV target**: $50K~$500K+

### Pricing 시그널
- **Pro tier**: 모든 사용자 사용 가능
- **Business tier**: SMB ~ Mid-market 50~500명
- **Enterprise tier**: 협상 가격 ("Contact Sales")
  - Floor: $50K/year
  - Multi-year discount 25~35%

---

## 2. ⭐ SSO (Single Sign-On)

### 지원 protocol
- [ ] **SAML 2.0** — 표준, Okta/Azure AD/Google Workspace
- [ ] **OIDC** — OAuth 2.0 기반 모던 standard
- [ ] **JIT Provisioning** — 첫 로그인 시 계정 자동 생성

### Implementation
- IDP-initiated + SP-initiated 둘 다 지원
- SSO 우회 (admin only): Recovery 안전망
- SSO 강제 옵션: 모든 사용자 SSO 필수

### 가격
- Enterprise tier 전용
- SSO Tax 안 함 (반-패턴 인식 증가)

### Vendor 선택
- **자체 구현**: SAML 라이브러리 (Passport.js)
- **WorkOS** ($125/connection): 빠른 통합
- **Auth0 / Clerk**: 인증 + SSO 통합
- **Supabase Auth + 직접 SSO**

---

## 3. ⭐ SCIM (자동 Provisioning)

### 무엇
HR 시스템 (Workday, SAP) → IdP (Okta) → Our app 자동 sync.

### Endpoints (SCIM 2.0)
- `GET /Users` — 사용자 목록
- `POST /Users` — 사용자 생성
- `PATCH /Users/:id` — 사용자 수정
- `DELETE /Users/:id` — 사용자 deactivation
- `GET /Groups` — 그룹 목록
- `POST /Groups` — 그룹 생성

### Use Cases
- 입사 → 계정 자동 생성 + role 할당
- 부서 이동 → role 자동 변경
- 퇴사 → 계정 즉시 deactivation (중요!)
- 그룹 변경 → permission 자동 변경

### Implementation 옵션
- **자체 구현**: SCIM spec 직접
- **WorkOS Directory Sync**: 가장 빠름
- **BoxyHQ**: 오픈소스

---

## 4. ⭐ RBAC (Role-Based Access Control)

### Standard Roles
| Role | Permission |
|------|-----------|
| **Owner** | All admin + billing |
| **Admin** | All settings, no billing |
| **Member** | Use product, no admin |
| **Viewer** | Read-only |
| **Guest** | Limited resources |

### Granularity
- Org level: 위 5개
- Workspace level: 동일 5개 또는 다른 set
- Resource level (per document/project)

### Custom Roles (Enterprise)
- 회사가 직접 role 정의
- Permission matrix 노출
- API로 role 관리

### ABAC (선택, 복잡)
- Attribute 기반 (department, location, time)
- 보통 SaaS 과함, 큰 enterprise에서만

---

## 5. ⭐ Audit Logs

### What to Log
모든 다음 actions:

#### Admin actions
- User created / modified / deleted
- Role changed
- Permission changed
- Workspace setting changed
- API key created / deleted
- Billing 변경

#### Sensitive data actions
- Resource viewed (선택, log volume)
- Resource modified
- Resource deleted
- Resource shared / unshared
- Resource exported

#### Authentication
- Login (success / failure)
- Logout
- Password reset
- SSO authentication
- MFA challenge

### Log Format
```json
{
  "id": "audit_xxx",
  "timestamp": "2026-05-15T10:30:00Z",
  "actor": {
    "id": "user_xxx",
    "email": "admin@company.com",
    "ip": "1.2.3.4",
    "user_agent": "..."
  },
  "action": "user.role.changed",
  "resource": {
    "type": "user",
    "id": "user_yyy"
  },
  "context": {
    "old_role": "member",
    "new_role": "admin",
    "workspace": "ws_xxx"
  },
  "metadata": {
    "session_id": "...",
    "request_id": "..."
  }
}
```

### Retention
- **Standard**: 90일
- **Enterprise**: 1년
- **Compliance (HIPAA/Finance)**: 7년

### Export
- API endpoint
- SIEM 통합 (Splunk, Datadog, ELK)
- Webhook (real-time streaming)

### UI
- 검색 (actor, action, resource, timeframe)
- Export CSV
- Compliance reporting

---

## 6. Data Residency

### 옵션
| 지역 | 사용자 | 이유 |
|------|------|------|
| **US** | Default | 일반 |
| **EU** | EU 사용자 | GDPR Article 44 |
| **한국** | 공공 / 금융 | CSAP, 금감원 |
| **싱가포르** | APAC | 일본/SEA |
| **호주** | AU | 정부 |

### Implementation
- Multi-region DB (regions마다 별도)
- Routing logic (org 가입 시 region 선택)
- Cross-region 데이터 이동 금지
- Compliance 인증 region별

### Custom Data Residency (Enterprise)
- 회사가 지정한 region
- 추가 비용 (single-tenant 가까운)

---

## 7. SLA (Service Level Agreement)

### Standard SLAs

| Tier | Uptime | Max Monthly Downtime | Penalty |
|------|--------|---------------------|---------|
| Pro | 99.9% | 43분 | None |
| Business | 99.9% | 43분 | 10% credit |
| Enterprise | 99.95% | 22분 | 25% credit |
| Enterprise+ | 99.99% | 4분 | 50% credit |

### Definitions
- **Uptime**: 핵심 기능 정상 작동 시간
- **Downtime exclusions**: planned maintenance, force majeure
- **Measurement**: 5분 단위 monitoring (외부)

### Reporting
- Status page (public): status.yourcompany.com
- Monthly uptime report (Enterprise 자동 발송)
- Incident postmortem (P0/P1)

### Implementation
- Multi-region deployment
- Auto-failover
- DR (Disaster Recovery): RPO 1hr, RTO 4hr
- Chaos engineering (Netflix Chaos Monkey 식)

---

## 8. Security Certifications

### 우선순위 (Enterprise 진입 순서)

#### 1년차
- [ ] **SOC 2 Type I** ($15K, 2~3개월) — 시점 검증

#### 2년차
- [ ] **SOC 2 Type II** ($30K, 6+개월) — 운영 검증
- [ ] **GDPR compliance** (EU)
- [ ] **PIPA compliance** (한국)

#### 3년차+
- [ ] **ISO 27001** ($30~50K, 6~12개월) — 글로벌
- [ ] **HIPAA** (의료 영역)
- [ ] **PCI-DSS** (결제 영역)
- [ ] **CSAP** (한국 공공)
- [ ] **FedRAMP** (US Federal)

### 인증 운영
- 매년 audit
- Annual security training
- Penetration test 매년
- Vulnerability scanning 매월

---

## 9. Custom Branding (Whitelabel)

### Standard customization (Enterprise)
- [ ] Custom logo
- [ ] Custom color scheme
- [ ] Custom email "from" address
- [ ] Custom domain (yourapp.brand.com)
- [ ] Custom favicon

### Full whitelabel (추가 비용)
- [ ] 브랜드 완전 제거 (our logo, our name)
- [ ] Custom mobile app (Apple/Google store)
- [ ] Custom email templates
- [ ] Custom CSS

→ Whitelabel은 보통 partner 또는 reseller에게만.

---

## 10. Deployment Options

### Tier 1: SaaS Multi-tenant (default)
- 모든 사용자 같은 infrastructure
- 가장 저렴, 가장 빠른 출시
- 99% 고객에게 적합

### Tier 2: SaaS Single-tenant
- Customer 전용 instance
- 같은 cloud, 격리된 자원
- 가격 2~3x
- 일부 enterprise

### Tier 3: BYOC (Bring Your Own Cloud)
- 우리 product → 그들의 AWS/GCP 계정
- 데이터 = 그들 인프라
- Helm chart, Terraform 제공
- 가격 협상 (보통 SaaS의 3~5x)

### Tier 4: On-premise
- 그들의 데이터센터
- 가장 비쌈, 가장 복잡
- 정부 / 금융 / 의료만
- 매년 라이센스 갱신
- Air-gapped (인터넷 차단) 옵션

---

## 11. API & Integration

### API
- **REST or GraphQL**: 명확한 spec
- **Rate limiting**: 일반 사용자 100/min, Enterprise 협상
- **API keys**: 회사당 여러 keys, role-scoped
- **Webhooks**: 이벤트 push
- **API documentation**: openapi.json, 자동 SDK 생성

### Enterprise Integration
- **Salesforce**: 가장 자주 요청
- **HubSpot**
- **Slack / Microsoft Teams** (notifications)
- **Workday** (HR sync)
- **Okta / Azure AD** (SSO)
- **Datadog / Splunk** (logs)
- **Zapier / Make** (no-code)

### Custom Integration
- Public API + 그들의 dev팀
- Or 우리가 building (additional fee)

---

## 12. Onboarding Playbook (Enterprise)

### Pre-kickoff (Week 0)
- [ ] Contract signed
- [ ] Kickoff 일정
- [ ] Stakeholder map
- [ ] CSM 배정
- [ ] Technical contact 확인

### Week 1: Kickoff
- [ ] Goals confirmed (PoC 결과 기반)
- [ ] Timeline + milestones
- [ ] Internal team 소개 (CSM, Implementation Engineer, Solutions Architect)
- [ ] 그들 team 소개 (Champion, Decision maker, Technical lead, End user reps)

### Week 2~4: Technical Setup
- [ ] SSO 통합 (SAML/OIDC 설정)
- [ ] SCIM 통합 (자동 provisioning)
- [ ] Domain verification
- [ ] Custom branding 적용
- [ ] Integrations (Slack, etc)
- [ ] Data migration (if applicable)
- [ ] Security review 완료

### Week 5~8: Pilot Rollout
- [ ] 50명 pilot group
- [ ] Training session (admin)
- [ ] Training session (end user)
- [ ] Office hours (주 2회)
- [ ] Initial feedback 수집

### Week 9~12: Full Rollout
- [ ] 전사 announcement
- [ ] 모든 user provisioning
- [ ] Training resources (videos, docs)
- [ ] Help center 카스텀
- [ ] Slack channel for support

### Week 13~14: Hypercare
- [ ] Daily check-in
- [ ] Critical bug priority
- [ ] CSM weekly QBR 시작

### Month 4+: Steady State
- [ ] Quarterly Business Review (QBR)
- [ ] Adoption metrics 추적
- [ ] Expansion 기회 식별
- [ ] Renewal 준비 (90일 전)

---

## 13. Custom Features Decision Framework

영업이 요청 가져옴: "이 고객이 X 기능 필요해요."

### Decision Tree

```
요청 도착
   ↓
이미 roadmap에?
   ├─ Yes → "Beta로 초대 가능. Q3 예정."
   └─ No
       ↓
   다른 고객도 요청한 적 있나?
       ├─ Yes (3+ customer)
       │     ↓
       │  RICE 점수 매기기
       │     ↓
       │  Top quartile? → Yes: Roadmap 추가
       │              → No: P2 backlog
       │
       └─ No (이 고객만)
           ↓
       전략적으로 맞나?
           ├─ Yes → "next 분기 또는 SOW"
           └─ No
               ↓
           고객 가치 큼?
               ├─ Yes ($X+) → "SOW $Y 추가 비용"
               └─ No → "이 요청은 안 받습니다. 대신 [기존 기능 Z] 가능?"
```

### Custom Feature 정책
1. **Generalize 가능**: 일반화 → 모두에게
2. **SOW 가능**: 별도 비용 + 별도 timeline + IP는 우리 것
3. **Reject**: 정중하게 거절 + 대안 제시

---

## 14. Enterprise Communication Cadence

### Pre-sale
- Bi-weekly check-in (Sales lead)
- Monthly executive sponsor call

### Implementation
- Weekly stand-up (CSM)
- Daily Slack channel

### Post-launch
- Monthly: CSM check-in
- Quarterly: QBR (Quarterly Business Review)
- Annually: Executive review + renewal discussion

### Internal (우리 회사)
- Sales-PM weekly sync
- Customer feedback review (monthly)
- Strategic account review (quarterly)

---

## 15. Enterprise PRD Section (PRD에 추가)

기본 PRD 외 다음 섹션:

### A. Enterprise Tier 정의 (target, pricing range)
### B. SSO/SCIM 요구사항
### C. Audit Log spec
### D. RBAC matrix
### E. SLA tier
### F. Data residency options
### G. Compliance roadmap (SOC 2, ISO 등)
### H. Custom branding options
### I. Deployment options (SaaS, BYOC, on-prem)
### J. API & integration roadmap
### K. Onboarding playbook
### L. Custom feature policy

---

## 16. Enterprise Roadmap Timeline (참고)

```
Year 1: SMB → Mid-market
  - SOC 2 Type I
  - Basic SSO
  - Audit log (90일)
  - Basic RBAC (Admin/Member)

Year 2: Mid-market → Enterprise (entry)
  - SOC 2 Type II
  - SCIM
  - Advanced RBAC + Custom roles
  - 99.95% SLA
  - Audit log (1년)
  - Multi-region

Year 3+: Enterprise mature
  - ISO 27001
  - Custom data residency
  - BYOC option
  - Advanced compliance (HIPAA, FedRAMP)
  - White-label
  - On-premise option (드물게)
```

---

## 17. PM 체크리스트 (Enterprise tier 출시 전)

- [ ] SSO (SAML + OIDC)
- [ ] SCIM
- [ ] RBAC (최소 5 standard roles)
- [ ] Audit log (모든 admin/sensitive actions)
- [ ] SLA 정의 + monitoring
- [ ] Status page
- [ ] SOC 2 Type I (최소)
- [ ] DPA (Data Processing Agreement) 양식
- [ ] MSA 표준 양식
- [ ] Security questionnaire 답변 자료
- [ ] Implementation playbook
- [ ] CSM 배정 프로세스
- [ ] Sales enablement (battle cards, demo, ROI calc)
- [ ] Custom branding (기본)
- [ ] API + Webhook
- [ ] Custom feature 평가 framework
- [ ] Reference customer 3~5명

---

## Reference

- `references/enterprise-sales-motion.md` (전체 sales 가이드)
- `templates/02-prd-template.md` (Section 15 Privacy & Compliance)
- `templates/02-pricing-packaging.md` (Pricing 전체)
