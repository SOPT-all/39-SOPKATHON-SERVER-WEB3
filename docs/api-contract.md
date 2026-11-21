# API 계약

## 공통 규칙

- 성공과 실패 응답은 `BaseResponse`로 감싸고 `ResponseEntity`로 반환한다.
- 응답에는 엔티티 대신 DTO를 사용한다. 페이지네이션을 사용하는 경우 요청과 응답의 페이지 번호는 1부터 시작하며 `PageResponse`를 활용한다.
- 응답 계약을 변경하면 Swagger도 함께 수정하고 실제 응답과 비교한다.
- 공통 접두사, 인증 및 날짜 형식: 미정. 합의 전 임의로 확정하지 않는다.

## 공통 응답 형식

| 필드 | 타입 | 설명 |
| --- | --- | --- |
| `success` | boolean | 성공 여부 |
| `code` | string | 실제 HTTP 상태 코드와 같은 문자열. 도메인별 코드는 사용하지 않는다. |
| `message` | string | 사용자에게 보여줄 수 있는 응답 메시지 |
| `data` | 응답별 상이 | 반환 데이터. 반환할 데이터가 없으면 `null` |

| 상황 | `data` |
| --- | --- |
| 반환할 데이터가 있는 성공 | 응답 DTO |
| 페이지네이션을 사용하는 목록 조회 | `PageResponse<T>` |
| 반환할 데이터가 없는 성공 | `null` |
| 요청 값 검증 실패 | 필드명과 오류 메시지의 객체 |
| 그 외 공통 실패 | `null` |

### 성공 응답 예시

```json
{
  "success": true,
  "code": "200",
  "message": "요청 처리 성공",
  "data": null
}
```

### 일반 실패 응답 예시

```json
{
  "success": false,
  "code": "404",
  "message": "요청한 리소스가 존재하지 않습니다.",
  "data": null
}
```

### 요청 값 검증 실패 예시

```json
{
  "success": false,
  "code": "400",
  "message": "요청 값이 올바르지 않습니다.",
  "data": {
    "name": "이름은 필수입니다."
  }
}
```

예시는 형식을 설명하기 위한 것이며, 실제 메시지와 필드명은 해당 응답 코드와 API 명세를 따른다. 서버 내부 처리 기준은 [예외 처리 규칙](exception-handling.md)을 참고한다.

## API 목록

| 구분 | Method | 경로 | API | 관련 요구사항 |
| --- | --- | --- | --- | --- |
| 유아 | POST | `/preschool/recommendations` | AI 놀이 추천 | PRE-01~03 |
| 초등학생 | GET | `/school/games` | 놀이 목록 조회 | ELM-01~02 |
| 초등학생 | POST | `/school/games/{gameId}/rounds` | 놀이 시작 | ELM-02, ELM-07 |
| 초등학생 | POST | `/school/rounds/{roundId}/answers` | 답변 제출 | ELM-03, ELM-07 |
| 초등학생 | GET | `/school/rounds/{roundId}/result` | 회차 결과 조회 | ELM-04~05 |

요구사항은 [PRD](PRD.md)를 따른다. 아래 필드명, 타입, 성공 상태는 프런트엔드 협의용 초안이다. `gameId`, `roundId`, `questionId`, `choiceId`는 API 식별자이며 DB 컬럼 매핑은 ERD 확인 후 정한다.

### AI 놀이 추천

`POST /preschool/recommendations` · 성공 응답 `200 OK`

| 요청 본문 | 타입 | 필수 | 제약 |
| --- | --- | --- | --- |
| `age` | integer | 예 | 4~7세 |
| `placeName` | string | 예 | 공백 외 문자를 포함한 장소명 |
| `waitingMinutes` | integer | 아니오 | 생략 가능. 값은 5·10·15·20·25·30 중 하나 |

