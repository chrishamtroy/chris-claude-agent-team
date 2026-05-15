# B2B Enterprise Sales Motion

> Enterprise B2B SaaS의 영업 motion 전체 가이드.
> PM이 영업팀과 협업하고 Enterprise 요구사항을 PRD에 반영하기 위한 기준서.

---

## 1. Sales Motion 유형 (Spectrum)

### 1.1 4가지 Motion

| Motion | ACV (Annual Contract Value) | Sales Cycle | Customer Touch | 대표 회사 |
|--------|---------|---------|------------|---------|
| **Self-serve (PLG)** | $0~5K | 0~30일 | Zero-touch | Notion, Linear (초기), Figma (초기) |
| **Sales-assisted** | $5K~50K | 30~90일 | Low-touch | Notion (Team), Figma (Org) |
| **Sales-led** | $50K~500K | 3~6개월 | High-touch | Salesforce, HubSpot, Atlassian |
| **Enterprise** | $500K+ | 6~18개월 | White-glove | Workday, ServiceNow, Palantir |

### 1.2 회사 진화 패턴

```
초기: PLG (Self-serve, individual users)
        ↓
중기: Sales-assisted (small teams → orgs)
        ↓
성숙: Sales-led (mid-market)
        ↓
스케일: Enterprise (Fortune 500)
```

**중요**: 한 회사가 여러 motion 동시 운영. PM은 모든 motion 이해 필요.

### 1.3 PLG → Enterprise 전환 신호

다음 신호 보이면 Enterprise motion 시작 시점:
- ✅ 작은 팀에서 부서 단위 → 회사 단위 사용
- ✅ "SSO 필요해요" 요청 증가
- ✅ "Custom contract 가능?" 문의
- ✅ Procurement 부서가 연락
- ✅ Security questionnaire 요청
- ✅ ACV $10K+ 자연 발생

---

## 2. Enterprise Sales Cycle (단계별)

```
Lead Gen → Qualification → Discovery → Demo → PoC/Pilot
   ↓
Procurement → Legal → Negotiation → Close → Onboarding
   ↓
Expansion → Renewal
```

### 2.1 Lead Generation (입구)

#### Inbound
- Marketing-qualified lead (MQL)
- Content download, demo request
- Trial → Sales handoff

#### Outbound
- **ABM (Account-Based Marketing)**: 타겟 회사 리스트 → 맞춤 outreach
- Cold email + LinkedIn
- Event / Conference

#### 한국 B2B 특수
- 기존 고객 referral (가장 강력)
- 업종 컨퍼런스
- 링크드인 (외국계), 카카오워크 채널 (국내)
- 대기업 직원과의 1:1 네트워크

### 2.2 Qualification (이 lead가 진짜?)

**Qualification frameworks**:

#### BANT (전통)
- **B**udget: 예산 있나?
- **A**uthority: 결정권자?
- **N**eed: 진짜 필요?
- **T**iming: 언제까지?

#### MEDDIC (현대 B2B 표준)
- **M**etrics: 측정 가능한 가치?
- **E**conomic buyer: 예산 승인자?
- **D**ecision criteria: 평가 기준?
- **D**ecision process: 의사결정 과정?
- **I**dentify pain: 진짜 pain?
- **C**hampion: 내부 옹호자?

#### MEDDPICC (Enterprise 확장)
+ **P**aper Process: 계약 프로세스?
+ **C**ompetition: 경쟁사?

#### CHAMP (스타트업 친화)
- **CH**allenges: 도전 과제?
- **A**uthority: 권한?
- **M**oney: 돈?
- **P**rioritization: 우선순위?

### 2.3 Discovery (진짜 문제 파악)

**SPIN Selling** (Neil Rackham):
- **S**ituation: 현재 상황은?
- **P**roblem: 어떤 문제?
- **I**mplication: 그 문제의 영향?
- **N**eed-payoff: 해결되면 가치?

