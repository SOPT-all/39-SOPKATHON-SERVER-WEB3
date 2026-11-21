package org.sopt.web3.school.dto;

import tools.jackson.core.JsonParser;
import tools.jackson.core.JsonToken;
import tools.jackson.databind.DeserializationContext;
import tools.jackson.databind.ValueDeserializer;

public class JsonIntegerIdDeserializer extends ValueDeserializer<Long> {

	@Override
	public Long deserialize(JsonParser parser, DeserializationContext context) {
		if (!parser.hasToken(JsonToken.VALUE_NUMBER_INT)) {
			return context.reportInputMismatch(Long.class, "ID는 JSON 정수여야 합니다.");
		}
		return parser.getLongValue();
	}
}
