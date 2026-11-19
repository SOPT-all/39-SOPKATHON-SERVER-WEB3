package org.sopt.web3.global.exception;

import java.util.LinkedHashMap;
import java.util.Map;

import org.sopt.web3.global.code.ErrorCode;
import org.sopt.web3.global.code.GlobalErrorCode;
import org.sopt.web3.global.response.BaseResponse;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.method.annotation.HandlerMethodValidationException;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler extends ResponseEntityExceptionHandler {

	@ExceptionHandler(BusinessException.class)
	public ResponseEntity<BaseResponse<Void>> handleBusinessException(BusinessException exception) {
		ErrorCode errorCode = exception.getErrorCode();
		logException(errorCode.getHttpStatus(), exception);
		return BaseResponse.fail(errorCode);
	}

	@ExceptionHandler(Exception.class)
	public ResponseEntity<BaseResponse<Void>> handleException(Exception exception) {
		ErrorCode errorCode = GlobalErrorCode.INTERNAL_SERVER_ERROR;
		logException(errorCode.getHttpStatus(), exception);
		return BaseResponse.fail(errorCode);
	}

	@Override
	protected ResponseEntity<Object> handleMethodArgumentNotValid(MethodArgumentNotValidException exception,
		HttpHeaders headers, HttpStatusCode statusCode, WebRequest request) {
		Map<String, String> fieldErrors = new LinkedHashMap<>();
		exception.getBindingResult()
			.getFieldErrors()
			.forEach(fieldError -> fieldErrors.putIfAbsent(fieldError.getField(), fieldError.getDefaultMessage()));

		logException(statusCode, exception);
		ErrorCode errorCode = GlobalErrorCode.INVALID_INPUT_VALUE;
		return ResponseEntity.status(errorCode.getHttpStatus())
			.headers(headers)
			.body(BaseResponse.failBody(errorCode.getHttpStatus(), errorCode.getMessage(), fieldErrors));
	}

	@Override
	protected ResponseEntity<Object> handleHandlerMethodValidationException(HandlerMethodValidationException exception,
		HttpHeaders headers, HttpStatusCode statusCode, WebRequest request) {
		if (exception.isForReturnValue()) {
			return handleExceptionInternal(exception, null, headers, statusCode, request);
		}
		Map<String, String> fieldErrors = new LinkedHashMap<>();
		exception.getParameterValidationResults().forEach(result -> {
			String parameterName = result.getMethodParameter().getParameterName();
			String key = parameterName != null ? parameterName : "arg" + result.getMethodParameter().getParameterIndex();
			result.getResolvableErrors().forEach(error -> fieldErrors.putIfAbsent(key, error.getDefaultMessage()));
		});
		logException(statusCode, exception);
		return ResponseEntity.status(statusCode).headers(headers)
			.body(BaseResponse.failBody(statusCode, GlobalErrorCode.INVALID_INPUT_VALUE.getMessage(), fieldErrors));
	}

	@Override
	protected ResponseEntity<Object> handleExceptionInternal(Exception exception, Object body, HttpHeaders headers,
		HttpStatusCode statusCode, WebRequest request) {
		logException(statusCode, exception);
		ErrorCode errorCode = GlobalErrorCode.from(statusCode);
		return ResponseEntity.status(statusCode)
			.headers(headers)
			.body(BaseResponse.failBody(statusCode, errorCode.getMessage(), null));
	}

	private void logException(HttpStatusCode statusCode, Exception exception) {
		if (statusCode.is5xxServerError()) {
			log.error("[{}] {}", statusCode.value(), exception.getMessage(), exception);
			return;
		}
		log.warn("[{}] {}", statusCode.value(), exception.getMessage());
	}
}
