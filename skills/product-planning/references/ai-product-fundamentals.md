# AI-Native Product Fundamentals

> LLM-기반 제품을 만들 때 알아야 할 모든 것.
> Cost economics, Evals, Hallucination, Latency, Model selection.

---

## 1. AI-Native vs AI-Enabled

### AI-Native
**AI가 핵심 가치**. AI 없으면 제품 자체가 없음.

예시:
- **ChatGPT / Claude.ai** — Chat AI 자체
- **Cursor** — AI code editor
- **Perplexity** — AI search
- **Granola** — AI meeting notes
- **Pika / Runway** — AI video gen
- **ElevenLabs** — AI voice
- **Lovable / V0** — AI app builder

### AI-Enabled
**기존 제품에 AI 기능 추가**. AI 빼도 제품 동작.

예시:
- **Notion AI** (writing assist)
- **Slack AI** (recap, search)
- **Linear** (auto-summarization)
- **GitHub Copilot** (AI-enabled IDE)

### PM 결정점
**우리 제품은 어디?** 답에 따라:
- AI-native → AI를 핵심 영역 (cost, latency, eval 모두 critical)
- AI-enabled → AI를 보조 영역 (fallback 옵션 있음)

→ 이 문서는 AI-native 중심, AI-enabled에도 적용.

---

## 2. LLM 특이점 (전통 SW와 다른 것)

### 2.1 Non-deterministic Output

같은 input → 다른 output (temperature > 0).

```
Input: "한국의 수도는?"
Run 1: "한국의 수도는 서울입니다."
Run 2: "서울이 한국의 수도예요."
Run 3: "Seoul." (영어로)
```

→ 전통 SW의 "테스트" 개념이 안 통함. Eval 시스템 필요.

### 2.2 Cost per Inference

```
전통 SW:
- 사용자 1명 추가 cost: 거의 0

LLM 제품:
- 사용자 1명 추가 cost: $0.05~$5.00/세션
```

→ Unit economics 부서짐. Free tier 위험.

### 2.3 Latency

```
전통 API: 50~200ms
LLM API: 1~30초
```

→ UI 패턴 다름 (streaming, skeleton 필수).

### 2.4 Hallucination

LLM은 **그럴듯한 거짓**을 생성.

```
Q: "2024년 노벨 평화상 수상자는?"
A: "(잘못된 인물) 입니다. 그는 (가짜 사실)했고..." (자신 있게)
```

→ Trust 망가짐. RAG, citation, "I don't know" 가이드 필요.

### 2.5 Context Window 한계

| Model | Context |
|-------|---------|
| GPT-3.5 | 16K |
| GPT-4o | 128K |
| Claude Sonnet 4.5 | 200K |
| Gemini 1.5 Pro | 1M |

→ 긴 문서/대화 처리 시 chunking + RAG 필요.

### 2.6 Quality 측정 어려움

- 전통 SW: 동작/미동작 (binary)
- LLM: "이 답이 좋은가?" (subjective, continuous)

→ Eval framework 필수.

---

## 3. ⭐ LLM Cost Economics

### 3.1 가격 비교 (2026 기준, 1M tokens)

| Model | Input | Output | Speed |
|-------|-------|--------|-------|
| **Frontier** | | | |
| GPT-4o | $5 | $20 | Slow |
| Claude Opus 4 | $15 | $75 | Slow |
| Gemini 2 Pro | $2.50 | $10 | Medium |
| **Mid-tier** | | | |
| GPT-4o-mini | $0.15 | $0.60 | Fast |
| Claude Sonnet 4.5 | $3 | $15 | Medium |
| Gemini 2 Flash | $0.075 | $0.30 | Fast |
| **Small / Cheap** | | | |
| Claude Haiku 4.5 | $1 | $5 | Very fast |
| Gemini Flash mini | $0.075 | $0.30 | Very fast |

(가격은 변동. 최신은 각 vendor docs 참조)

### 3.2 Cost 계산 예시

#### 시나리오: 챗봇 답변 1회

```
Input: 시스템 prompt (500 tokens) + 대화 기록 (2,000 tokens) + 사용자 질문 (50 tokens)
Total input: 2,550 tokens
Output: 답변 (200 tokens)

GPT-4o:
- Input: 2,550 / 1M × $5 = $0.01275
- Output: 200 / 1M × $20 = $0.004
- Total: $0.01675 (≈ ₩22)

Claude Haiku:
- Input: 2,550 / 1M × $1 = $0.00255
- Output: 200 / 1M × $5 = $0.001
- Total: $0.00355 (≈ ₩5)
```

