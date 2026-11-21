package org.sopt.web3.school.controller;

import org.sopt.web3.global.code.SuccessCode;
import org.sopt.web3.global.response.BaseResponse;
import org.sopt.web3.school.dto.RoundResultResponse;
import org.sopt.web3.school.service.SchoolRoundResultService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@Tag(name = "초등학생 놀이")
public class SchoolRoundResultController {

	private final SchoolRoundResultService resultService;

	@GetMapping("/school/rounds/{roundId}/result")
	@Operation(summary = "회차 결과 조회", description = "완료된 회차의 풀이 수, 정답 수, 문항별 복습 정보를 조회합니다.")
	@ApiResponse(responseCode = "200", description = "회차 결과 조회 성공", useReturnTypeSchema = true)
	@ApiResponse(responseCode = "400", description = "잘못된 회차 ID 형식",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "404", description = "고정 사용자 1의 회차가 존재하지 않음",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "409", description = "아직 모든 문항에 답하지 않은 회차",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "500", description = "예상하지 못한 서버 오류",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	public ResponseEntity<BaseResponse<RoundResultResponse>> getResult(@PathVariable("roundId") long roundId) {
		return BaseResponse.success(ResultSuccessCode.RESULT_RETRIEVED, resultService.getResult(roundId));
	}

	@Getter
	@RequiredArgsConstructor
	private enum ResultSuccessCode implements SuccessCode {
		RESULT_RETRIEVED(HttpStatus.OK, "요청 처리 성공");

		private final HttpStatus httpStatus;
		private final String message;
	}
}
