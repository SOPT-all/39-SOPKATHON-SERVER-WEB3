package org.sopt.web3.preschool.code;

import org.sopt.web3.global.code.ErrorCode;
import org.springframework.http.HttpStatus;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum PreschoolErrorCode implements ErrorCode {
	CANNOT_GENERATE(HttpStatus.UNPROCESSABLE_ENTITY,
		"해당 장소에 맞는 질문을 만들 수 없습니다. 다른 장소를 입력해 주세요."),
	SERVICE_UNAVAILABLE(HttpStatus.SERVICE_UNAVAILABLE,
		"일시적인 문제로 질문을 생성하지 못했습니다. 잠시 후 다시 시도해 주세요.");

	private final HttpStatus httpStatus;
	private final String message;
}
