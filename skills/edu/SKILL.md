---
name: edu
description: |
  유료 강의 콘텐츠 제작 파이프라인. 클래스101, 유데미, 유튜브, 블로그 강의 제작 시 활성화.
  orchestrator → researcher → verifier(80점↑) → script_writer → verifier(80점↑) → slide_designer + material_creator(병렬) → reviewer 순서로 실행.
  산출물: lecture_script.md, slide_structure.json, handout_structure.json, WORKFLOW-REPORT.md
argument-hint: '[강의 주제] [--platform 클래스101|유데미|유튜브|블로그] [--audience 입문자|중급자|고급자] [--duration 분]'
---

# /edu 스킬 — 유료 강의 콘텐츠 제작 파이프라인

## 개요

```
입력: /edu [강의 주제] [--platform 플랫폼] [--audience 청중 수준] [--duration 목표 분량]

[Phase 0] 파이프라인 초기화
  └─ /tmp/edu-pipeline/ 디렉토리 생성

[Phase 1] 주제 조사
  └─ edu-researcher → knowledge_base.md

[Phase 2] 조사 검증 (품질 게이트 1)
  └─ edu-verifier → 80점 이상: Phase 3 / 미만: Phase 1 재실행

[Phase 3] 스크립트 작성
  └─ edu-script-writer → lecture_script.md

[Phase 4] 스크립트 검증 (품질 게이트 2)
  └─ edu-verifier → 80점 이상: Phase 5 / 미만: Phase 3 재실행

[Phase 5] 슬라이드 + 학습자료 병렬 제작
  ├─ edu-slide-designer → slide_structure.json
  └─ edu-material-creator → handout_structure.json

[Phase 6] 최종 검토
  └─ edu-reviewer → WORKFLOW-REPORT.md

[출력] 강의 제작 패키지 (4개 파일)
```

## 파라미터

| 파라미터 | 기본값 | 설명 |
|---------|--------|------|
| 강의 주제 | (필수) | 강의 주제 또는 제목 |
| --platform | 유튜브 | 클래스101 / 유데미 / 유튜브 / 블로그 |
| --audience | 입문자 | 입문자 / 중급자 / 고급자 |
| --duration | 30 | 목표 강의 시간 (분) |

## Phase -1 (선택): 강의 시리즈 / 신규 플랫폼 진입 기획

다음 경우 `/edu` 실행 **전에** `product-planning` 스킬을 먼저 실행한다:

| 상황 | product-planning |
|------|------------------|
| 신규 강의 시리즈 런칭 (5강+ 묶음) | ✅ 필수 (Full) |
| 신규 플랫폼 진입 (예: 클래스101 → 유데미) | ✅ 필수 (Lite) |
| 신규 분야 진출 (예: 마케팅 → 코딩 강의) | ✅ 필수 (Full) |
| 단일 영상/단일 강의 | ❌ 스킵 (바로 Phase 0) |

**산출물**: `<강의시리즈>-planning/02-prd.md`(커리큘럼 정의), `05-launch-plan.md`(GTM)
이를 입력으로 개별 강의를 `/edu`로 제작.

## Phase 0: 파이프라인 초기화

```bash
mkdir -p /tmp/edu-pipeline
echo "Pipeline started: $(date)" > /tmp/edu-pipeline/pipeline.log
```

에이전트에게 전달할 컨텍스트 파일 생성:
```bash
cat > /tmp/edu-pipeline/context.md << 'EOF'
# 강의 제작 컨텍스트
- 주제: [강의 주제]
- 플랫폼: [플랫폼]
- 대상 청중: [청중 수준]
- 목표 강의 시간: [분]
- 파이프라인 시작: [날짜]
- 상위 시리즈 PRD: [있을 시 경로, 없으면 N/A]
EOF
```

## Phase 1: 주제 조사

`edu-researcher` 에이전트를 활성화합니다.

프롬프트:
```
context.md를 읽고 다음을 수행하세요:
1. 강의 주제에 대한 심층 조사 수행
2. /tmp/edu-pipeline/knowledge_base.md 생성
3. 조사 완료 후 edu-orchestrator에게 보고
```

## Phase 2: 조사 검증 (품질 게이트 1)

`edu-verifier` 에이전트를 활성화합니다.

프롬프트:
```
/tmp/edu-pipeline/knowledge_base.md를 읽고:
1. 조사 결과 검증 루브릭으로 점수 산정
2. /tmp/edu-pipeline/verification-report-1.md 생성
3. PASS(80↑) 시: 오케스트레이터에게 Phase 3 진행 허가
4. FAIL 시: researcher에게 피드백 전달 및 재조사 요청
   - 최대 3회까지 재시도
   - 3회 실패 시 사용자에게 에스컬레이션
```

