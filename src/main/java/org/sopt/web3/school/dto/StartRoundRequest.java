package org.sopt.web3.school.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import tools.jackson.core.JsonParser;
import tools.jackson.core.JsonToken;
import tools.jackson.databind.DeserializationContext;
import tools.jackson.databind.ValueDeserializer;
import tools.jackson.databind.annotation.JsonDeserialize;

public record StartRoundRequest(
	@Schema(implementation = Integer.class, example = "9", requiredMode = Schema.RequiredMode.REQUIRED)
	@JsonDeserialize(using = StartRoundRequest.AgeDeserializer.class)
	@NotNull(message = "나이는 필수입니다.")
	@Min(value = 8, message = "나이는 8세 이상 10세 이하여야 합니다.")
	@Max(value = 10, message = "나이는 8세 이상 10세 이하여야 합니다.")
	Integer age
) {

	public static class AgeDeserializer extends ValueDeserializer<Integer> {

		@Override
		public Integer deserialize(JsonParser parser, DeserializationContext context) {
			if (!parser.hasToken(JsonToken.VALUE_NUMBER_INT)) {
				return context.reportInputMismatch(Integer.class, "나이는 정수여야 합니다.");
			}
			return parser.getIntValue();
		}
	}
}
