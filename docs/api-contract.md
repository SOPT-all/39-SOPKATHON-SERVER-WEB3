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

AI는 입력한 장소명을 기준으로 검색해 주변 사물 찾기 질문을 생성한다. AI 콘텐츠는 DB에 저장하지 않는다. **찾았어요**와 마침 화면 이동은 화면에서 처리한다.

#### 요청

| 필드 | 타입 | 필수 | Nullable | 설명 |
| --- | --- | --- | --- | --- |
| `age` | integer | 예 | 아니오 | 아이의 나이(4~7세). 예시는 `5` |
| `placeName` | string | 예 | 아니오 | 공백 외 문자를 포함한 장소명. 예시는 `"병원"` |
| `waitingMinutes` | integer | 아니오 | 아니오 | 생략 가능. 제공할 때는 5·10·15·20·25·30 중 하나 |

요청 본문은 `application/json` 형식이다. 쿼리 파라미터는 없다.

#### 응답

| 필드 | 타입 | 필수 | Nullable | 설명 |
| --- | --- | --- | --- | --- |
| `success` | boolean | 예 | 아니오 | 요청 성공 여부 |
| `code` | string | 예 | 아니오 | HTTP 상태 코드 문자열 |
| `message` | string | 예 | 아니오 | 응답 메시지 |
| `data` | object | 예 | 아니오 | 생성 결과 |
| `data.placeName` | string | 예 | 아니오 | 요청받은 장소명 |
| `data.questions` | array | 예 | 아니오 | 출제 순서대로 정렬한 질문 3개 |
| `data.questions[].text` | string | 예 | 아니오 | 질문 문구 |
| `data.questions[].imageUrl` | string | 예 | 아니오 | 질문에 대응하는 SVG 이미지 URL |

**200 응답 예시**

```json
{
  "success": true,
  "code": "200",
  "message": "요청 처리 성공",
  "data": {
    "placeName": "병원",
    "questions": [
      { "text": "의자를 찾아볼까요?", "imageUrl": "https://example.com/images/chair.svg" },
      { "text": "시계를 찾아볼까요?", "imageUrl": "https://example.com/images/clock.svg" },
      { "text": "문을 찾아볼까요?", "imageUrl": "https://example.com/images/door.svg" }
    ]
  }
}
```

#### HTTP 상태

| 상태 | 응답 |
| --- | --- |
| `200 OK` | 질문 3개 생성 성공 |
| `400 Bad Request` | 요청값 검증 실패 시 `data`에 필드별 오류를 반환한다. 잘못된 JSON은 공통 형식에 따라 `data: null`을 반환한다. |
| `422 Unprocessable Content` | 요청 형식은 유효하지만 해당 장소에 맞는 질문을 만들 수 없다. `data`는 `null`이다. |
| `503 Service Unavailable` | AI 검색·생성 서비스의 일시적인 실패로 결과를 얻지 못했다. `data`는 `null`이다. |
| `500 Internal Server Error` | 예상하지 못한 서버 오류. `data`는 `null`이다. |

**400 응답 예시 · 요청값 검증 실패**

```json
{
  "success": false,
  "code": "400",
  "message": "요청 값이 올바르지 않습니다.",
  "data": { "age": "나이는 4~7세여야 합니다." }
}
```

**422 응답 예시 · 장소에 맞는 질문 생성 불가**

```json
{
  "success": false,
  "code": "422",
  "message": "해당 장소에 맞는 질문을 만들 수 없습니다. 다른 장소를 입력해 주세요.",
  "data": null
}
```

**503 응답 예시 · AI 서비스 일시 실패**

```json
{
  "success": false,
  "code": "503",
  "message": "일시적인 문제로 질문을 생성하지 못했습니다. 잠시 후 다시 시도해 주세요.",
  "data": null
}
```

**500 응답 예시 · 서버 내부 오류**

```json
{
  "success": false,
  "code": "500",
  "message": "서버 내부 오류입니다.",
  "data": null
}
```

### 놀이 목록 조회

`GET /school/games` · 성공 응답 `200 OK`

초등학생 대상 나이는 8~10세다. 세 나이 모두 같은 놀이 목록을 반환하며 목록 조회 시 나이를 받지 않는다. 목록 응답에서 제공하는 규칙은 시작 전 안내 화면에 사용할 수 있다.

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

