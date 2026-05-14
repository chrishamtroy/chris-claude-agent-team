---
name: ecommerce
description: 스마트스토어/Shopify 운영 관련 모든 작업을 처리하는 이커머스 팀 스킬. 상품 기획, 상세페이지 생성, 가격 전략, 리뷰 관리, 고객 대응, 재고 계획을 통합 관리.
---

# E-Commerce Team Skill

스마트스토어/Shopify 운영 관련 모든 작업을 처리하는 이커머스 팀 스킬.
상품 기획, 상세페이지 생성, 가격 전략, 리뷰 관리, 고객 대응, 재고 계획을 통합 관리합니다.

## 팀 구성

| 에이전트 | 모델 | 역할 |
|---------|------|------|
| ec-orchestrator | opus | 전체 운영 총괄, 작업 라우팅 |
| ec-product-detail-gen | sonnet | 상세페이지 카피 + 이미지 프롬프트 |
| ec-listing-optimizer | sonnet | SEO/검색 노출 최적화 |
| ec-pricing-analyst | sonnet | 가격 전략, 마진 계산 |
| ec-review-manager | sonnet | 리뷰 분석 및 대응 초안 |
| ec-conversion-optimizer | sonnet | 전환율 분석 및 CRO 전략 |
| ec-inventory-planner | haiku | 재고 추적, 발주 계획 |
| ec-cs-handler | haiku | 고객 문의 1차 대응 초안 |

## 지원 플랫폼

- **네이버 스마트스토어** (한국 시장, 주력)
- **Shopify** (글로벌 시장)
- 양쪽 동시 운영 지원

## 작업 유형별 라우팅

### 신규 상품 출시
```
ec-orchestrator
  ├── ec-product-detail-gen  (상세페이지 카피 + 이미지 프롬프트)
  ├── ec-listing-optimizer   (플랫폼별 등록 최적화) → 병렬 실행
  └── ec-pricing-analyst     (가격 전략)
```

### 기존 상품 최적화
```
ec-conversion-optimizer (전환율 데이터 분석)
  └── ec-listing-optimizer (키워드/카테고리 개선)
```

### 리뷰 관리
```
ec-review-manager (분석 + 대응 초안)
  → 패턴 발견 시 ec-listing-optimizer / ec-product-detail-gen 트리거
```

### 고객 문의
```
ec-cs-handler (1차 대응 초안)
  → 에스컬레이션 필요 시 operator에게 플래그
```

### 재고 관리
```
ec-inventory-planner (재고 현황 + 발주 계획)
  → 과재고 발견 시 ec-pricing-analyst (프로모션 가격) 트리거
```

### 판매 성과 리뷰 (주간/월간)
```
ec-conversion-optimizer → ec-pricing-analyst (순차 실행)
```

## 핵심 에이전트: ec-product-detail-gen

상세페이지 생성의 입력 형식:
```markdown
## Product Brief (product-info.md)
- product_name: [한국어명 / English name]
- category: [카테고리]
- key_features: [주요 특징 3-5개]
- target_customer: [타깃 고객]
- price_range: [원화 / 달러]
- unique_selling_point: [차별점]
- brand_tone: [sophisticated/friendly/trendy/premium/practical]
- reference_images: [파일 경로, 선택사항]
```

출력:
- 스마트스토어용 한국어 카피 (섹션별)
- Shopify용 영어 카피 (섹션별)
- Gemini API 이미지 생성 프롬프트 (2K, 섹션별)
- 이미지 생성 큐 (배치 실행용)

## 사용 예시

```
"[상품명] 스마트스토어 상세페이지 만들어줘"
→ ec-orchestrator → ec-product-detail-gen

"1-2성 리뷰 10개 분석해서 대응 초안 작성해줘"
→ ec-orchestrator → ec-review-manager

"이번 달 재고 현황 확인하고 발주 계획 세워줘"
→ ec-orchestrator → ec-inventory-planner

"[상품] 가격이 경쟁사 대비 적절한지 분석해줘"
→ ec-orchestrator → ec-pricing-analyst

"구매 전환율이 낮은 이유 분석하고 개선안 알려줘"
→ ec-orchestrator → ec-conversion-optimizer
```

## 산출물 저장 경로

| 작업 | 저장 위치 |
|------|----------|
| 상세페이지 카피 | /products/[상품명]/detail-page-copy.md |
| 이미지 프롬프트 | /products/[상품명]/image-prompts.md |
| 리뷰 분석 | /reports/review-[date].md |
| 재고 보고서 | /reports/inventory-[date].md |
| 가격 분석 | /reports/pricing-[상품명].md |

## 비즈니스 맥락

- 한국 시장: 네이버쇼핑 알고리즘 최적화 최우선
- 글로벌 시장: Google Shopping + Shopify SEO
- 결제: 스마트스토어(토스페이먼츠/네이버페이), Shopify(Stripe)
- CS: 스마트스토어 문의(한국어), Shopify 이메일(영어)
- 배송: 국내 빠른배송 강조, 해외 DHL/FedEx