## Phase 3: 스크립트 작성

`edu-script-writer` 에이전트를 활성화합니다.

프롬프트:
```
/tmp/edu-pipeline/knowledge_base.md와 context.md를 읽고:
1. 플랫폼 특성에 맞는 강의 스크립트 작성
2. /tmp/edu-pipeline/lecture_script.md 생성
3. 완성 후 오케스트레이터에게 보고
```

## Phase 4: 스크립트 검증 (품질 게이트 2)

`edu-verifier` 에이전트를 활성화합니다.

프롬프트:
```
/tmp/edu-pipeline/lecture_script.md를 읽고:
1. 스크립트 검증 루브릭으로 점수 산정
2. /tmp/edu-pipeline/verification-report-2.md 생성
3. PASS(80↑) 시: Phase 5 진행 허가
4. FAIL 시: script-writer에게 피드백 전달 및 재작업 요청
```

## Phase 5: 병렬 제작

`edu-slide-designer`와 `edu-material-creator`를 **동시에** 활성화합니다.

### edu-slide-designer 프롬프트:
```
/tmp/edu-pipeline/lecture_script.md와 context.md를 읽고:
1. 슬라이드 구조 설계
2. /tmp/edu-pipeline/slide_structure.json 생성
3. 완성 후 오케스트레이터에게 보고
```

### edu-material-creator 프롬프트:
```
/tmp/edu-pipeline/lecture_script.md와 context.md를 읽고:
1. 핸드아웃/워크시트/체크리스트 설계
2. /tmp/edu-pipeline/handout_structure.json 생성
3. 완성 후 오케스트레이터에게 보고
```

두 에이전트 모두 완료 후 Phase 6 진행.

## Phase 6: 최종 검토

`edu-reviewer` 에이전트를 활성화합니다.

프롬프트:
```
/tmp/edu-pipeline/ 디렉토리의 모든 파일을 읽고:
1. 스크립트-슬라이드-학습자료 일관성 검증
2. 학습 목표 달성 여부 확인
3. /tmp/edu-pipeline/WORKFLOW-REPORT.md 생성
4. 파이프라인 완료 보고
```

## 산출물

| 파일 | 위치 | 설명 |
|------|------|------|
| knowledge_base.md | /tmp/edu-pipeline/ | 주제 조사 자료 |
| lecture_script.md | /tmp/edu-pipeline/ | 강의 스크립트 |
| slide_structure.json | /tmp/edu-pipeline/ | 슬라이드 구조 (PPTX 변환용) |
| handout_structure.json | /tmp/edu-pipeline/ | 핸드아웃 구조 (DOCX 변환용) |
| WORKFLOW-REPORT.md | /tmp/edu-pipeline/ | 전체 품질 리포트 |

## 에러 처리

| 상황 | 대응 |
|------|------|
| 품질 게이트 3회 실패 | 사용자에게 에스컬레이션, 주제 재검토 제안 |
| 에이전트 응답 없음 | 해당 단계 재시도 1회 |
| JSON 파싱 오류 | 해당 에이전트에게 수정 요청 |
| 파이프라인 중단 | /tmp/edu-pipeline/pipeline.log 확인 |

## 플랫폼별 특이사항

### 클래스101
- 섹션당 20-40분 기준
- 프로젝트 기반 실습 비중 60% 이상
- 수강생 결과물(포트폴리오) 명확히

### 유데미
- 영어/한국어 이중 자막 고려
- 섹션별 퀴즈 1개 이상
- 자막 최적화 속도로 스크립트 작성

### 유튜브
- 첫 60초 훅 집중
- 챕터 마커 시간 표시
- 썸네일 텍스트 연계

### 블로그 강의
- SEO 구조 (H2/H3 계층)
- 코드 스니펫 실행 가능 형태
- CTA (뉴스레터/구독) 포함

## 관련 에이전트

| 에이전트 | 역할 | 모델 |
|--------|------|------|
| edu-orchestrator | 파이프라인 총괄 | sonnet |
| edu-researcher | 주제 조사 | sonnet |
| edu-verifier | 품질 게이트 | sonnet |
| edu-script-writer | 스크립트 작성 | sonnet |
| edu-slide-designer | 슬라이드 설계 | sonnet |
| edu-material-creator | 학습자료 설계 | sonnet |
| edu-reviewer | 최종 검토 | haiku |