→ Haiku는 GPT-4o의 21% 비용. 작업 적합 시 큰 차이.

### 3.3 Unit Economics

#### Free tier 위험

```
Free 사용자: 월 30 대화 × $0.017 = $0.51/월
사용자 1만명: $5,100/월 = ₩680만/월 손실

광고/upgrade 없으면 → 적자
```

→ **Free tier 설계 시 LLM cost 반드시 계산.**

#### 유료 사용자 margin

```
Pro tier $20/월:
- 평균 사용: 월 200 대화 × $0.017 = $3.40 cost
- Net margin: $16.60 (83%)

Power user:
- 월 2,000 대화 × $0.017 = $34 cost
- Net margin: -$14 (적자!)
```

→ **Rate limiting 또는 token usage tiering 필수.**

### 3.4 Cost Reduction 전략

#### 1. Model Selection (가장 큰 영향)

```
모든 요청 GPT-4o → 일부 Haiku
- 간단한 질문: Haiku
- 복잡한 reasoning: Opus
- Code generation: Sonnet
- Classification: Haiku

비용 ~70% 감소 가능
```

#### 2. Prompt Optimization
- 시스템 prompt 짧게
- Few-shot examples 최소
- 불필요한 문맥 제거

```
Before: 1,000 tokens × $0.005 = $0.005
After: 500 tokens × $0.005 = $0.0025
50% saving
```

#### 3. Caching

**Exact Match Cache** (간단):
- Hash query → 이전 답 있으면 return
- 적합: FAQ, 정적 정보

**Semantic Cache** (고급):
- Embedding 비교 → 유사 query에 같은 답
- 적합: 자주 묻는 패턴
- Tools: Redis + vector, PortalAI semantic cache

**Prompt Caching** (Anthropic 등 지원):
- 같은 system prompt 반복 호출 → 캐싱
- Input cost 90%↓

#### 4. RAG (Retrieval-Augmented Generation)
- 큰 문서 통째로 보내기 ❌
- 관련 chunks만 추출 → 보내기 ✅
- Context 1M → 5K 가능

#### 5. Fine-tuning
- 작은 모델 + fine-tune → 큰 모델 성능
- 초기 비용 $1K~5K
- 토큰 비용 5~10x 감소

#### 6. Batching
- 실시간 X → batch processing
- Anthropic / OpenAI batch API: 50% off
- 적합: backend 처리 (overnight jobs)

#### 7. Streaming + Early Stop
- Streaming output
- 사용자가 결과 만족 시 early stop
- 비용 + latency 감소

#### 8. Local Models (Self-hosted)
- Llama 3, Mistral
- 인프라 비용 vs API 비용 비교
- 보통 100K+ MAU에서 break-even

---

## 4. ⭐ Model Selection

### 4.1 작업별 모델 선택 가이드

| 작업 | 추천 Model | 이유 |
|------|---------|-----|
| **Simple Q&A** | Haiku, Gemini Flash mini | 빠르고 저렴 |
| **Classification** | Haiku, Fine-tuned small | Cost-sensitive |
| **Summarization** | Sonnet, GPT-4o-mini | Balanced |
| **Translation** | Sonnet, Gemini Flash | Quality + cost |
| **Reasoning** | Opus, GPT-4o | Frontier 필요 |
| **Code generation** | Sonnet, Opus | Quality 중요 |
| **Math** | Opus + reasoning, o1 | Frontier 필요 |
| **Long context** | Gemini 1.5 Pro (1M) | Context window |
| **Real-time chat** | Haiku, Flash | Speed |
| **Agentic workflows** | Opus, Sonnet | Tool use quality |
| **Vision (image)** | GPT-4o, Claude Sonnet | Multimodal |
| **Audio** | Whisper, Gemini | Specialized |

### 4.2 Model Selection 결정 트리

```
이 작업에 필요한 quality?
├─ 인간 수준 필요 (legal, medical, math)
│    → Frontier (Opus, GPT-4o)
├─ 좋아야 함 (writing, coding, reasoning)
│    → Mid-tier (Sonnet, GPT-4o-mini)
├─ OK 정도 (classification, simple Q&A)
│    → Small (Haiku, Flash mini)
└─ 특수 작업
     → Specialized (Whisper, DALL-E)
```

