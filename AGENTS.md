# 프로젝트 작업 안내

작업을 시작하기 전에 아래 표에서 해당하는 문서와 기존 코드를 확인한다. 요구사항에 없는 기능을 임의로 추가하지 않고, 확인되지 않은 요구사항과 기술 결정을 임의로 확정하지 않는다. 문서와 코드가 다르면 차이를 알리고 확인한다.

| 작업 | 확인할 문서 |
| --- | --- |
| 실행 환경, 빌드, 운영 | [README.md](README.md) |
| 코드 작성·수정 | [코드 컨벤션](docs/code-conventions.md), 관련 기존 코드 |
| 기능 구현 | [PRD](docs/PRD.md), 관련 API 계약 |
| API 구현·변경 | [API 계약](docs/api-contract.md), 코드 컨벤션 |
| 예외 처리·응답 코드 작성·수정 | [예외 처리 규칙](docs/exception-handling.md), API 계약 |
| DB·구조·배포 변경 | [아키텍처](docs/architecture.md), [ADR](docs/adr/) |
| 이슈·브랜치·커밋·PR | [협업 규칙](docs/ground-rules.md), 해당 GitHub 템플릿 |

변경 범위에 맞게 검증하고 실행하지 못한 검증과 이유를 보고한다. API 계약 변경 시 명세와 Swagger를 확인한다. 사용자의 작업 범위와 기존 변경사항을 존중한다.

