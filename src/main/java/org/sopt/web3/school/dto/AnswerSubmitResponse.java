package org.sopt.web3.school.dto;

import io.swagger.v3.oas.annotations.media.Schema;

public record AnswerSubmitResponse(
	@Schema(description = "서버가 채점한 정답 여부", example = "false", requiredMode = Schema.RequiredMode.REQUIRED)
	boolean correct,
	@Schema(description = "사용자가 선택한 보기", requiredMode = Schema.RequiredMode.REQUIRED)
	SelectedChoice selectedChoice,
	@Schema(description = "알맞은 답 표시 문구", example = "친구가 공을 던져요.", requiredMode = Schema.RequiredMode.REQUIRED)
	String correctAnswer,
	@Schema(description = "선택한 보기에 해당하는 설명", example = "물은 마시고, 공은 던져요.",
		requiredMode = Schema.RequiredMode.REQUIRED)
	String feedback
) {

	public record SelectedChoice(
		@Schema(example = "1002", requiredMode = Schema.RequiredMode.REQUIRED)
		long choiceId,
		@Schema(example = "마셔요", requiredMode = Schema.RequiredMode.REQUIRED)
		String text
	) {
	}
}