#### Discovery 질문 (예시)
- "현재 X를 어떻게 하고 있나요?"
- "이 문제가 얼마나 자주 발생하나요?"
- "이걸 해결 못하면 어떤 영향이 있나요?"
- "이 문제 해결에 작년에 얼마나 썼나요?"
- "이상적인 솔루션은 어떤 모습?"
- "오늘 결정한다면 다음 단계는?"

### 2.4 Demo (시연)

**좋은 demo 원칙**:
1. **Discovery 기반 맞춤화** — 일반 demo ❌
2. **사용자 시나리오** — feature tour ❌
3. **그들의 데이터** (가능시) — sample ❌
4. **Champion 동석** — 혼자 ❌
5. **다음 단계 명확** — "어떠세요?" ❌

**Demo 후 follow-up 24시간 내 필수**.

### 2.5 ⭐ PoC / Pilot (가장 중요한 단계)

→ 상세: `templates/05-poc-playbook.md`

#### 왜 PoC가 중요한가
- Demo는 marketing, PoC는 reality check
- 고객의 실제 환경에서 작동 확인
- Internal champion이 회사 내 stakeholder 설득 가능
- 가격 협상 leverage

#### PoC 성공 기준 (사전 합의)
- 기간: 30~90일
- 참여 사용자 수
- 측정 가능한 결과 (X% 시간 절약, Y개 작업 완료)
- 통합 완료
- Success metric 사전 정의

#### PoC vs Free Trial
| | Free Trial | PoC |
|---|----------|-----|
| Duration | 14~30일 | 30~90일 |
| Setup | Self-serve | Sales engineer 지원 |
| Goals | Try features | Validate specific use case |
| Stakeholders | Individual | Multiple |
| Decision | Personal | Committee |

### 2.6 Procurement / Legal / Security Review

대부분의 시간이 여기서 소요됨.

#### Security Questionnaire
대기업이 보내는 100~500 질문 체크리스트:
- Authentication (MFA, SSO)
- Encryption (at-rest, in-transit)
- Access control
- Audit logs
- Data residency
- Backup / DR
- Incident response
- Compliance (SOC 2, ISO 27001, GDPR)
- Sub-processors

→ **PM 액션**: 이런 요구사항을 미리 PRD에 반영.

#### Compliance Certifications
주요 인증:

| 인증 | 의미 | 비용 | 기간 |
|------|-----|-----|-----|
| **SOC 2 Type I** | 통제 설계 검증 (시점) | ~$15K | 2~3개월 |
| **SOC 2 Type II** | 통제 운영 검증 (6개월+) | ~$30K | 6+개월 |
| **ISO 27001** | 정보보안 관리체계 (글로벌) | $20~50K | 6~12개월 |
| **HIPAA** | 의료 (US) | 변동 | - |
| **PCI-DSS** | 결제 | 변동 | - |
| **CSAP** | 공공 (한국) | ~₩5천만 | 6~12개월 |
| **ISMS** | 정보보호 (한국) | ~₩3천만 | 6개월 |

→ 보통 Enterprise 진입 시 **SOC 2 Type II + ISO 27001** 필요.

#### Legal Review
- **MSA (Master Service Agreement)** — 기본 계약
- **DPA (Data Processing Agreement)** — GDPR 등
- **SLA (Service Level Agreement)** — 99.9% uptime 등
- **NDA (Non-Disclosure Agreement)**
- **BAA (Business Associate Agreement)** — HIPAA

협상 포인트:
- Liability cap
- Termination terms
- Auto-renewal
- Data ownership
- Indemnification

### 2.7 Contract Negotiation

#### 가격 협상 leverage
- **고객 측**:
  - Volume (사용자 수)
  - Multi-year commitment
  - Reference customer 약속
  - Case study 동의
  - Early payment

- **벤더 측 (우리)**:
  - 표준 가격 + 할인율 정책
  - 분기/연말 closing 압박 활용 안 함 (장기 손해)
  - 가치 reframe ("ROI X배")

#### Discount 표준
- Annual: 17%
- 2-year: 25%
- 3-year: 35%
- Volume tier: 별도
- 단, Floor 가격 명시 (그 이하 거부)

