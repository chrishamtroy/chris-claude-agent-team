# Launch Plan Template

> Stage 5 산출물. Stripe, Linear, Notion 출시 플레이북 표준.

---

# Launch Plan — [프로젝트명]

> **Launch date**: YYYY-MM-DD
> **Launch type**: [Soft / Beta / GA / Big Bang / Phased]
> **Owner**: [PM 이름]
> **Status**: Planning / In Motion / Launched / Post-launch

---

## 1. Launch Type Decision

### Decision Matrix

| 상황 | 추천 Launch Type |
|------|---------------|
| MVP 가설 검증 단계 | Soft launch (조용한 출시) |
| 제한적 사용자 모집 + 피드백 | Closed beta |
| 누구나 가입, 안정성 미보장 표시 | Open beta |
| 정식 출시, 마케팅 풀가동 | GA (General Availability) |
| 대형 캠페인 1회 | Big Bang |
| 점진적 사용자 확대 | Phased rollout |

### 우리의 선택
**Type**: [선택]
**이유**: ...
**예상 사용자 규모**: T+30일 기준 N명

---

## 2. Stakeholder RACI

| 영역 | Responsible | Accountable | Consulted | Informed |
|------|-----------|-----------|-----------|---------|
| Product spec | PM | PM | Eng, Design | Sales, CS |
| Engineering | Eng Lead | CTO | PM | Marketing |
| Design | Lead Designer | Design Director | PM, Eng | Marketing |
| Marketing | Marketing Lead | CMO | PM | Sales, CS |
| Sales enablement | Sales Lead | VP Sales | PM, Marketing | CS |
| Customer Support | CS Lead | COO | PM, Eng | All |
| Legal / Compliance | Legal | General Counsel | PM | All |
| Finance | Finance Lead | CFO | PM | All |
| PR / Comms | PR Lead | CMO | PM, CEO | All |

**R**esponsible (실행), **A**ccountable (책임), **C**onsulted (자문), **I**nformed (통보)

---

## 3. Launch Timeline (T-90 ~ T+30)

### T-90 days: Strategy & Foundations
- [ ] Launch type 결정
- [ ] Goals / Success criteria 정의
- [ ] Stakeholder kick-off
- [ ] Marketing 전략 초안
- [ ] PR 계획
- [ ] Risk assessment (Pre-mortem)

### T-60 days: Asset Creation
- [ ] Marketing copy 1차
- [ ] Landing page wireframe
- [ ] 데모 영상 시나리오
- [ ] 블로그 글 초안 (3편)
- [ ] PR 보도자료 초안
- [ ] Press kit 자료 수집
- [ ] CS FAQ 작성
- [ ] Sales deck (B2B 시)

### T-30 days: Beta & Validation
- [ ] Closed beta 시작 (N=50~100)
- [ ] 베타 사용자 인터뷰
- [ ] 메시지 검증 (A/B)
- [ ] 랜딩 페이지 완성
- [ ] 영상 제작 완료
- [ ] PR 미디어 리스트 확정
- [ ] 인플루언서 outreach 시작
- [ ] CS 팀 교육
- [ ] Sales 팀 교육 (B2B)

### T-14 days: Pre-launch
- [ ] PR embargo 설정 + 미디어 사전 브리핑
- [ ] 이메일 캠페인 준비
- [ ] SNS 콘텐츠 일정
- [ ] Product Hunt 준비 (해당 시)
- [ ] 인플루언서 콘텐츠 협업
- [ ] Status page 준비
- [ ] Monitoring/Alert 설정

### T-7 days: Final Prep
- [ ] Final QA
- [ ] Load test
- [ ] Disaster recovery rehearsal
- [ ] War room 일정 + 인원
- [ ] Crisis comms 템플릿 확정
- [ ] Internal all-hands

### T-1 day: Eve
- [ ] Final checklist
- [ ] 팀 사기 점검
- [ ] 휴식 권장

### T = 0: Launch Day
- [ ] Deploy
- [ ] Status: "We're live!"
- [ ] PR 출고
- [ ] SNS 공식 게시물
- [ ] 이메일 캠페인 발송
- [ ] Product Hunt submit
- [ ] War room 가동
- [ ] Real-time monitoring

### T+1 ~ T+7 days
- [ ] Daily metrics 리뷰
- [ ] Critical bug triage
- [ ] CS 응답
- [ ] PR 대응
- [ ] Social listening
- [ ] Hotfix 배포 (필요시)

### T+30 days: Post-launch Review
- [ ] 메트릭 vs 목표
- [ ] Customer feedback 정리
- [ ] Retrospective (blameless)
- [ ] Next iteration 계획

---

## 4. Marketing Channel Strategy

### Channel Categories

| Category | Channels | Cost | Speed | Reach |
|----------|---------|------|-------|-------|
| **Owned** | 블로그, 이메일, 앱 푸시, 사이트 | 낮음 | 빠름 | 기존 |
| **Earned** | PR, 입소문, UGC, 인플루언서 | 중간 | 느림 | 신규 |
| **Paid** | 검색광고, SNS광고, 디스플레이 | 높음 | 빠름 | 신규 |
| **Shared** | SNS 게시, 커뮤니티, 추천 | 낮음 | 중간 | 신규 |

