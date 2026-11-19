package org.sopt.web3.health.code;

import org.sopt.web3.global.code.SuccessCode;
import org.springframework.http.HttpStatus;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum HealthSuccessCode implements SuccessCode {

	HEALTH_FETCHED(HttpStatus.OK, "서버 상태 조회 성공");

	private final HttpStatus httpStatus;
	private final String message;
}
