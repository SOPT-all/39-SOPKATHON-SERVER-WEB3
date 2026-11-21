package org.sopt.web3.school.controller;

import org.sopt.web3.global.code.SuccessCode;
import org.sopt.web3.global.response.BaseResponse;
import org.sopt.web3.school.dto.AnswerSubmitRequest;
import org.sopt.web3.school.dto.AnswerSubmitResponse;
import org.sopt.web3.school.service.SchoolAnswerService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/school/rounds")
@RequiredArgsConstructor
@Tag(name = "초등학생 놀이")
public class SchoolAnswerController {

	private final SchoolAnswerService schoolAnswerService;

	@PostMapping("/{roundId}/answers")
	@Operation(summary = "답변 제출", description = "고정 사용자 1의 답변을 저장하고 채점합니다. "
		+ "중복 제출은 최초 저장 결과를 반환합니다.")
	@ApiResponse(responseCode = "200", description = "답변 저장 및 채점 성공 또는 최초 저장 결과 재반환",
		useReturnTypeSchema = true)
	@ApiResponse(responseCode = "400", description = "잘못된 요청 또는 회차·문제·보기 조합",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "404", description = "고정 사용자 1의 회차가 존재하지 않음",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "500", description = "예상하지 못한 서버 내부 오류",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	public ResponseEntity<BaseResponse<AnswerSubmitResponse>> submitAnswer(
		@Parameter(description = "답을 제출할 회차 ID", example = "101")
		@PathVariable("roundId") Long roundId,
		@Valid @RequestBody AnswerSubmitRequest request
	) {
		return BaseResponse.success(AnswerSuccessCode.ANSWER_SUBMITTED,
			schoolAnswerService.submitAnswer(roundId, request));
	}

	@Getter
	@RequiredArgsConstructor
	private enum AnswerSuccessCode implements SuccessCode {
		ANSWER_SUBMITTED(HttpStatus.OK, "요청 처리 성공");

		private final HttpStatus httpStatus;
		private final String message;
	}
}