경로 변수, 쿼리 파라미터, 요청 본문이 없다.

#### 응답

| 필드 | 타입 | 필수 | Nullable | 설명 |
| --- | --- | --- | --- | --- |
| `success` | boolean | 예 | 아니오 | 요청 성공 여부 |
| `code` | string | 예 | 아니오 | HTTP 상태 코드 문자열 |
| `message` | string | 예 | 아니오 | 응답 메시지 |
| `data` | object | 예 | 아니오 | 성공 응답 데이터 |
| `data.games` | array | 예 | 아니오 | 놀이 목록. 등록된 놀이가 없으면 빈 배열 |
| `data.games[].gameId` | integer | 예 | 아니오 | 놀이 ID |
| `data.games[].name` | string | 예 | 아니오 | 놀이 이름 |
| `data.games[].rules` | string | 예 | 아니오 | 놀이 규칙 |

**200 응답 예시**

```json
{
  "success": true,
  "code": "200",
  "message": "요청 처리 성공",
  "data": {
    "games": [
      {
        "gameId": 1,
        "name": "문장 완성하기",
        "rules": "빈칸에 어울리는 표현을 골라요."
      }
    ]
  }
}
```

#### HTTP 상태

| 상태 | 응답 |
| --- | --- |
| `200 OK` | 놀이 목록 조회 성공. 목록이 비어 있어도 `data.games`에 `[]`을 반환한다. |
| `500 Internal Server Error` | DB 조회 실패 등 예상하지 못한 서버 오류. `data`는 `null`이다. |

요청값이 없는 API이므로 엔드포인트 자체의 요청값 검증 오류(`400`)는 정의하지 않는다.

**500 응답 예시**

```json
{
  "success": false,
  "code": "500",
  "message": "서버 내부 오류입니다.",
  "data": null
}
```

`rules`는 `topic.rules`에서 제공한다. 목록은 놀이 ID 오름차순으로 반환한다.

### 놀이 시작

`POST /school/games/{gameId}/rounds` · 성공 응답 `201 Created`

서비스는 선택한 놀이와 나이에 맞으며 선택지가 정확히 2개인 문제를 조회한다. 고정 사용자 ID `1`이 이미 답한 문제를 정답 여부와 관계없이 제외하고, 새 회차에 문제 3개를 배정한다. 정답과 선택별 피드백은 답변 제출 후 전달한다.

#### 요청

| 필드 | 타입 | 필수 | Nullable | 설명 |
| --- | --- | --- | --- | --- |
| `gameId` | integer | 예 | 아니오 | 시작할 놀이의 ID. 경로 변수이며 예시는 `1` |
| `age` | integer | 예 | 아니오 | 선택한 나이. JSON 본문에 8~10세 정수로 전달하며 예시는 `9` |

쿼리 파라미터는 없다. 요청 본문은 `application/json` 형식이며 사용자 ID는 서버에서 적용한다.

**요청 예시**

```json
{
  "age": 9
}
```

#### 응답

| 필드 | 타입 | 필수 | Nullable | 설명 |
| --- | --- | --- | --- | --- |
| `success` | boolean | 예 | 아니오 | 요청 성공 여부 |
| `code` | string | 예 | 아니오 | HTTP 상태 코드 문자열 |
| `message` | string | 예 | 아니오 | 응답 메시지 |
| `data` | object | 예 | 아니오 | 생성된 회차 데이터 |
| `data.roundId` | integer | 예 | 아니오 | 생성된 회차 ID |
| `data.questions` | array | 예 | 아니오 | 출제 순서대로 정렬한 문제 3개 |
| `data.questions[].questionId` | integer | 예 | 아니오 | 문제 ID |
| `data.questions[].text` | string | 예 | 아니오 | 문제 내용 |
| `data.questions[].choices` | array | 예 | 아니오 | 문항별 선택지 2개 |
| `data.questions[].choices[].choiceId` | integer | 예 | 아니오 | 선택지 ID |
| `data.questions[].choices[].text` | string | 예 | 아니오 | 선택지 내용 |

**201 응답 예시**