### 4.3 Routing (여러 모델 동적 선택)

```python
def select_model(query, context):
    if is_simple_classification(query):
        return "haiku"
    elif requires_long_context(context):
        return "gemini-1.5-pro"
    elif requires_reasoning(query):
        return "opus"
    elif is_code_generation(query):
        return "sonnet"
    else:
        return "sonnet"  # default
```

### 4.4 Multi-model Architecture

```
User Query
   ↓
Classifier (cheap model)
   ↓
Route to specialist:
   ├─ Simple → Haiku (90% 트래픽, 10% 비용)
   ├─ Complex → Sonnet (8% 트래픽, 30% 비용)
   └─ Frontier → Opus (2% 트래픽, 60% 비용)
```

큰 회사들 패턴. 90%+ cost 절감 + quality 유지.

---

## 5. ⭐ Prompt Engineering

### 5.1 Prompt 구성

```
SYSTEM:
[Role 설정, 행동 가이드라인, 출력 형식]

USER:
[Few-shot examples (optional)]
[Current query]

ASSISTANT:
[Response]
```

### 5.2 Best Practices

#### 명확한 Role
```
❌ "Help the user"
✅ "You are a senior B2B SaaS pricing strategist with 10+ years experience..."
```

#### 명확한 출력 형식
```
✅ "Output in JSON format with keys: 'reasoning', 'recommendation', 'risks'"
```

#### Few-shot Examples
```
Example 1:
Input: "감기에 좋은 음식?"
Output: {"category": "health", "subcategory": "nutrition"}

Example 2:
Input: "내일 날씨?"
Output: {"category": "weather", "subcategory": "forecast"}

Now classify:
Input: "축구 경기 결과?"
```

#### Chain-of-Thought
```
"Let's think step by step:
1. ...
2. ...
3. ..."
```
→ Reasoning quality ↑ (15~30%).

#### Constraints
```
"Constraints:
- 한국어로 답할 것
- 200자 이내
- 'Hallucinate하지 말 것'
- 답을 모르면 '모르겠습니다' 라고 할 것"
```

### 5.3 Anti-patterns

❌ **Vague**: "Help me"
❌ **Conflicting instructions**: "Be concise. Be detailed."
❌ **Too long system prompt**: 5000 tokens → cost ↑
❌ **No examples for complex tasks**
❌ **Asking too much at once**: 한 prompt에 10 작업
❌ **No output format spec**: 매번 다른 형식

---

## 6. ⭐ Evals (가장 중요!)

→ 상세: `templates/03-eval-suite.md`

### 6.1 왜 Eval인가

전통 SW: unit test → 빨강/초록
LLM: "이 답이 좋은가?" → subjective

**Eval 없이 prompt 변경** = 도박. 한 곳 개선 → 다른 곳 regression.

### 6.2 Eval 종류

#### Auto Eval
- Regex/exact match (제한)
- LLM-as-judge (모델이 판단)
- Embedding similarity
- Function evaluation (code 생성 시 실행)

#### Human Eval
- Golden set (사전 정의 케이스)
- Side-by-side (A vs B)
- Likert scale (1~5)
- Rubric-based

### 6.3 Eval Metrics

#### Quality
- **Accuracy**: 정답률 (classification에서)
- **Faithfulness**: RAG에서 source 충실도
- **Relevance**: 답이 질문과 관련?
- **Coherence**: 논리적?
- **Completeness**: 완전?

#### Safety
- **Toxicity**: 해로운 콘텐츠?
- **Bias**: 편향?
- **PII leak**: 개인정보 노출?
- **Refusal rate**: 부적절한 거부?

#### Operational
- **Latency**: P50, P95, P99
- **Token usage**: avg in/out
- **Cost per query**
- **Error rate**: API 실패율

### 6.4 Eval Cadence

- **모든 prompt 변경 전**: regression test
- **모든 model 변경 전**: full eval
- **매주**: production sample
- **매월**: 큰 eval suite 실행

### 6.5 Eval Tools