### Top 3 Channels for This Launch

| # | Channel | 메시지 (1-line hook) | Owner | Budget | Expected Reach |
|---|---------|------------------|-------|--------|---------------|
| 1 | [채널] | ... | | | |
| 2 | [채널] | ... | | | |
| 3 | [채널] | ... | | | |

**2~3개 채널에 집중. 분산 = 어디서도 안 됨.**

### 한국 시장 채널 우선순위 (해당 시)

- 네이버 검색광고
- 카카오톡 채널 알림
- 디스콰이엇 / 디스코드 커뮤니티
- 유튜브 협업
- 디지털타임스/플래텀 PR
- 인스타그램 (B2C)

---

## 5. Messaging Architecture

### Core Message (한 줄)
> [최종 메시지]

### Variations
- **For investors**: ...
- **For users (B2C)**: ...
- **For decision makers (B2B)**: ...
- **For developers**: ...
- **For press**: ...

### Proof Points (3개)
1. [데이터/사실/사용자 인용]
2. ...
3. ...

### Call-to-Action
- Primary: [무엇을 시켜야 하나]
- Secondary: ...

---

## 6. Crisis Scenarios

### Scenario 1: Critical Bug Discovered Post-launch

**Signal**: Error rate > 1%, 사용자 다수 불만 보고
**Owner**: Eng Lead
**Action**:
1. Feature flag off (5분 내)
2. War room 소집
3. Status page 업데이트: "[기능명] 일시 비활성화"
4. SNS 공지 (2시간 내)
5. 영향 받은 사용자 이메일 (24시간 내)
6. Postmortem 작성 (1주 내)

### Scenario 2: 부정적 PR / SNS 폭주

**Signal**: 부정 멘션 급증, 트렌드 진입
**Owner**: PR Lead
**Action**:
1. 사실 확인 (1시간 내)
2. 내부 align (PM + CEO + PR)
3. 공식 응답 (4시간 내, 너무 빠르면 미숙)
4. 응답: 사과 / 해명 / 보상 매트릭스
5. 직접 사용자 outreach

### Scenario 3: 서버 다운 / DDoS

**Signal**: Uptime < 99%
**Owner**: SRE
**Action**:
1. Auto-scaling 확인
2. CDN 캐싱
3. Status page
4. Public update (30분 간격)

### Scenario 4: 경쟁사 대응 출시

**Signal**: 경쟁사 비슷한 기능/제품 발표
**Owner**: PM + Marketing
**Action**:
1. 차별점 재정의 (24시간 내)
2. Messaging update
3. Sales 팀 brief
4. Reactive 콘텐츠 (블로그/SNS)

### Scenario 5: 데이터 유출 / 보안 침해

**Signal**: 보안팀 알람
**Owner**: CISO + Legal
**Action**:
1. **즉시 격리**
2. Legal 자문
3. 영향 사용자 식별
4. 통보 (PIPA: 72시간 내)
5. KISA 신고 (해당 시)
6. PR 응대
7. 보안 강화 + 보상

---

## 7. Press Kit Materials

- [ ] **보도자료** (Korean + English)
- [ ] **CEO/Founder 인용구**
- [ ] **사용자 인용구** (사전 동의 받은 것)
- [ ] **제품 스크린샷** (고해상도, 5장 이상)
- [ ] **로고 패키지** (PNG/SVG, 색상/흑백)
- [ ] **CEO 프로필 사진**
- [ ] **데모 영상** (1분 + 3분 버전)
- [ ] **회사 소개 자료** (1-pager)
- [ ] **연락처** (media@company.com)

---

## 8. Internal Comms

### Pre-launch (T-7)
- All-hands 발표
- "What's launching, why, who"
- 직원 SNS 가이드 (공유 어떻게)

### Launch Day (T = 0)
- 슬랙 #launch 채널 활성화
- War room 화상 회의 상시
- Real-time metrics 공유

### Post-launch (T+1, T+7, T+30)
- 일일 metrics 업데이트
- 주간 retrospective
- 30일 보고서 (blameless)

---

## 9. Success Criteria

### Vanity Metrics (참고만)
- Total signups
- Press mentions
- Social impressions

### Real Metrics (의사결정)
- **Acquisition**: T+30일 신규 활성 사용자 N명
- **Activation**: 가입자 중 핵심 가치 경험 비율 X%
- **Retention**: T+7 retention Y%, T+30 retention Z%
- **Monetization**: T+30일 유료 전환 W명, MRR $V

→ 상세: `05-analytics-plan.md`

### "Launch Success" 정의 (사전 합의)

다음 모두 충족 시 출시 성공:
- [ ] Acquisition 목표의 70%+
- [ ] Activation 목표의 60%+
- [ ] T+7 retention > 30%
- [ ] Critical bug 0개
- [ ] CSAT 4.0+/5.0

→ 미달 시 다음 iteration 계획 + 학습

---

## 10. Post-launch Retrospective (T+30)

### What Worked
- ...

### What Didn't Work
- ...

### Surprises
- ...

### Decisions Going Forward
1. [Decision] — Owner: ___
2. ...

### Learnings for Next Launch
1. ...

**Format**: Blameless. 시스템 개선 초점, 개인 책임 묻지 않음.