### 2.8 Onboarding / Implementation

#### Implementation 단계
1. **Kickoff** (Week 1): 목표, 일정, 인력
2. **Configuration** (Week 2~4): SSO, SCIM, integrations
3. **Pilot rollout** (Week 5~8): 일부 사용자
4. **Training** (Week 6~10): Train-the-trainer
5. **Full rollout** (Week 10+): 전사
6. **Go-live + Hypercare** (Week 12~14): 집중 지원

#### Customer Success Manager (CSM)
- 계약 후 ownership 이전 (Sales → CSM)
- Quarterly Business Review (QBR)
- Renewal 준비

---

## 3. Enterprise 제품 요구사항

Enterprise tier가 SMB tier와 다른 점.

### 3.1 Authentication & Access

#### SSO (Single Sign-On)
- **SAML 2.0** — 표준 (Okta, Azure AD, Google)
- **OIDC** — 모던 (OAuth 2.0 기반)
- **JIT (Just-in-Time) provisioning** — 첫 로그인 시 계정 자동 생성
- Default 가격: Enterprise tier 전용

#### SCIM (System for Cross-domain Identity Management)
- 자동 user provisioning / de-provisioning
- HR 시스템 → IDP → Our app
- 직원 입사 자동 계정 생성
- 직원 퇴사 자동 deactivation

#### RBAC (Role-Based Access Control)
- Admin / Member / Viewer 기본
- Custom roles
- Permission granularity (per feature, per resource)

#### ABAC (Attribute-Based Access Control)
- 더 세밀: department, location, time
- 일반적 SaaS에는 과함

### 3.2 Audit & Compliance

#### Audit Logs
- 모든 admin action 기록
- 모든 sensitive data access 기록
- Retention 7년 (compliance 따라)
- Export 가능 (SIEM 통합)

#### Data Residency
- "데이터를 어디에 저장하나요?"
- EU 사용자 → EU 서버 (GDPR)
- 한국 공공 → 한국 서버 (CSAP)
- US Federal → AWS GovCloud

#### Data Export / Portability
- API로 모든 데이터 export
- GDPR Article 20 준수

#### Right to be Forgotten
- 사용자 데이터 완전 삭제
- 30일 내 처리

### 3.3 SLA & Reliability

#### Standard SLA
- Uptime: 99.9% (월 43분 다운)
- Or 99.95% (월 21분)
- Or 99.99% (월 4분)

#### Penalty
- SLA 미달 시 credit (보통 10~30% off)
- 또는 termination 권리

#### Reporting
- 월간 uptime report
- Status page (public)
- Incident postmortem

### 3.4 Custom Branding

- 로고 교체
- Custom domain (yourbrand.app.com)
- Email from your domain
- White-label (브랜드 완전 제거) — 추가 비용

### 3.5 Deployment Options

#### SaaS (default)
- 우리가 호스팅, 멀티테넌트

#### Dedicated Cloud
- 우리가 호스팅, single-tenant
- 가격 2~5x

#### Private Cloud (BYOC - Bring Your Own Cloud)
- 고객 AWS/GCP 계정에 배포
- 데이터 그들의 인프라
- 가격 협상

#### On-premise
- 고객 데이터센터에 배포
- 가장 비싸고 복잡
- 보통 정부/금융만

### 3.6 Custom Features

#### "Anchor customer" 함정
- 큰 고객 한 명을 위한 커스텀 기능 만들기
- 다른 고객엔 무용
- 유지보수 부담
- → **추구하지 말 것**

#### 좋은 패턴
- 큰 고객 요청을 **일반화**해서 모두에게 가치
- 또는 명확한 추가 비용 + SOW (Statement of Work)

---

## 4. PM의 Enterprise Sales 협업

### 4.1 PM 책임

