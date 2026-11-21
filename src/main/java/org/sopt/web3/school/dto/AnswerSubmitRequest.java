package org.sopt.web3.school.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import tools.jackson.databind.annotation.JsonDeserialize;

public record AnswerSubmitRequest(
	@JsonDeserialize(using = JsonIntegerIdDeserializer.class)
	@NotNull(message = "문제 ID는 필수입니다.")
	@Schema(description = "회차에 배정된 문제 ID", example = "501", requiredMode = Schema.RequiredMode.REQUIRED)
	Long questionId,
	@JsonDeserialize(using = JsonIntegerIdDeserializer.class)
	@NotNull(message = "보기 ID는 필수입니다.")
	@Schema(description = "선택한 보기 ID", example = "1002", requiredMode = Schema.RequiredMode.REQUIRED)
	Long choiceId
) {
}
