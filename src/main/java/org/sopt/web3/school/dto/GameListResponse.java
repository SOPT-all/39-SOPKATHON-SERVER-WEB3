package org.sopt.web3.school.dto;

import java.util.List;

import io.swagger.v3.oas.annotations.media.Schema;

public record GameListResponse(
	@Schema(requiredMode = Schema.RequiredMode.REQUIRED)
	List<Game> games
) {

	public record Game(
		@Schema(requiredMode = Schema.RequiredMode.REQUIRED, example = "1")
		long gameId,
		@Schema(requiredMode = Schema.RequiredMode.REQUIRED, example = "문장 완성하기")
		String name,
		@Schema(requiredMode = Schema.RequiredMode.REQUIRED, example = "빈칸에 어울리는 표현을 골라요.")
		String rules,
		@Schema(requiredMode = Schema.RequiredMode.REQUIRED, example = "짝꿍과 책을 읽어요.")
		String example
	) {
	}
}
