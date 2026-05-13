---
name: marketing-caw
description: 마케팅 CAW 시스템 — Orchestrator가 Content/Visual/Performance/Research 4개 팀을 지휘하여 통합 마케팅 캠페인 실행
---

# 마케팅 CAW 시스템 (Comprehensive Agile Workflow)

## 목적

스마트스토어·Shopify 이커머스와 SNS 콘텐츠 비즈니스를 위한 통합 마케팅 실행 시스템.
콘텐츠 제작부터 광고 집행, 성과 분석까지 4개 전문 팀이 유기적으로 협업하여 
일관된 브랜드 보이스와 최적의 마케팅 성과를 만든다.

## 조직 구조

```
[mkt-orchestrator] ← 전체 지휘
    ├── [Content Director] → blog-writer, social-writer, email-writer
    ├── [Visual Director]  → thumbnail-creator, card-news-creator, video-creator
    ├── [Performance Director] → campaign-planner, ad-analyzer
    ├── [Research Director] → market-researcher, trend-monitor
    └── [QA Team] → brand-checker, content-reviewer
```

## 워크플로우

### Mode 1: 캠페인 전체 실행
```
[마케팅 목표 입력]
        ↓
[Research] 트렌드·시장 조사 (Research Director + 팀)
        ↓
[Strategy] Orchestrator → 캠페인 전략 수립
        ↓
[Parallel Execution]
  ├─ Content Team: 블로그/SNS/이메일 콘텐츠 작성
  ├─ Visual Team: 썸네일/카드뉴스/영상 기획
  └─ Performance Team: 광고 캠페인 설계
        ↓
[QA] brand-checker + content-reviewer 동시 검토
        ↓
[Final Approval] Orchestrator 최종 승인 및 배포 지시
```

### Mode 2: 단일 콘텐츠 제작
```
[콘텐츠 요청]
        ↓
[담당 Director] 작업 배분
        ↓
[담당 Writer/Creator] 제작
        ↓
[QA] content-reviewer 검토
        ↓
[완료]
```

### Mode 3: 성과 분석 및 개선
```
[성과 데이터 입력]
        ↓
[Performance Director + ad-analyzer] 분석
        ↓
[Research Director] 시장 트렌드 대조
        ↓
[개선 권고안] Orchestrator 종합 보고
```

## 에이전트 목록

| 에이전트 | 모델 | 팀 | 역할 |
|---------|------|-----|------|
| mkt-orchestrator | opus | 총괄 | 전체 캠페인 조율, 최종 승인 |
| mkt-brand-checker | sonnet | QA | 브랜드 가이드 준수 검사 |
| mkt-content-reviewer | sonnet | QA | 최종 콘텐츠 품질 검수 |
| mkt-content-director | sonnet | Content | 콘텐츠 전략 및 팀 지시 |
| mkt-blog-writer | sonnet | Content | 블로그 포스트 작성 |
| mkt-social-writer | sonnet | Content | SNS 콘텐츠 작성 |
| mkt-email-writer | sonnet | Content | 이메일 마케팅 카피 |
| mkt-visual-director | sonnet | Visual | 비주얼 방향성 설정 |
| mkt-thumbnail-creator | sonnet | Visual | 썸네일 프롬프트 생성 |
| mkt-card-news-creator | sonnet | Visual | 카드뉴스 기획 |
| mkt-video-creator | sonnet | Visual | 숏폼 영상 스크립트 |
| mkt-performance-director | sonnet | Performance | 광고 전략 및 예산 |
| mkt-campaign-planner | sonnet | Performance | 캠페인 기획 |
| mkt-ad-analyzer | sonnet | Performance | 성과 데이터 분석 |
| mkt-research-director | sonnet | Research | 시장 조사 방향 설정 |
| mkt-market-researcher | sonnet | Research | 시장·경쟁사 분석 |
| mkt-trend-monitor | haiku | Research | 실시간 트렌드 모니터링 |

## 사용법

```
/marketing-caw [마케팅 요청]
```

**예시:**
- `/marketing-caw 신제품 출시 캠페인 전체 기획 — 여름 선글라스 스마트스토어`
- `/marketing-caw 인스타그램 피드 콘텐츠 5개 작성 — 브랜드: [브랜드명]`
- `/marketing-caw 지난달 네이버쇼핑 광고 성과 분석 및 개선안`
- `/marketing-caw 경쟁사 대비 포지셔닝 분석`

## 출력물

**캠페인 실행 시:**
- 캠페인 브리프 (목표/타겟/메시지/채널)
- 콘텐츠 캘린더 (4주 플랜)
- 플랫폼별 콘텐츠 원고 (블로그/인스타/이메일)
- 비주얼 제작 가이드 (썸네일/카드뉴스 프롬프트)
- 광고 캠페인 설정 가이드 (네이버/구글/메타)
- KPI 설정 및 성과 추적 방법

## 지원 플랫폼

**국내:** 스마트스토어, 네이버 블로그, 네이버쇼핑, 카카오, 인스타그램(한국 타겟)
**글로벌:** Shopify, Instagram(영어권), Pinterest, Google Shopping
**SNS:** Instagram, Threads, X(Twitter), YouTube Shorts
