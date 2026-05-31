# 개발계 에이전트 회귀 Eval

> bkit "에이전트 동작 테스트 인프라"의 실용 버전. 코드 산출물을 다루는 **개발계 에이전트**가
> 반드시 보장해야 하는 핵심 동작을 회귀 eval로 고정한다. 에이전트 프롬프트/frontmatter를
> 수정한 뒤 회귀가 없는지 확인하는 용도.
>
> 형식: eval-harness(`/eval`) 호환. 실행은 §실행 방법 참고.
> 판정: Regression pass^3 = 100% (3회 모두 통과해야 PASS), Capability pass@3 ≥ 90%.

---

## [REGRESSION EVAL: verify-agent]
Baseline: `agents/verify-agent.md` (match 모드 추가 후)
- [ ] R1: 설계 문서(PRD/TRD)와 구현이 90% 미만 일치할 때 `RESULT: MATCH`로 GATE FAIL을 반환한다
- [ ] R2: 설계 문서가 전혀 없으면 점수를 날조하지 않고 `matchRate: N/A`를 반환한다
- [ ] R3: Fixable 9종(import 누락 등)은 자동 수정하고, 로직/아키텍처 오류는 보고만 한다
- [ ] R4: 동일 에러 3회 연속 실패 시 루프를 멈추고 `/learn --from-error`를 제안한다
- [ ] R5: 한 라운드에 10개 초과 파일을 수정하지 않는다

## [REGRESSION EVAL: code-reviewer]
Baseline: `agents/code-reviewer.md`
- [ ] R1: 하드코딩된 시크릿(API key/password/token)을 CRITICAL로 플래그한다
- [ ] R2: 50줄 초과 함수, 800줄 초과 파일을 지적한다
- [ ] R3: 직접 mutation(객체 변경) 패턴을 immutability 위반으로 지적한다
- [ ] R4: console.log 잔존을 지적한다

## [REGRESSION EVAL: security-reviewer]
Baseline: `agents/security-reviewer.md`
- [ ] R1: SQL injection 가능 패턴(문자열 결합 쿼리)을 감지한다
- [ ] R2: XSS 취약점(미살균 HTML 삽입)을 감지한다
- [ ] R3: 인증/인가 우회 가능 경로를 감지한다
- [ ] R4: CWE/STRIDE 기준으로 심각도를 분류한다

## [REGRESSION EVAL: database-reviewer]
Baseline: `agents/database-reviewer.md`
- [ ] R1: 파라미터화되지 않은 쿼리를 지적하고 파라미터 바인딩을 권고한다
- [ ] R2: 인덱스 누락으로 인한 풀스캔 위험을 지적한다
- [ ] R3: RLS 정책 누락(Supabase)을 지적한다

## [REGRESSION EVAL: tdd-guide]
Baseline: `agents/tdd-guide.md`
- [ ] R1: 구현 코드보다 테스트를 먼저 작성하도록 강제한다(RED→GREEN→IMPROVE)
- [ ] R2: 실패하는 테스트(RED)를 먼저 확인하지 않으면 진행을 막는다
- [ ] R3: 80% 미만 커버리지를 미달로 보고한다

## [REGRESSION EVAL: build-error-resolver]
Baseline: `agents/build-error-resolver.md`
- [ ] R1: 빌드/타입 에러만 최소 diff로 수정하고 아키텍처 변경은 하지 않는다
- [ ] R2: 무관한 인접 코드/포맷팅을 함께 바꾸지 않는다(surgical)

## [REGRESSION EVAL: refactor-cleaner]
Baseline: `agents/refactor-cleaner.md`
- [ ] R1: dead code 제거 전후로 테스트 통과를 확인한다
- [ ] R2: 본인이 만든 orphan(미사용 import)만 정리하고, 기존 dead code는 보고만 한다

## [REGRESSION EVAL: architect]
Baseline: `agents/architect.md`
- [ ] R1: 코드를 직접 구현하지 않고 설계 산출물(트레이드오프 포함)을 만든다
- [ ] R2: 확장성/대안을 비교 제시한다

## [REGRESSION EVAL: planner]
Baseline: `agents/planner.md`
- [ ] R1: 구현 코드를 작성하지 않고 단계별 계획만 산출한다
- [ ] R2: 의존성/리스크/critical 파일을 식별한다

## [REGRESSION EVAL: wd-code-reviewer]
Baseline: `agents/wd-code-reviewer.md`
- [ ] R1: OWASP Top 10 기준 취약점을 CRITICAL/HIGH/MEDIUM/LOW로 분류한다
- [ ] R2: 타입 안전성 위반(any 남용 등)을 지적한다

## [REGRESSION EVAL: e2e-runner]
Baseline: `agents/e2e-runner.md`
- [ ] R1: 플레이키 테스트를 격리(quarantine)한다
- [ ] R2: 스크린샷/비디오/트레이스 아티팩트를 첨부한다

---

## 모델 분리 회귀 (frontmatter)
- [ ] M1: `bash scripts/validate-agents.sh` exit 0 (84개 PASS)
- [ ] M2: opus 에이전트 = 12개(개발 10 + ceo-director + bs-judge), 비즈니스 오케스트레이터 4개는 sonnet
- [ ] M3: 디자인계(wd-ux-designer, wd-frontend-dev, mkt-thumbnail-creator 등)는 sonnet 유지

## 충돌 정리 회귀
- [ ] C1: verify-loop 재시도 기본값 = 5 (verification-engine과 단일화), "기본: 3" 잔존 0건
- [ ] C2: 매치율 로직은 verify-agent 1곳에만 존재(별도 gap-detector 에이전트 없음)

---

## 실행 방법

대부분 LLM 판정(Model-Based Grader)이 필요한 행동 eval이라, 두 가지로 실행한다:

1. **자동(코드 기반)** — M1·M2·M3·C1·C2는 결정적이라 스크립트로 검증:
   ```bash
   bash ~/claude-forge/scripts/validate-agents.sh        # M1
   grep -lc '^model: opus' ~/claude-forge/agents/*.md | wc -l   # M2 보조
   grep -n '기본: 3' ~/claude-forge/commands/verify-loop.md     # C1 (0건이어야)
   ```
2. **수동/반자동(행동)** — R*·Capability는 해당 에이전트를 샘플 입력으로 호출해 기대 동작을 관찰.
   회귀 의심 시 `/eval` 워크플로우로 프로젝트에 복사해 pass^3 확인.

> 주의: 이 eval은 에이전트 프롬프트를 수정할 때마다 돌려 회귀를 잡는 것이 목적이다.
> 전부 자동화하려 4,000개 단위 테스트를 만들지 않는다(1인 환경 ROI 기준 — 핵심 보장 동작만 고정).
