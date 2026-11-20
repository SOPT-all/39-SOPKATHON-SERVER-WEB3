# 코드 컨벤션

## 기본 형식

- 네이버 캠퍼스 핵데이 Java 코딩 컨벤션을 따른다. 들여쓰기는 탭 4칸, 줄 길이는 120자 기준이며 한 줄 제어문에도 중괄호를 사용한다.
- 패키지는 소문자, 클래스·인터페이스는 `UpperCamelCase`, 메서드·변수는 `lowerCamelCase`, 상수는 `UPPER_SNAKE_CASE`로 작성한다.
- 도메인별로 관련 코드를 모으고 Controller → Service → Repository 구조를 따른다.

## 요청·응답과 예외

- 엔티티를 직접 반환하지 않고 응답 DTO를 사용한다. 공통 응답과 페이지네이션은 [API 계약](api-contract.md)을 따른다.
- 요청 형식은 DTO에서 검증하고 업무 규칙은 Service에서 확인한다.
- 기존 `BusinessException`, `ErrorCode`, `GlobalExceptionHandler`를 활용한다. 공통 처리를 컨트롤러마다 반복하지 않는다.
- 기존 코드와 요청 범위에 맞는 간결한 구현을 선택한다.

## 검증

- 변경한 동작과 주요 예외를 확인할 수 있는 검증을 선택한다. 빌드와 테스트 명령 및 Docker 요구사항은 [README](../README.md)를 따른다.
- 테스트 기대값을 요구사항에 맞춰 확인한다. 실행하지 못한 검증은 이유와 함께 보고한다.
