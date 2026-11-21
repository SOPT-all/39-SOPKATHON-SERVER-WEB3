package org.sopt.web3.preschool.controller;

import org.sopt.web3.global.code.SuccessCode;
import org.sopt.web3.global.response.BaseResponse;
import org.sopt.web3.preschool.dto.RecommendationRequest;
import org.sopt.web3.preschool.dto.RecommendationResponse;
import org.sopt.web3.preschool.service.RecommendationService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
@Tag(name = "유아 놀이")
public class RecommendationController {
	private final RecommendationService service;

	@PostMapping("/preschool/recommendations")
	@Operation(summary = "AI 놀이 추천", description = "이용 조건에 맞는 질문 3개와 SVG 이미지 URL을 반환합니다.")
	@ApiResponse(responseCode = "200", description = "질문 생성 성공", useReturnTypeSchema = true)
	@ApiResponse(responseCode = "400", description = "요청 값 검증 실패",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "422", description = "장소에 맞는 질문 생성 불가",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "503", description = "외부 서비스 일시 실패",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	@ApiResponse(responseCode = "500", description = "서버 내부 오류",
		content = @Content(schema = @Schema(implementation = BaseResponse.class)))
	public ResponseEntity<BaseResponse<RecommendationResponse>> recommend(@Valid @RequestBody RecommendationRequest request) {
		return BaseResponse.success(RecommendationSuccessCode.OK, service.recommend(request));
	}

	@Getter
	@RequiredArgsConstructor
	private enum RecommendationSuccessCode implements SuccessCode {
		OK(HttpStatus.OK, "요청 처리 성공");
		private final HttpStatus httpStatus;
		private final String message;
	}
}
