# Parallel Agent Model Policy

> 병렬 에이전트 실행 시 모델 선택 규칙. 토큰 비용 최적화 목적.

## 핵심 규칙

**병렬 실행되는 서브에이전트는 `model: sonnet`을 사용한다.**

- 동시에 2개 이상 spawn하는 경우 → 전원 sonnet
- 단일 에이전트만 spawn하는 경우 → 작업 난이도에 맞춰 opus/sonnet/haiku 선택
- 오케스트레이터 자체는 의사결정·합성 부담이 크면 opus 유지 가능

## 적용 방법

### 에이전트 정의 파일

병렬 호출 전제 에이전트는 frontmatter에 명시:

```yaml
---
name: bd-debater-a
description: ...
tools: [...]
model: sonnet  # ← 병렬 토론 전제이므로 sonnet 고정
---
```

### 런타임 호출 (Task tool)

병렬 spawn 시 `model` 파라미터로 강제:

```javascript
// 동시 호출 - 모두 sonnet
Agent({ subagent_type: "Explore", model: "sonnet", ... })
Agent({ subagent_type: "code-reviewer", model: "sonnet", ... })
```

## 예외

- **opus가 필요한 경우**: 작업이 다단계 추론·합성·창의적 산출을 요구하고, 그 결과가 다른 병렬 결과에 의존하지 않을 때. 호출 시 `model: opus`로 명시.
- **haiku가 충분한 경우**: 단순 검색·요약·포맷 변환만 수행. 호출 시 `model: haiku`로 명시.

병렬 작업이 아니라면 이 규칙은 적용되지 않는다.

## 이유

병렬 서브에이전트는 보통 독립적·동질적 서브태스크를 처리한다. 한 명의 opus보다 여러 명의 sonnet이 wall-clock과 토큰 모두에서 유리하다. opus는 합성 단계(메인 또는 reviewer)에서만 결정적으로 사용한다.