| 영역 | PM 역할 |
|------|--------|
| Roadmap | 영업이 약속할 수 있는 것 명확히 |
| Custom feature 요청 | 평가 + 답변 (Yes/No/Conditional) |
| RFP 응답 | 기술/제품 부분 작성 |
| Demo 자료 | Sales engineer 협업 |
| Reference customer | 후보 식별 + 관계 관리 |
| Sales enablement | 교육 자료, 경쟁 분석 |
| Pricing 정책 | Sales + Finance 협의 |
| Pilot success | PoC 결과 책임 |

### 4.2 Roadmap Commitment Framework

영업이 가져오는 요청:
> "이 고객이 Q3까지 X 기능이 필요하다고 합니다."

**PM 답변 옵션**:

#### Tier 1: Already on roadmap
> "Q3에 출시 예정이에요. 이 customer를 beta로 초대할 수 있어요."

#### Tier 2: Aligns with strategy
> "전략적으로 맞아요. 다른 priority 조정해서 Q4까지 가능합니다."

#### Tier 3: Reasonable trade-off
> "Q3 가능하지만 [다른 기능 X] 지연됩니다. trade-off 가치 있나요?"

#### Tier 4: Not strategic
> "이 한 고객만 요청한 기능이에요. 우리 제품 방향과 맞지 않습니다.
> 대신 [기존 기능 Y]로 해결 가능한지 보죠."

#### Tier 5: Custom (SOW)
> "표준 제품엔 안 들어가지만, SOW로 별도 개발 가능합니다.
> 예상 비용 $X, 기간 Y개월."

### 4.3 Sales Enablement Materials

PM이 영업 위해 만드는 자료:

- [ ] **Battle cards** — 경쟁사 비교 (강점/약점)
- [ ] **Demo scripts** — 시나리오별 시연 가이드
- [ ] **Competitive intel** — 누가 우리 vs 누구 이기나
- [ ] **ROI calculator** — 고객별 가치 추산
- [ ] **Case studies** — 성공 사례
- [ ] **Reference customer list** — 분야별
- [ ] **Pricing playbook** — 협상 가능 범위
- [ ] **Discovery questions** — Qualification 가이드
- [ ] **Objection handling** — "X 안 돼요"에 답
- [ ] **Product roadmap (sales version)** — Quarter별 비전

### 4.4 Champion 만들기

**Champion**: 고객사 내부에서 우리를 옹호하는 사람.

#### Champion 특성
- 우리 솔루션으로 personal win (커리어 향상)
- Decision maker 접근 가능
- Internal politics 이해
- 우리 응답 빠름

#### Champion 식별
- Demo에서 가장 적극적
- Follow-up 즉시
- Internal meeting 주선
- "내가 정리해서 boss에게 가져갈게요"

#### Champion 지원
- Quarterly check-in
- 새 기능 사전 공개
- Customer Advisory Board 초대
- 사적 관계 (식사, 컨퍼런스)

---

## 5. 한국 B2B 특수성

### 5.1 의사결정 문화

| 글로벌 | 한국 |
|--------|-----|
| 평면 조직, 빠른 결정 | 위계 조직, 결재 라인 |
| Champion이 강력 | 위에서 막힐 수 있음 |
| Demo + PoC로 빠르게 | 제안서 + 사장 보고 |
| Email 결정 | 대면 미팅 선호 |
| 1~3 의사결정자 | 5~10 stakeholder |

### 5.2 한국 Enterprise 의사결정 패턴

```
실무자가 도구 발견
   ↓
실무자가 팀장에 보고
   ↓
팀장이 본부장 결재
   ↓
본부장이 임원 결재 (큰 건)
   ↓
임원이 대표 결재 (매우 큰 건)
   ↓
구매팀 협상
   ↓
법무 검토
   ↓
보안 검토
   ↓
계약 → 결재 → 도장
```

→ 18개월 sales cycle은 흔함.

### 5.3 한국 영업 특수 도구

#### 제안서 (Korean RFP)
- 거의 모든 B2B에서 요구
- 형식: 한글 보고서 (Word/HWP)
- 30~100페이지
- 회사 소개 / 솔루션 / ROI / 일정 / 비용