- **LangSmith** (LangChain): 통합 + tracing
- **Braintrust**: eval focus
- **OpenAI Evals**: 오픈소스
- **Promptfoo**: 오픈소스, prompt 비교
- **Helicone**: cost + 추적 + eval
- **자체 구축**: Python + Jupyter

---

## 7. ⭐ Hallucination Management

### 7.1 왜 발생?

LLM은 **probability**에 기반. 확률적으로 그럴듯한 답.
"진실" 개념 없음.

### 7.2 완화 전략

#### 1. System Prompt
```
"If you don't know the answer, say 'I don't know'. 
Do not make up information.
Cite sources for factual claims."
```

#### 2. RAG (가장 강력)
- 외부 지식 베이스 검색
- 결과를 context에 포함
- "Answer based ONLY on the provided context"

#### 3. Citation
- 모든 사실에 source 표기
- Source 없으면 답 거부

#### 4. Confidence Scoring
- LLM에게 "확신도 1~10" 묻기
- 낮으면 user에게 표시

#### 5. Temperature 낮춤
- Temp 0.0~0.3 (사실 영역)
- Temp 0.7+ (창작 영역)

#### 6. Self-consistency
- 같은 질문 3번 → 일치하면 신뢰
- 다르면 "uncertain"

#### 7. Human-in-the-loop
- 의료/법률/금융 → 사람 검토
- AI는 draft, 사람이 final

### 7.3 Hallucination 예시 (실제 case)

#### Case 1: 가짜 case law (Avianca v. Mata)
- 변호사가 ChatGPT로 case law 검색
- ChatGPT가 가짜 case 생성 (그럴듯한 이름)
- 법원 제출 → 발각 → 변호사 처벌

→ **Lesson**: 법률 영역 RAG + 인간 검증 필수.

#### Case 2: Air Canada chatbot
- 챗봇이 false refund policy 제공
- 고객 환불 요청 → 회사 거부 → 소송
- 법원: 회사가 챗봇 발언에 책임 → 환불 의무

→ **Lesson**: 정책 영역은 RAG + 결정적 답.

---

## 8. Latency Management

### 8.1 LLM Latency 특성

- **TTFT (Time To First Token)**: 0.5~3초 (모델 wake-up)
- **TPS (Tokens Per Second)**: 30~150 tokens/sec
- **TTLT (Time To Last Token)**: TTFT + (output_tokens / TPS)

### 8.2 UI 전략

#### Streaming (필수)
- Token-by-token 표시
- 사용자 "이미 작동 중" 느낌

#### Skeleton states
- "Loading..." 보다 명확
- 예상되는 답변 구조 미리 표시

#### Progress indicators
- "Searching documents...", "Generating answer..."
- 사용자 wait 시 단계 표시

#### Early summary
- 첫 줄 빠르게 (200ms)
- 상세는 streaming

### 8.3 기술 전략

#### Parallel calls
```python
# Sequential (slow)
embedding = embed(query)        # 0.5s
docs = search(embedding)        # 0.3s
answer = llm(query + docs)      # 5s
# Total: 5.8s

# Parallel (faster)
async def parallel():
    embedding_task = embed(query)
    web_task = web_search(query)
    embedding, web_results = await gather(...)
    # 0.5s
    docs = search(embedding)    # 0.3s
    answer = llm(query + docs)  # 5s
    # Total: 5.8s → optimization needed elsewhere
```

#### Speculative execution
- 가능성 높은 답 미리 생성
- 사용자가 확정 시 즉시 표시

#### Caching
- Exact match → instant return
- Semantic match → instant return

---

## 9. AI 제품의 사용자 경험

### 9.1 새로운 패러다임

기존 SW: 명령형 (사용자가 정확히 알아야)
AI: 대화형 (자연어로 의도 표현)

→ 사용자 학습 곡선 ↑.

### 9.2 Empty State 더 중요

기존 SW: "어떤 기능 사용?"
AI: "무엇이든 물어보세요" → 사용자 막막

#### Solution
- **Example prompts**: 3~5개 예시 항상 표시
- **Suggested actions**: context-aware 제안
- **Onboarding tour**: 가능성 보여주기
- **Tutorial**: "Try saying..."

### 9.3 Error 처리

#### LLM이 답하지 못한 경우
- "I don't know" 답변 표시
- 대안 제시 ("Try rephrasing")
- 인간 지원으로 escalation

#### API 실패
- Fallback model
- Retry with backoff
- Graceful degradation