- `data`는 놀이 이름 `title`(string), 설명 `description`(string), 질문 `questions`(배열, 정확히 3개)을 포함한다. 각 질문의 `text`와 `image`는 별도 필드이며, 이미지 전달 형식은 협의한다.
- AI는 장소명을 기준으로 검색한다. AI가 반환한 콘텐츠는 DB에 저장하지 않는다. **찾았어요**와 마침 화면 이동은 화면에서 처리한다.
- 요청값 검증 실패는 `400`을 반환한다. 검색·추천 실패 및 결과 없음 응답은 협의한다.

### 놀이 목록 조회

`GET /school/games` · 성공 응답 `200 OK`

- 요청 파라미터와 본문은 없다. 선택한 나이와 관계없이 같은 놀이 목록을 반환한다.
- `data.games`는 놀이 배열이다. 각 놀이에는 `gameId`(integer), `name`(string), `rules`(string), `example`(string)을 포함하는 안으로 정리한다. 이 응답으로 놀이 선택 뒤 시작 전에 규칙과 예시를 표시한다.

### 놀이 시작

`POST /school/games/{gameId}/rounds` · 성공 응답 `201 Created`

- 필수 경로 변수는 `gameId`(integer)다. 요청 본문은 없다. 서버는 고정 사용자 ID `1`을 적용한다.
- 해당 사용자가 이미 답한 문항을 정답 여부와 관계없이 제외하고, 새 회차에 문제 3개를 배정한다.
- 미풀이 문항 선정은 서비스에서 사용자 ID `1`의 답변 이력을 조회해 처리한다.
- `data`에는 `roundId`(integer)와 출제 순서대로 정렬한 `questions`(배열)을 포함한다. 각 문제는 `questionId`(integer), `text`(string), `choices`(배열, 정확히 2개)를 포함한다. 각 보기에는 `choiceId`(integer), `text`(string)가 있다. 정답과 선택별 피드백은 답변 제출 후 전달한다.
- 존재하지 않는 놀이는 `404`를 반환한다.

### 답변 제출

`POST /school/rounds/{roundId}/answers` · 성공 응답 `200 OK`

| 요청 위치 | 필드 | 타입 | 필수 |
| --- | --- | --- | --- |
| 경로 | `roundId` | integer | 예 |
| 본문 | `questionId` | integer | 예 |
| 본문 | `choiceId` | integer | 예 |

- 회차에 출제된 문제인지, 제출한 보기가 해당 문제에 속하는지 확인한 뒤 서버에서 채점하고 풀이 이력을 기록한다.
- 같은 회차의 같은 문항에 답변이 이미 있는지 서비스에서 확인한다. 동시 요청에서도 중복 저장이 발생하지 않도록 확인과 저장을 직렬화하며, 중복 방지용 DB 유일 제약은 추가하지 않는다.
- `data`에는 정답 여부 `correct`(boolean), 고른 보기 `selectedChoice`, 알맞은 답 `correctAnswer`(string), 고른 보기에 해당하는 `feedback`(string)을 포함한다. `selectedChoice`는 `choiceId`와 `text`를 포함한다.
- 잘못된 요청값이나 회차·문제·보기 조합은 `400`, 존재하지 않는 회차는 `404`를 반환한다. 같은 문항을 다시 제출했을 때의 응답은 협의한다.

### 회차 결과 조회

`GET /school/rounds/{roundId}/result` · 성공 응답 `200 OK`

- 필수 경로 변수는 `roundId`(integer)다. 요청 본문은 없다.
- `data`에는 푼 문제 수 `answeredCount`(integer), 맞힌 문제 수 `correctCount`(integer), 출제 순서대로 정렬한 복습 목록 `reviews`(배열)을 포함한다.
- 각 복습 항목에는 `questionId`(integer), `correct`(boolean), `correctAnswer`(string)를 포함한다. 틀린 문항에는 `selectedChoice`와 `feedback`을 추가로 포함한다.
- 존재하지 않는 회차는 `404`를 반환한다. 완료 전 결과 조회를 요청했을 때의 응답은 협의한다.

## ERD 확정 후 확인

- 회차·문항·보기 식별자의 매핑, 회차 완료 판정, 답변 기록과 선택별 피드백의 데이터 구조를 확인한다.
- 구현 시 확정한 요청·응답 및 상태 코드를 Swagger와 실제 응답에 반영한다.
