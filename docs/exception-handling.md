# 예외 처리 규칙

## 검증 위치

- 요청 값의 형식과 필수 여부는 요청 DTO에서 검증하고, 업무 규칙은 Service에서 확인한다.
- 응답 구조와 `data` 규칙은 [API 계약](api-contract.md)을 따른다.

## 비즈니스 예외와 오류 코드

- 비즈니스 오류는 기존 `BusinessException`에 `ErrorCode`를 전달한다. 도메인별 예외 클래스를 새로 만들지 않는다.
- 의도한 비즈니스 오류를 `RuntimeException`이나 `IllegalArgumentException`으로 직접 던지지 않는다. 처리되지 않은 예외는 공통 예외 처리에서 500으로 응답한다.
- 예외를 삼키지 않는다. 변환이 필요한 경우 원인과 상황에 맞는 `BusinessException`으로 처리한다.
- 도메인별 오류 코드는 `{Domain}ErrorCode`에 추가하고, 여러 도메인에 공통으로 쓰는 코드는 `GlobalErrorCode`에 둔다. 사용하지 않는 코드는 정리한다.
- 같은 HTTP 상태라도 원인에 맞는 메시지를 사용한다. 응답의 `code`는 HTTP 상태 코드 문자열이다.

## 공통 예외 처리

- `GlobalExceptionHandler`에서 공통 예외를 처리하며, 컨트롤러마다 처리 로직을 반복하지 않는다.
- `BusinessException`은 연결된 `ErrorCode`의 HTTP 상태와 메시지를 사용한다.
- 요청 DTO 또는 요청 파라미터 검증 실패는 400과 필드별 오류를 반환한다. 동일 필드에 오류가 여럿이면 첫 메시지를 사용한다.
- 잘못된 JSON, 지원하지 않는 메서드 등 Spring MVC 예외는 해당 HTTP 상태와 공통 메시지를 반환한다.
- 예상하지 못한 예외는 500과 `서버 내부 오류입니다.`를 반환한다.
- 4xx는 스택 트레이스 없이 `warn`으로, 5xx는 스택 트레이스와 함께 `error`로 기록한다.

## HTTP 상태 선택 기준

| 상태 | 사용 상황 |
| --- | --- |
| 400 Bad Request | 요청 값이나 형식이 올바르지 않음 |
| 401 Unauthorized | 인증 정보가 없거나 올바르지 않음 |
| 403 Forbidden | 인증은 되었지만 접근 권한이 없음 |
| 404 Not Found | 요청한 리소스가 없음 |
| 409 Conflict | 현재 리소스 상태와 충돌함 |
| 500 Internal Server Error | 예상하지 못한 서버 오류 |
| 503 Service Unavailable | 서비스가 일시적으로 요청을 처리할 수 없음 |

## 변경 시 확인

- 응답 코드나 메시지를 변경하면 API 계약과 Swagger의 `@ApiResponse` 설명도 함께 확인하고 수정한다.
- 변경한 예외와 응답이 의도한 상태, 메시지, 데이터 형식으로 반환되는지 확인한다.
