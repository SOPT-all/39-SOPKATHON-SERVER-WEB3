package org.sopt.web3.school.code;

import org.sopt.web3.global.code.ErrorCode;
import org.springframework.http.HttpStatus;

import lombok.Getter;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
public enum SchoolGameErrorCode implements ErrorCode {

	GAME_NOT_FOUND(HttpStatus.NOT_FOUND, "요청한 놀이가 존재하지 않습니다."),
	INSUFFICIENT_QUESTIONS(HttpStatus.CONFLICT, "놀이를 시작할 수 있는 문제가 부족합니다.");

	private final HttpStatus httpStatus;
	private final String message;
}
