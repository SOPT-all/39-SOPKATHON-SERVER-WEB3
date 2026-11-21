package org.sopt.web3.preschool.dto;

import com.fasterxml.jackson.annotation.JsonSetter;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.Nulls;
import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import tools.jackson.core.JsonParser;
import tools.jackson.core.JsonToken;
import tools.jackson.databind.DeserializationContext;
import tools.jackson.databind.ValueDeserializer;
import tools.jackson.databind.annotation.JsonDeserialize;

public class RecommendationRequest {
	@NotNull(message = "나이는 필수입니다.")
	@Min(value = 4, message = "나이는 4~7세여야 합니다.")
	@Max(value = 7, message = "나이는 4~7세여야 합니다.")
	@JsonDeserialize(using = StrictIntegerDeserializer.class)
	@Schema(example = "5") private Integer age;
	@NotBlank(message = "장소명은 필수입니다.") @Schema(example = "병원") private String placeName;
	@JsonDeserialize(using = StrictIntegerDeserializer.class)
	@ValidWaitingMinutes
	@Schema(example = "10", description = "생략하거나 5~30분 중 5분 단위로 입력") private Integer waitingMinutes;

	@JsonCreator
	public RecommendationRequest() {
	}

	public RecommendationRequest(Integer age, String placeName, Integer waitingMinutes) {
		this.age = age;
		this.placeName = placeName;
		this.waitingMinutes = waitingMinutes;
	}

	public Integer age() { return age; }
	public String placeName() { return placeName; }
	public Integer waitingMinutes() { return waitingMinutes; }

	public Integer getAge() { return age; }
	public String getPlaceName() { return placeName; }
	public Integer getWaitingMinutes() { return waitingMinutes; }

	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}

	@JsonSetter(value = "waitingMinutes", nulls = Nulls.FAIL)
	public void setWaitingMinutes(Integer waitingMinutes) {
		this.waitingMinutes = waitingMinutes;
	}
	public static class StrictIntegerDeserializer extends ValueDeserializer<Integer> {
		@Override
		public Integer deserialize(JsonParser parser, DeserializationContext context) {
			if (!parser.hasToken(JsonToken.VALUE_NUMBER_INT)) {
				return context.reportInputMismatch(Integer.class, "정수여야 합니다.");
			}
			return parser.getIntValue();
		}
	}
}
