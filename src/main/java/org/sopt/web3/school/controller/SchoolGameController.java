package org.sopt.web3.school.controller;

import org.sopt.web3.global.code.SuccessCode;
import org.sopt.web3.global.response.BaseResponse;
import org.sopt.web3.school.dto.GameListResponse;
import org.sopt.web3.school.service.SchoolGameService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.media.Content;
import io.swagger.v3.oas.annotations.media.Schema;
import io.swagger.v3.oas.annotations.responses.ApiResponse;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/school/games")
@RequiredArgsConstructor
@Tag(name = "초등학생 놀이")
public class SchoolGameController {

	private final SchoolGameService schoolGameService;

	@GetMapping
	@Operation(summary = "놀이 목록 조회", description = "선택한 나이와 관계없이 동일한 놀이 목록을 반환합니다.")
	@ApiResponse(responseCode = "200", description = "조회 성공. 등록된 놀이가 없으면 빈 배열을 반환합니다.",
		useReturnTypeSchema = true)
	@ApiResponse(responseCode = "500", description = "예상하지 못한 서버 오류",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	public ResponseEntity<BaseResponse<GameListResponse>> getGames() {
		return BaseResponse.success(GameSuccessCode.GAMES_RETRIEVED, schoolGameService.getGames());
	}

	@Getter
	@RequiredArgsConstructor
	private enum GameSuccessCode implements SuccessCode {
		GAMES_RETRIEVED(HttpStatus.OK, "요청 처리 성공");

		private final HttpStatus httpStatus;
		private final String message;
	}
}
