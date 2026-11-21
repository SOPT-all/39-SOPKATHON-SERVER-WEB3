package org.sopt.web3.school.controller;

import org.sopt.web3.global.code.SuccessCode;
import org.sopt.web3.global.response.BaseResponse;
import org.sopt.web3.school.dto.StartRoundRequest;
import org.sopt.web3.school.dto.StartRoundResponse;
import org.sopt.web3.school.service.SchoolRoundService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@Tag(name = "초등학생 놀이")
public class SchoolRoundController {

	private final SchoolRoundService schoolRoundService;

	@PostMapping("/school/games/{gameId}/rounds")
	@Operation(summary = "놀이 시작", description = "선택한 놀이와 나이에 맞는 미풀이 문제 3개를 배정합니다.")
	@ApiResponse(responseCode = "201", description = "회차 생성 성공", useReturnTypeSchema = true)
	@ApiResponse(responseCode = "400", description = "잘못된 놀이 ID 형식 또는 나이",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "404", description = "존재하지 않는 놀이",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "409", description = "출제할 수 있는 미풀이 문제가 부족함",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "500", description = "예상하지 못한 서버 오류",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	public ResponseEntity<BaseResponse<StartRoundResponse>> startRound(@PathVariable("gameId") long gameId,
		@Valid @RequestBody StartRoundRequest request) {
		return BaseResponse.success(RoundSuccessCode.ROUND_CREATED, schoolRoundService.start(gameId, request.age()));
	}

	@Getter
	@RequiredArgsConstructor
	private enum RoundSuccessCode implements SuccessCode {
		ROUND_CREATED(HttpStatus.CREATED, "놀이를 시작했습니다.");

		private final HttpStatus httpStatus;
		private final String message;
	}
}