```json
{
  "success": true,
  "code": "201",
  "message": "놀이를 시작했습니다.",
  "data": {
    "roundId": 12,
    "questions": [
      {
        "questionId": 101,
        "text": "친구가 공을 ___.",
        "choices": [
          { "choiceId": 1001, "text": "던져요" },
          { "choiceId": 1002, "text": "마셔요" }
        ]
      },
      {
        "questionId": 102,
        "text": "비가 오면 우산을 ___.",
        "choices": [
          { "choiceId": 1003, "text": "써요" },
          { "choiceId": 1004, "text": "먹어요" }
        ]
      },
      {
        "questionId": 103,
        "text": "작은 목소리가 들려서 귀를 ___.",
        "choices": [
          { "choiceId": 1005, "text": "접어요" },
          { "choiceId": 1006, "text": "기울여요" }
        ]
      }
    ]
  }
}
```

#### HTTP 상태

| 상태 | 응답 |
| --- | --- |
| `201 Created` | 회차 생성 성공. 회차 ID와 출제된 문제 3개를 반환한다. |
| `400 Bad Request` | `gameId`의 형식이 잘못됐거나 요청 본문이 없거나 잘못됐다. `age`가 누락됐거나 정수가 아니거나 8~10 범위를 벗어났을 때도 반환한다. 필드 검증 실패는 `data`에 오류 객체를 반환하고, 본문 또는 경로 변수의 형식을 해석할 수 없으면 `data`는 `null`이다. |
| `404 Not Found` | `gameId`에 해당하는 놀이가 존재하지 않는다. `data`는 `null`이다. |
| `409 Conflict` | 선택한 놀이와 나이에 맞고 보기가 2개인 미풀이 문제가 3개 미만이다. 회차를 생성하지 않으며 `data`는 `null`이다. 메시지는 `놀이를 시작할 수 있는 문제가 부족합니다.`다. |
| `500 Internal Server Error` | DB 조회 또는 회차 저장 중 예상하지 못한 서버 오류가 발생했다. `data`는 `null`이다. |

**400 응답 예시 · 나이 범위 오류**

```json
{
  "success": false,
  "code": "400",
  "message": "요청 값이 올바르지 않습니다.",
  "data": {
    "age": "나이는 8세 이상 10세 이하여야 합니다."
  }
}
```

**404 응답 예시**

```json
{
  "success": false,
  "code": "404",
  "message": "요청한 놀이가 존재하지 않습니다.",
  "data": null
}
```

### 답변 제출

`POST /school/rounds/{roundId}/answers` · 성공 응답 `200 OK`

회차에 배정된 문제와 해당 문제의 보기를 제출하면 서버가 채점한다. 정답 여부와 관계없이 풀이 이력을 저장하고 이후 출제에서 해당 문제를 제외한다. 사용자 ID는 서버에서 `1`을 적용한다.

같은 회차의 같은 문항에 대한 중복 저장은 회차 행의 DB 쓰기 잠금과 트랜잭션으로 확인과 저장을 직렬화해 방지한다. 중복 방지용 DB 유일 제약은 추가하지 않는다. 유효한 문제·보기 조합으로 재제출하면 처음 저장한 채점 결과와 보기·피드백을 `200 OK`로 반환하며 기존 답을 변경하지 않는다. 다른 보기를 재제출해도 최초 답을 유지한다. 회차·문제·보기 조합 검증은 재제출에도 적용한다.

#### 요청

| 필드 | 타입 | 필수 | Nullable | 설명 |
| --- | --- | --- | --- | --- |
| `roundId` | integer | 예 | 아니오 | 회차 ID. 경로 변수이며 예시는 `101` |
| `questionId` | integer | 예 | 아니오 | 회차에 배정된 문제 ID. 본문 필드이며 예시는 `501` |
| `choiceId` | integer | 예 | 아니오 | 선택한 보기 ID. 본문 필드이며 예시는 `1002` |

쿼리 파라미터는 없다. 요청 본문은 `application/json` 형식이다. `questionId`와 `choiceId`는 `Long` 범위의 JSON 정수만 허용하며 소수, 지수 표기, 숫자 문자열은 `400`으로 거절하고 답변을 저장하지 않는다.

```json
{
  "questionId": 501,
  "choiceId": 1002
}
```

#### 응답