#### Rate limit
- "Slow down" 안내
- Queue 위치 표시

### 9.4 Trust Indicators

- **Confidence level**: "I'm 80% confident"
- **Sources**: "Based on [doc 1]..."
- **Reasoning**: "Here's how I arrived..."
- **Disclaimer**: "AI-generated. Verify before relying."

### 9.5 Feedback Loop

- 👍 / 👎 every response
- 사용자 신뢰 + 우리 학습 데이터
- Specific feedback option

```
👎 → "What went wrong?"
   - Incorrect information
   - Not helpful
   - Inappropriate
   - Other (text input)
```

---

## 10. AI 제품 PRD 추가 섹션

→ 상세: `templates/02-ai-prd-addendum.md`

기본 PRD에 추가:

1. **AI Use Case** — 어떤 작업?
2. **Model Choice** — 어떤 모델 + 이유
3. **Token Budget** — 작업당 input/output tokens
4. **Cost Per User** — Unit economics
5. **Prompt Versioning** — Git-like
6. **Eval Suite** — Test cases
7. **Fallback Strategy** — Model down 시
8. **Hallucination Tolerance** — Risk + mitigation
9. **User Feedback Loop** — 👍/👎 + analytics
10. **Privacy** — Data → 3rd party 명시

---

## 11. AI 제품 메트릭

기본 메트릭 + 추가:

### Quality Metrics
- **User feedback rate** (👍 / total)
- **Regenerate clicks** (불만족 신호)
- **Task completion rate** (사용자가 끝까지?)
- **Eval score trend** (자체 eval)

### Cost Metrics
- **Tokens per user per day**
- **Cost per active user** (CPAU)
- **Margin per user**

### Engagement
- **Avg queries per session**
- **Session duration**
- **Conversation depth** (turns)

### Risk
- **Hallucination rate** (sampled)
- **Refusal rate** (적절한지)
- **Toxic output rate**

---

## 12. AI Privacy & Compliance

### 12.1 데이터 → 3rd party

기본 PRD Privacy 섹션 외:

- 사용자 입력이 OpenAI/Anthropic으로 전송됨
- 명시 동의 필요
- 의료/금융/PII 영역 별도 고려

### 12.2 Training Data Usage

- API mode (default): 학습에 사용 안 됨 (OpenAI, Anthropic)
- 그러나 명시적 동의 받기 권장
- Enterprise: BAA/DPA 별도 계약

### 12.3 Region

- OpenAI: US 처리
- Anthropic: US 처리
- Azure OpenAI: 지역 선택 가능
- AWS Bedrock: 지역 선택 가능

EU/한국 데이터는 region 신중 선택.

### 12.4 PII Redaction

```
사용자 입력: "내 이름은 홍길동이고 전화는 010-1234-5678..."

LLM 전송 전:
1. PII 감지 (regex, NER model)
2. 마스킹: "내 이름은 [NAME]이고 전화는 [PHONE]..."
3. LLM 호출
4. 출력에서 placeholder 복원
```

Tools: Microsoft Presidio (OSS), Skyflow.

---

## 13. AI 제품 출시 특수성

### 13.1 Public Model API 의존

- OpenAI/Anthropic outage = 우리 outage
- Status page 모니터링
- Fallback model 필수
- SLA: API provider SLA에 의존

### 13.2 Model Version 변경

- Provider가 모델 업데이트 → 우리 prompt regression 가능
- 매번 eval 실행
- Provider deprecation 정책 추적
- Lock-in model version (가능 시)

### 13.3 Rate Limit 관리

- Provider RPM (Requests Per Minute)
- 사용자 폭증 시 → 429 에러
- Queue 시스템
- Tier 1/2/3 upgrade (사용량 ↑ 따라)

---

## 14. AI 제품 Pricing

### 14.1 Pricing Model 선택

#### Subscription (fixed)
- Pro $20/월, 무제한 사용
- 위험: power user adversarial selection
- 완화: rate limit + fair use policy

#### Usage-based
- Per query / per token
- Pricing transparency
- 위험: 비용 unpredictable (사용자 두려움)
- 완화: usage estimator

#### Hybrid
- $20/월 기본 + overage $X/1K tokens
- 가장 흔함

