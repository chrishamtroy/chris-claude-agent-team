# AI Product PRD Addendum

> 기본 PRD (`02-prd-template.md`)에 추가될 AI-specific 섹션.
> AI-native 제품이거나 AI feature 추가 시 사용.
> Reference: `references/ai-product-fundamentals.md`

---

# AI Section — [프로젝트명]

> **추가 섹션 번호**: 19~28 (기본 PRD 18 sections 다음)
> **Owner**: PM + ML Engineer + Tech Lead

---

## 19. AI Use Case Definition

### 19.1 AI가 해결하는 작업

**Task**:
[구체적 작업 명시 — "글쓰기 보조"가 아닌 "blog post draft 생성"]

**Examples**:
- Input: "AI에 대한 blog post 작성, 600단어, 친근한 톤"
- Expected output: 600단어 한국어 blog post

### 19.2 AI-Native or AI-Enabled?

- [ ] **AI-Native**: AI 없이 제품 불가능
- [ ] **AI-Enabled**: 기존 기능에 AI 추가

→ 결정에 따라 후속 섹션 깊이 다름.

### 19.3 사용자가 받는 가치

❌ "AI 사용" (means)
✅ "X 시간 절약" / "Y 작업 자동화" (outcome)

---

## 20. Model Choice

### 20.1 1차 모델 선택

| 작업 | Primary Model | Why |
|------|--------------|-----|
| [작업 A] | Claude Sonnet 4.5 | Quality + cost balance |
| [작업 B] | Claude Haiku | Speed + cheap |
| [작업 C] | GPT-4o | Vision needed |

### 20.2 Selection Reasoning

**Quality requirement**:
- 인간 수준 필요? → Frontier
- 좋아야? → Mid-tier
- OK 정도? → Small

**Latency requirement**:
- Real-time (<2s)? → Small/fast
- Async OK? → Frontier

**Cost constraint**:
- Free tier 사용? → 비용 critical → Small
- Enterprise만? → 비용 ↑ 가능 → Frontier

### 20.3 Fallback Models

```
Primary: Claude Sonnet
↓ (down/rate-limit)
Fallback 1: GPT-4o
↓
Fallback 2: Gemini 2 Pro
↓
Graceful degradation: "AI 일시 사용 불가. 잠시 후 다시 시도."
```

### 20.4 Model Routing (옵션)

Multi-model architecture:
```
Query Classifier (Haiku, $0.001)
   ├─ Simple (60%) → Haiku ($0.005)
   ├─ Medium (30%) → Sonnet ($0.02)
   └─ Complex (10%) → Opus ($0.10)
```

Total cost vs single Opus: ~85% saving.

### 20.5 Decision Log Reference

→ ADR-XXX: Model Selection (이유 + 대안 + 재검토 시점)

---

## 21. Token Budget per Use Case

### 21.1 Per-query budget

| Use case | Input tokens | Output tokens | Total |
|----------|------------|--------------|------|
| [작업 A] | 2,000 | 500 | 2,500 |
| [작업 B] | 5,000 | 1,000 | 6,000 |
| [작업 C] | 500 | 200 | 700 |

### 21.2 Cost calculation

**작업 A (Sonnet, $3/$15 per 1M)**:
- Input: 2,000 × $3 / 1M = $0.006
- Output: 500 × $15 / 1M = $0.0075
- **Per query: $0.0135 (≈ ₩18)**

### 21.3 Per-user economics

```
Free user:
- 평균 10 queries/일 × 30일 = 300 queries/월
- 300 × $0.0135 = $4.05/월 cost
- 광고/upgrade 수익: $0
- Net: -$4.05/월 (적자)

Pro user $20/월:
- 평균 50 queries/일 × 30일 = 1,500 queries/월
- 1,500 × $0.0135 = $20.25/월 cost
- Net: -$0.25 (적자!)

Power Pro user:
- 평균 200 queries/일 × 30일 = 6,000 queries/월
- $81 cost
- Net: -$61 (큰 적자)
```

→ **이대로 출시 불가**. Mitigation:

### 21.4 Mitigation 전략

- [ ] Free tier 제한 (30 queries/일)
- [ ] Pro tier rate limit (200 queries/일)
- [ ] Model routing (Haiku for simple)
- [ ] Prompt optimization (50% token 감소)
- [ ] Caching (semantic match)
- [ ] Pricing 재검토 ($20 → $30)
- [ ] Usage-based add-on ($X per 1K queries)

---

## 22. Prompt Engineering

### 22.1 Prompt Versioning