| 필드 | 타입 | 필수 | Nullable | 설명 |
| --- | --- | --- | --- | --- |
| `success` | boolean | 예 | 아니오 | 요청 성공 여부. 채점 결과와 별개 |
| `code` | string | 예 | 아니오 | HTTP 상태 코드 문자열 |
| `message` | string | 예 | 아니오 | 응답 메시지. 예시 문구는 구현 시 확정 |
| `data` | object | 예 | 아니오 | 성공 응답 데이터 |
| `data.correct` | boolean | 예 | 아니오 | 서버가 채점한 정답 여부 |
| `data.selectedChoice` | object | 예 | 아니오 | 사용자가 선택한 보기 |
| `data.selectedChoice.choiceId` | integer | 예 | 아니오 | 선택한 보기 ID |
| `data.selectedChoice.text` | string | 예 | 아니오 | 선택한 보기 내용 |
| `data.correctAnswer` | string | 예 | 아니오 | 정답 표시 문구. 문장 완성하기는 완성된 정답 문장 |
| `data.feedback` | string | 예 | 아니오 | 선택한 보기에 해당하는 설명. 정답과 오답 모두 반환 |

**200 응답 예시**

```json
{
  "success": true,
  "code": "200",
  "message": "요청 처리 성공",
  "data": {
    "correct": false,
    "selectedChoice": {
      "choiceId": 1002,
      "text": "마셔요"
    },
    "correctAnswer": "친구가 공을 던져요.",
    "feedback": "물은 마시고, 공은 던져요."
  }
}
```

#### HTTP 상태

| 상태 | 응답 |
| --- | --- |
| `200 OK` | 답변 저장 및 채점 성공. 재제출 시 최초 저장 결과 반환 |
| `400 Bad Request` | 필수값 누락, 잘못된 요청 형식, 회차에 배정되지 않은 문제 또는 해당 문제에 속하지 않는 보기 |
| `404 Not Found` | 회차가 존재하지 않는다. `data`는 `null`이다. |
| `500 Internal Server Error` | 예상하지 못한 서버 오류. `data`는 `null`이다. |

**400 응답 예시 · 본문 필수값 누락**

필드별 문구는 DTO 검증 메시지에 맞춘다.

```json
{
  "success": false,
  "code": "400",
  "message": "요청 값이 올바르지 않습니다.",
  "data": {
    "questionId": "문제 ID는 필수입니다.",
    "choiceId": "보기 ID는 필수입니다."
  }
}
```

**400 응답 예시 · 요청 형식 또는 회차·문제·보기 조합 오류**

잘못된 JSON, 정수로 해석할 수 없는 경로 변수, 회차에 배정되지 않은 문제 또는 해당 문제에 속하지 않는 보기에 적용하는 예시다. 조합 오류의 원인별 메시지는 도메인 오류 코드 확정 시 반영한다.

```json
{
  "success": false,
  "code": "400",
  "message": "요청 값이 올바르지 않습니다.",
  "data": null
}
```

**404 응답 예시 · 존재하지 않는 회차**

```json
{
  "success": false,
  "code": "404",
  "message": "요청한 리소스가 존재하지 않습니다.",
  "data": null
}
```

**500 응답 예시 · 서버 내부 오류**

```json
{
  "success": false,
  "code": "500",
  "message": "서버 내부 오류입니다.",
  "data": null
}
```

### 회차 결과 조회

`GET /school/rounds/{roundId}/result` · 성공 응답 `200 OK`

회차의 푼 문제 수, 맞힌 문제 수, 출제 순서대로 정렬한 복습 목록을 반환한다. 오답 문항에는 사용자가 고른 보기와 그 보기에 해당하는 설명을 포함한다.

#### 요청

| 필드 | 타입 | 필수 | Nullable | 설명 |
| --- | --- | --- | --- | --- |
| `roundId` | integer | 예 | 아니오 | 회차 ID. 경로 변수이며 예시는 `101` |

쿼리 파라미터와 요청 본문은 없다. 사용자 ID는 요청으로 받지 않는다.

#### 응답