#### 세금계산서
- 매월 발행
- 사업자번호 필수
- 자동화 (이지페이, 위하고 등)

#### 결재 시스템 통합
- 대기업: SAP, Oracle ERP
- 중견: 더존, 영림원
- 시스템 연동 종종 요청

#### 공동인증서
- B2B 인증
- 카카오 사용 안 함

### 5.4 공공 부문

#### 조달청 나라장터
- 모든 공공 구매 여기서
- 등록 필수 (영업 신고 1년+)
- 입찰 (가격 + 기술 평가)

#### 인증
- **CSAP** — 클라우드 서비스 보안 인증 (필수)
- **ISMS-P** — 정보보호 관리체계 (대형)
- **KISA 정보보호 인증** (선택)

#### 가격
- 보통 민간보다 ↓
- 다년 계약 어려움 (예산 매년)

### 5.5 금융

#### 금감원 가이드라인
- 클라우드 사용 시 사전 신고
- 데이터 국내 위치 (해외 이전 금지)
- 정기 보안 점검

#### 금융보안원 (FSI) 인증
- 일부 시스템 필수

---

## 6. Enterprise Metrics

### 6.1 Sales Metrics

- **Pipeline coverage**: Pipeline / Quota (3~5x 건강)
- **Win rate**: 30%+ 좋음
- **Average deal size (ADR)**
- **Sales cycle length**
- **Lead-to-close conversion**
- **CAC payback period**: 12~18개월 (Enterprise)

### 6.2 Customer Success Metrics

- **Net Revenue Retention (NRR)**: 110%+ 우수
- **Gross Revenue Retention (GRR)**: 95%+ 우수
- **Logo retention**: 90%+ 우수
- **Customer Health Score**
- **Expansion rate**

### 6.3 Product Metrics (Enterprise)

- **Seats per customer** (vs SMB)
- **Feature adoption** (SSO, Audit log 사용?)
- **Power user %**
- **API usage**
- **Custom integration count**

---

## 7. PRD Enterprise Section (별도 필요)

→ 상세: `templates/02-enterprise-requirements.md`

기본 PRD에 추가할 섹션:
1. Enterprise tier 정의
2. SSO/SCIM 요구사항
3. Audit log
4. Data residency
5. SLA tier
6. Custom branding
7. Deployment options
8. Compliance roadmap
9. Onboarding playbook

---

## 8. Enterprise Sales 안티패턴

### 8.1 PM 측

❌ **모든 요청 수락**: "큰 고객이니까" → roadmap 파편화
✅ 명확한 평가 프레임워크 + 거절 능력

❌ **Custom feature 무한 생성**: 유지보수 지옥
✅ Generalize → 모두에게 또는 SOW + 가격

❌ **영업 무시**: "영업이 알아서"
✅ Weekly 영업 sync, 시장 신호 듣기

❌ **Roadmap 약속**: 영업이 약속 → PM 부담
✅ Roadmap commitment framework + sales training

### 8.2 영업 측

❌ **Discovery 없는 demo**
❌ **PoC success criteria 없음** → 끝없는 PoC
❌ **할인 남발**: Floor 무시
❌ **약속 남발**: "Q3까지 됩니다" → PM 비협조

### 8.3 회사 측

❌ **PLG → Enterprise 비전 없음**
❌ **Sales 조직 너무 일찍 (PMF 전)**
❌ **Sales 조직 너무 늦음 (요청 폭주)**
❌ **Self-serve와 Enterprise 충돌**: 다른 가격, 다른 기능

---

## 9. 출처 / 더 읽을거리

- "MEDDPICC" — Andy Whyte
- "The Challenger Sale" — Matthew Dixon, Brent Adamson
- "Predictable Revenue" — Aaron Ross
- "From Impossible to Inevitable" — Aaron Ross, Jason Lemkin
- SaaStr 블로그 (Jason Lemkin)
- "Crossing the Chasm" — Geoffrey Moore
- "Hot Seat" — Dan Shapiro (negotiation)
- Atlassian의 Sales playbook (공개)