- Git repo (`prompts/`)
- Semantic versioning (v1.0.0)
- Change log per version

### 22.2 System Prompt

```
[현재 prompt 전체 텍스트 여기에]

Version: v1.2.0
Last updated: 2026-05-15
Author: PM/ML Engineer
```

### 22.3 Variables / Templates

```
SYSTEM:
You are a {ROLE}.
Context: {CONTEXT}
User type: {USER_TYPE}

INSTRUCTIONS:
{INSTRUCTIONS}

USER:
{USER_QUERY}
```

Variable definitions:
- `{ROLE}`: e.g., "B2B SaaS PM consultant"
- `{CONTEXT}`: 사용자 workspace 정보
- ...

### 22.4 Few-shot Examples

[Best-performing examples 3~5개]

### 22.5 Output Format

```json
{
  "answer": "...",
  "confidence": 0.0-1.0,
  "sources": ["..."],
  "follow_up_questions": ["...", "..."]
}
```

JSON mode 사용 (OpenAI, Claude, Gemini 모두 지원).

---

## 23. ⭐ Eval Suite

→ 상세: `templates/03-eval-suite.md`

### 23.1 Eval Goals

이번 use case에서 측정할 것:
- **Accuracy**: 정답률 (classification)
- **Faithfulness**: source 충실도 (RAG)
- **Relevance**: 답이 질문에 맞음
- **Coherence**: 논리적
- **Safety**: 해롭지 않음
- **Style**: 우리 톤/매너

### 23.2 Test Cases

- Total: 100+ cases
- Categories:
  - Happy path: 50 (잘 작동해야)
  - Edge cases: 30 (까다로운)
  - Adversarial: 10 (공격적)
  - Safety: 10 (해로운 시도)

### 23.3 Eval Method

- [ ] Auto eval (LLM-as-judge)
- [ ] Embedding similarity
- [ ] Regex / exact match
- [ ] Human eval (sample)

### 23.4 Success Criteria

- Overall score ≥ 80%
- No category < 70%
- No regression vs previous version

### 23.5 Cadence

- 매 prompt 변경: regression test (subset)
- 매 model 변경: full eval
- 매월: production sample eval

---

## 24. Hallucination Tolerance

### 24.1 Risk Level

| Use case | Risk if hallucinate |
|----------|------|
| Casual chat | Low (사용자 발견) |
| Code generation | Medium (실행 시 발견) |
| **Legal / Medical / Financial** | **HIGH (인간 피해)** |
| Customer-facing 정책 | HIGH (법적 책임) |

### 24.2 Mitigation

#### Always Apply
- [ ] System prompt: "Don't make up. Say 'I don't know'."
- [ ] Output format: include `confidence` field

#### High-risk use cases
- [ ] RAG (외부 ground truth)
- [ ] Citation required for facts
- [ ] Human-in-the-loop (사람 검토)
- [ ] Disclaimer in UI
- [ ] Verify reminder
- [ ] Temperature 0.0~0.3

### 24.3 Detection

- User feedback (👎)
- Confidence < threshold → flag
- Source check (citation exists?)

---

## 25. RAG (해당 시)

### 25.1 Knowledge Source

- [ ] Internal docs (Notion, Confluence)
- [ ] Public documentation
- [ ] User's own data (uploaded)
- [ ] Real-time web search
- [ ] Database query

### 25.2 Embedding Model

- **OpenAI text-embedding-3-small** ($0.02/1M tokens)
- **Cohere embed-v3** (multilingual)
- **VoyageAI** (high quality)
- **자체 fine-tuned** (specialized)

### 25.3 Vector DB

| DB | Why |
|----|-----|
| pgvector (Postgres) | 기존 Postgres에 추가, 단순 |
| Pinecone | Managed, scale ↑ |
| Weaviate | OSS, self-hostable |
| Qdrant | Performance ↑ |
| Chroma | Dev experience ↑ |

### 25.4 Chunking Strategy

- Chunk size: 500~1000 tokens
- Overlap: 100~200 tokens
- Split by: sentence / paragraph / semantic boundary

### 25.5 Retrieval

- Top-K: 5~10 chunks
- Reranking (BGE reranker, Cohere)
- Hybrid (vector + keyword search)
- Metadata filtering

### 25.6 Quality

- **Recall**: 정답 chunk 포함?
- **Precision**: 무관한 chunk 제외?
- **Faithfulness**: 답이 chunks 기반?

---

## 26. Multi-modal (해당 시)

### 26.1 Modalities