| 필드 | 타입 | 필수 | Nullable | 설명 |
| --- | --- | --- | --- | --- |
| `success` | boolean | 예 | 아니오 | 요청 성공 여부 |
| `code` | string | 예 | 아니오 | HTTP 상태 코드 문자열 |
| `message` | string | 예 | 아니오 | 응답 메시지. 실제 문구는 구현 시 확정 |
| `data` | object | 예 | 아니오 | 성공 응답 데이터 |
| `data.answeredCount` | integer | 예 | 아니오 | 답을 제출한 문제 수 |
| `data.correctCount` | integer | 예 | 아니오 | 맞힌 문제 수 |
| `data.reviews` | object[] | 예 | 아니오 | 출제 순서대로 정렬한 문항별 복습 목록 |
| `data.reviews[].questionId` | integer | 예 | 아니오 | 문제 ID |
| `data.reviews[].correct` | boolean | 예 | 아니오 | 정답 여부 |
| `data.reviews[].correctAnswer` | string | 예 | 아니오 | 정답 표시 문구. 문장 완성하기는 완성된 정답 문장 |
| `data.reviews[].selectedChoice` | object | 오답 시 | 아니오 | 사용자가 선택한 보기. 정답이면 생략 |
| `data.reviews[].selectedChoice.choiceId` | integer | 보기 객체 포함 시 | 아니오 | 선택한 보기 ID |
| `data.reviews[].selectedChoice.text` | string | 보기 객체 포함 시 | 아니오 | 선택한 보기 내용 |
| `data.reviews[].feedback` | string | 오답 시 | 아니오 | 선택한 보기에 해당하는 설명. 정답이면 생략 |

**200 응답 예시**

3문제 중 2문제를 맞힌 회차다. 정답 문항에서는 `selectedChoice`와 `feedback`을 생략한다.

```json
{
  "success": true,
  "code": "200",
  "message": "요청 처리 성공",
  "data": {
    "answeredCount": 3,
    "correctCount": 2,
    "reviews": [
      {
        "questionId": 501,
        "correct": false,
        "correctAnswer": "친구가 공을 던져요.",
        "selectedChoice": {
          "choiceId": 1002,
          "text": "마셔요"
        },
        "feedback": "물은 마시고, 공은 던져요."
      },
      {
        "questionId": 502,
        "correct": true,
        "correctAnswer": "비가 오면 우산을 써요."
      },
      {
        "questionId": 503,
        "correct": true,
        "correctAnswer": "작은 목소리가 들려서 귀를 기울여요."
      }
    ]
  }
}
```

#### HTTP 상태

| 상태 | 응답 |
| --- | --- |
| `200 OK` | 결과 조회 성공. 푼 문제 수, 맞힌 문제 수, 문항별 정답과 오답 복습 정보를 반환한다. |
| `400 Bad Request` | 경로 변수 `roundId`를 정수로 해석할 수 없다. |
| `404 Not Found` | 고정 사용자 ID `1`의 회차가 존재하지 않는다. |
| `409 Conflict` | 모든 문항에 답변을 제출하기 전에 결과를 조회했다. `data`는 `null`이다. |
| `500 Internal Server Error` | 예상하지 못한 서버 오류가 발생했다. |

실패 응답은 공통 `BaseResponse` 형식을 따른다. 필드별 검증 오류에는 오류 객체를 반환하며, 아래 경로 변수 형식 오류와 일반 실패 예시의 `data`는 `null`이다.

저장된 답변 수가 회차의 전체 문제 수와 같을 때 결과를 제공한다.

**400 응답 예시 · 경로 변수 형식 오류**

```json
{
  "success": false,
  "code": "400",
  "message": "요청 값이 올바르지 않습니다.",
  "data": null
}
```

**404 응답 예시 · 존재하지 않는 회차**

회차 전용 메시지를 정의하면 해당 메시지를 사용한다.

```json
{
  "success": false,
  "code": "404",
  "message": "요청한 리소스가 존재하지 않습니다.",
  "data": null
}
```

**500 응답 예시 · 서버 내부 오류**

```json
{
  "success": false,
  "code": "500",
  "message": "서버 내부 오류입니다.",
  "data": null
}
```

## ERD 확정 후 확인

- 놀이 시작 요청의 `age`를 `activity.age`에 저장하고, `question.target_age`가 일치하는 문제를 출제한다.
- 회차·문항·보기 식별자의 매핑, 회차 완료 판정, 답변 기록과 선택별 피드백의 데이터 구조를 확인한다.
- 구현 시 확정한 요청·응답 및 상태 코드를 Swagger와 실제 응답에 반영한다.
