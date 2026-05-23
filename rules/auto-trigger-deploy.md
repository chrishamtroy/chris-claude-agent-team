# Auto Trigger: "배포" / "ship"

> 사용자가 **"배포"** 또는 **"ship"**이라고 말하면 아래 파이프라인을 자동 실행한다.

## 발동 키워드

- "배포", "배포 해줘", "배포해"
- "ship", "ship it", "ship 해줘"

모호한 변형(`"배포 가능한가?"`, `"ship 준비됐어?"` 같은 질문)은 발동하지 않고 답변만 한다. **명령형**일 때만 발동.

## 파이프라인 (4단계)

### Step 1 — 테스트 실행

```bash
cd apps/api && python -m pytest
```

- 프로젝트에 다른 표준 테스트 명령이 있다면 그것을 우선 사용 (예: `pnpm test`, `pytest`, `cargo test`).
- 명령은 프로젝트 루트의 `CLAUDE.md` "빌드/테스트" 섹션을 참조해 결정.

### Step 2 — 실패 시 즉시 중단

- 어느 한 테스트라도 실패하면:
  - 실패한 테스트명·에러 메시지·관련 파일을 보고
  - **`git add`, `commit`, `push` 모두 실행하지 않음**
  - 사용자에게 어떻게 처리할지 묻는다 (수정 시도 vs. 중단)

### Step 3 — 전체 통과 시 자동 배포

순서대로 실행:

1. `git add -A` — 변경된 파일 전체 스테이징
2. **커밋 메시지 자동 작성** — `git diff --staged`와 `git log -5` 분석:
   - `feat:` / `fix:` / `refactor:` / `chore:` 자동 분류
   - 1줄 제목 (50자 이내) + 필요 시 본문
   - `golden-principles.md`의 conventional commits 형식 준수
3. `git commit -m "<message>"` — HEREDOC 사용해 정확한 포맷 보존
4. `git push origin <현재브랜치>` — 브랜치명은 `git rev-parse --abbrev-ref HEAD`로 동적 결정

### Step 4 — 결과 요약 출력

```
✅ 배포 완료

테스트: <N>개 통과 (실행 <duration>)
커밋:   <hash> <message>
푸시:   <branch> → origin/<branch>
변경:   <files> 개 파일, +<add>/-<del>
```

## 안전 가드

- `main` / `master` 브랜치에 직접 push할 때는 **한 번 확인** ("main에 직접 push합니다. 진행할까요?").
- 커밋되지 않은 .env, secrets 의심 파일이 staging에 포함되면 **중단하고 보고**.
- `git status`가 clean이면 (변경 없음) 테스트만 돌리고 "변경 없음, 푸시 대상 없음" 보고.
- pre-commit hook 실패 시 우회 금지(`--no-verify` 사용 금지). 실패 원인부터 수정.

## 출력 토큰 절약

- Step 1/Step 3는 명령 출력의 핵심 라인만 표시 (`tail -20` 정도).
- Step 4 요약을 보고서로 갈음 — 중간 단계의 상세 로그는 출력하지 않는다.
