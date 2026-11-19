package org.sopt.web3.global.code;

import org.springframework.http.HttpStatus;

public interface SuccessCode {

	HttpStatus getHttpStatus();

	String getMessage();
}
