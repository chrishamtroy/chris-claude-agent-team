---
name: strategic-counsel-ai
description: CEO 전략기획실 — Research→Debate→Synthesis 3-스테이지 파이프라인으로 고품질 전략 보고서 생성
---

# CEO 전략기획실 (Strategic Counsel AI)

## 목적

중요한 사업 의사결정 앞에서 단순한 정보 수집을 넘어, 다각도 리서치 → 다자 토론 → 종합 합성의 3-스테이지 파이프라인을 통해 근거 있는 전략 보고서를 생성한다.

스마트스토어·Shopify 이커머스, SNS 콘텐츠 사업, 한국·글로벌 시장 전반의 전략 판단에 활용한다.

## 워크플로우

```
[사용자 질문/과제]
        ↓
[Stage 0] ceo-director: 분석 방향 설정, 쿼리 5개 생성
        ↓
[Stage 1] RESEARCH (5 병렬 서브에이전트)
  ├─ Market Researcher      — 시장 규모·경쟁 구도
  ├─ Trend Analyst          — 국내외 트렌드 분석
  ├─ Case Study Analyst     — 성공/실패 사례 분석
  ├─ Financial Analyst      — 수익성·비용 구조
  └─ Risk Assessor          — 리스크 및 규제 분석
        ↓ (5개 리서치 보고서 취합)
[Stage 2] DEBATE (7 병렬 서브에이전트 — 페르소나 토론)
  ├─ Growth Advocate        — 성장·확장 관점 옹호
  ├─ Risk Devil's Advocate  — 리스크·반론 제기
  ├─ Customer Champion      — 고객 관점 대변
  ├─ Operations Realist     — 실행 가능성 검증
  ├─ Finance Guardian       — 재무 건전성 수호
  ├─ Brand Strategist       — 브랜드·포지셔닝 관점
  └─ Global Perspective     — 글로벌 시장 관점
        ↓ (7개 논거 취합)
[Stage 3] SYNTHESIS (3 병렬 서브에이전트)
  ├─ Strategic Synthesizer  — 핵심 전략 방향 도출
  ├─ Action Planner         — 실행 계획 수립
  └─ Executive Summarizer   — 경영진 요약 작성
        ↓
[QA] Quality Review (4개 항목 병렬 검토)
  ├─ Logical Consistency    — 논리 일관성
  ├─ Evidence Sufficiency   — 근거 충분성
  ├─ Actionability          — 실행 가능성
  └─ Risk Coverage          — 리스크 커버리지
        ↓
[최종 전략 보고서] ceo-director 최종 검토 및 배포
```

## 에이전트 목록

| 에이전트 | 모델 | 역할 |
|---------|------|------|
| ceo-director | opus | 총괄 디렉터, 방향 설정, 최종 검토 |
| ceo-coordinator | sonnet | 스테이지 간 조율, 데이터 흐름 관리 |

*Stage 1~3 및 QA 에이전트는 ceo-coordinator가 서브에이전트로 스폰*

## 사용법

```
/strategic-counsel-ai [전략 질문 또는 과제]
```

**예시:**
- `/strategic-counsel-ai Shopify 글로벌 확장 vs 스마트스토어 집중 — 2026년 전략 방향`
- `/strategic-counsel-ai 인스타그램 쇼핑 기능 도입 시 ROI 분석`
- `/strategic-counsel-ai 신규 카테고리(의류) 진입 타당성 검토`

## 출력물

1. **Executive Summary** (1페이지) — 핵심 결론 및 권고사항
2. **Research Findings** (섹션별 리서치 결과)
3. **Debate Summary** (주요 논거 찬반 정리)
4. **Strategic Recommendations** (우선순위 별 실행 방안)
5. **Risk Matrix** (리스크 × 대응 방안)
6. **90-Day Action Plan** (즉시 실행 가능한 액션 아이템)

## 활성화 조건

다음 질문에 해당하면 자동 활성화:
- "전략을 짜줘", "의사결정 도움", "분석 보고서"
- 시장 진입/철수, 투자, 신규 사업, 파트너십 검토
- 경쟁사 대응 전략, 가격 전략, 채널 전략