#### BYOK (Bring Your Own Key)
- 사용자가 API key 제공
- 우리는 SaaS 비용만
- Power user 친화적
- 예: Cursor의 BYOK 옵션

### 14.2 Free Tier 설계

```
Free tier:
- Daily token limit (예: 10K input/day)
- Or query count (예: 20/day)
- Or model limited (Haiku만, GPT-4 X)
- Or feature limited (basic chat만)

Pro tier $20/월:
- All models
- 10x more tokens
- Priority access
- BYOK option
```

---

## 15. AI 제품 안티패턴

### 15.1 제품 측

❌ **"AI" 마케팅 buzzword**: 사용자 가치 없이 AI 강조
✅ 실제 가치 강조, AI는 means

❌ **One model fits all**: GPT-4o로 모든 것
✅ Task별 model routing

❌ **Eval 없이 출시**: prompt 변경 → regression
✅ Eval suite + 매 변경 시 실행

❌ **Hallucination 무시**: 사용자가 발견할 때까지 방치
✅ RAG + citation + "I don't know"

❌ **Cost 무시**: free tier에 GPT-4o
✅ Unit economics 계산

❌ **Latency 무시**: 30초 wait
✅ Streaming, parallel, caching

### 15.2 운영 측

❌ **Single API provider lock-in**
✅ Multi-provider (OpenAI + Anthropic + Google)

❌ **No fallback**: provider down → 우리 down
✅ Multi-region, multi-provider fallback

❌ **PII to LLM**: GDPR/PIPA 위반
✅ Redaction + 명시 동의

❌ **Training data assumption**: "OpenAI가 학습에 안 써"
✅ API mode + Enterprise plan 확인

### 15.3 UX 측

❌ **빈 박스에 "ask me anything"**
✅ Example prompts + suggestions

❌ **No feedback mechanism**
✅ 👍/👎 + reason

❌ **No confidence indicator**
✅ "I'm not sure but..." 또는 confidence score

❌ **Trust by default**: "AI says X = X is true"
✅ Source + reasoning + verify reminder

---

## 16. AI 제품의 Continuous Discovery

### 16.1 추가 weekly habits

기본 + 추가:
- **Failed query review**: 사용자가 만족 못한 답 분석
- **Prompt iteration**: 매주 prompt 1~2개 개선
- **Model A/B**: 새 model 일부 사용자 test
- **Cost analysis**: 주간 cost trend
- **Eval score**: 주간 trend

### 16.2 사용자 인터뷰 추가 질문

- "어떤 답이 가장 도움됐어요?"
- "잘못된 답을 받은 적 있나요?"
- "AI인지 알고 사용하시나요?"
- "Privacy 우려 있으세요?"
- "비용이 사용에 영향?"

---

## 17. AI 제품 Roadmap 패턴

### Year 1: Prove Quality
- Single use case 깊이
- Eval suite 구축
- Hallucination 관리
- 초기 사용자 reference

### Year 2: Scale
- Cost optimization (model routing, caching)
- Multi-modal (vision, audio)
- Integration (Slack, Notion, ...)
- Mid-market 진입

### Year 3+: Defensibility
- Proprietary data flywheel
- Fine-tuned models
- Workflow automation (agents)
- Enterprise features (SSO, audit)

---

## 18. AI Frontier (2026 트렌드)

### Multimodal
- Text + image + audio + video
- 모든 frontier 모델이 multimodal

### Long Context
- 100K → 1M → 10M
- 책 한 권 통째로 처리

### Agents
- Tool use + planning + memory
- Browser automation, code execution
- Long-running tasks

### Reasoning Models
- o1, o3 (OpenAI), Claude Opus (extended thinking)
- 비용 ↑ but quality ↑↑ (math, code, reasoning)

### Smaller, Cheaper, Faster
- 동일 quality + 10x 저렴
- Cost economics 계속 개선

### Compliance
- AI Act (EU)
- AI executive orders (US)
- 한국 AI 법안

---

## 19. 출처 / 더 읽을거리

- "Prompt Engineering Guide" (DAIR.AI)
- "Anthropic's Building Effective Agents" 블로그
- "OpenAI Cookbook"
- "LangSmith Blog" — Evals
- "Hamel's Blog" — Practical LLM ops
- Eugene Yan's blog — Production AI
- "Designing Machine Learning Systems" — Chip Huyen
- "AI Engineering" — Chip Huyen