- [ ] Text (default)
- [ ] Image (vision)
- [ ] Audio (speech-to-text, TTS)
- [ ] Video (frame extraction)

### 26.2 Image Use Cases

- 사용자 업로드 이미지 분석
- Chart / diagram 이해
- OCR
- Visual content moderation

### 26.3 Audio

- Speech-to-text: Whisper, Gemini
- Text-to-speech: ElevenLabs, OpenAI TTS
- Real-time conversation: Gemini Live, GPT-4o Realtime

### 26.4 Latency 영향

- Vision: +1~3초 (이미지 처리)
- Audio: +0.5~2초 (Whisper)
- Video: 매우 느림 (frame 추출 + 처리)

---

## 27. Safety & Privacy

### 27.1 사용자 입력 처리

- [ ] PII 감지 (Presidio, custom regex)
- [ ] PII masking before LLM call
- [ ] Re-insert after response

### 27.2 사용자 동의

- [ ] AI 사용 명시 (UI banner)
- [ ] Data → 3rd party 동의
- [ ] Privacy policy 업데이트

### 27.3 Provider 선택

- [ ] API mode (학습 사용 안 됨 확인)
- [ ] Enterprise / BAA (의료/금융)
- [ ] Data region (EU, 한국)

### 27.4 Output Filtering

- Toxicity classifier
- PII leakage check
- Brand safety (경쟁사 언급 등)
- Regulatory compliance

### 27.5 Adversarial Inputs

- Prompt injection 방어
- Jailbreak 시도 탐지
- Rate limiting per user

---

## 28. Telemetry & Analytics (AI 추가)

기본 telemetry + 추가:

### 28.1 Events

```
- ai_query_initiated
- ai_query_completed (with: model, tokens_in, tokens_out, latency, cost)
- ai_query_failed (with: error_type)
- ai_response_feedback_positive (👍)
- ai_response_feedback_negative (👎) + reason
- ai_response_regenerated
- ai_response_copied
- ai_response_shared
```

### 28.2 Metrics

#### Quality
- Feedback rate (👍 / total)
- Regenerate rate (불만족 신호)
- Eval score trend

#### Cost
- Tokens per user per day
- Cost per active user
- Margin per user

#### Operational
- P50/P95/P99 latency
- Error rate by model
- Fallback usage %

### 28.3 Dashboards

- Daily: cost, errors, P95 latency
- Weekly: feedback, regenerate, eval scores
- Monthly: cost trend, margin, model mix

---

## 29. Pricing 영향 (AI 제품)

### 29.1 Model 결정

기본 pricing 모델 + AI 고려:

- [ ] **Subscription only** (Notion AI 식)
  - 위험: power user 적자
  - 완화: rate limit
- [ ] **Subscription + usage**
  - Pro $20/월 + 추가 $X/1K queries
- [ ] **Pure usage**
  - Per-query / per-token billing
  - Predictability 낮음
- [ ] **BYOK** (Bring Your Own Key)
  - 사용자 own API key
  - 우리는 SaaS only

### 29.2 Free Tier 제한

- Daily query cap
- Or token cap
- Or feature limit (basic model만)
- Or feature wait time

### 29.3 Premium tier

- Frontier model access
- 10x rate limit
- Priority queue
- BYOK option

---

## 30. AI-specific Risks

| Risk | Probability | Impact | Mitigation |
|------|------|------|----------|
| Hallucination → user harm | High | High | RAG + citation + disclaimer |
| Cost runaway | Medium | High | Rate limit + monitoring + alerts |
| Provider outage | Medium | High | Multi-provider fallback |
| PII leak | Low | High | Redaction + audit |
| Prompt injection | Medium | Medium | Validation + monitoring |
| Model deprecation | High | Medium | Version lock + migration plan |
| Regression on prompt change | High | Medium | Eval suite + CI/CD |
| Competitor (better AI) | High | Medium | 차별점 = data + UX (not model) |

---

## 31. Open Questions (AI-specific)

- [ ] [Q1] Model: GPT-4o vs Claude Sonnet? — Decision by [date]
- [ ] [Q2] Free tier rate limit 수치? — A/B test 후
- [ ] [Q3] Fine-tuning 시점? — MAU 100K 도달 시
- [ ] [Q4] BYOK 옵션 도입? — User research 후

---

## References

- `references/ai-product-fundamentals.md` — Full AI guide
- `templates/03-eval-suite.md` — Eval design
- `templates/02-pricing-packaging.md` — Pricing
- `templates/02-prd-template.md` — Base PRD
