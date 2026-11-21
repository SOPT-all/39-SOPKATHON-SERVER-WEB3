package org.sopt.web3.preschool;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.sopt.web3.global.exception.BusinessException;
import org.sopt.web3.preschool.code.PreschoolErrorCode;
import org.sopt.web3.preschool.dto.GeneratedQuestions;
import org.sopt.web3.preschool.dto.RecommendationRequest;
import org.sopt.web3.preschool.dto.RecommendationResponse;
import org.sopt.web3.preschool.service.IconifyClient;
import org.sopt.web3.preschool.service.QuestionGenerator;
import org.sopt.web3.preschool.service.RecommendationService;

class RecommendationServiceTest {
	private final QuestionGenerator generator = mock(QuestionGenerator.class);
	private final IconifyClient icons = mock(IconifyClient.class);
	private final RecommendationService service = new RecommendationService(generator, icons);
	private final RecommendationRequest request = new RecommendationRequest(5, "병원", 10);
	private final GeneratedQuestions.Question chair = question("의자", "chair");
	private final GeneratedQuestions.Question clock = question("시계", "clock");
	private final GeneratedQuestions.Question door = question("문", "door");

	@Test
	void 실패한_아이콘의_질문만_한번_재생성한다() {
		when(generator.generate(request, 3, List.of())).thenReturn(new GeneratedQuestions(true, List.of(chair, clock, door)));
		when(icons.findImage(chair.iconKeywords())).thenReturn(Optional.of("chair.svg"));
		when(icons.findImage(clock.iconKeywords())).thenReturn(Optional.empty());
		when(icons.findImage(door.iconKeywords())).thenReturn(Optional.of("door.svg"));
		GeneratedQuestions.Question window = question("창문", "window");
		when(generator.generate(eq(request), eq(1), anyList())).thenReturn(new GeneratedQuestions(true, List.of(window)));
		when(icons.findImage(window.iconKeywords())).thenReturn(Optional.of("window.svg"));

		RecommendationResponse result = service.recommend(request);
		assertEquals("병원", result.placeName());
		assertEquals(List.of("의자", "창문", "문"), result.questions().stream().map(RecommendationResponse.Question::text).toList());
		verify(generator).generate(eq(request), eq(1), argThat(excluded -> excluded.containsAll(List.of("의자", "시계", "문"))));
	}

	@Test
	void 생성_불가와_형식_오류를_구분한다() {
		when(generator.generate(request, 3, List.of())).thenReturn(new GeneratedQuestions(false, List.of()))
			.thenReturn(new GeneratedQuestions(true, List.of(chair)));
		assertEquals(PreschoolErrorCode.CANNOT_GENERATE,
			assertThrows(BusinessException.class, () -> service.recommend(request)).getErrorCode());
		assertEquals(PreschoolErrorCode.SERVICE_UNAVAILABLE,
			assertThrows(BusinessException.class, () -> service.recommend(request)).getErrorCode());
	}

	@Test
	void 재생성해도_아이콘이_없으면_일시_실패로_응답한다() {
		when(generator.generate(request, 3, List.of())).thenReturn(new GeneratedQuestions(true, List.of(chair, clock, door)));
		when(icons.findImage(anyList())).thenReturn(Optional.empty());
		when(generator.generate(eq(request), eq(1), anyList())).thenReturn(new GeneratedQuestions(true, List.of(clock)));
		assertEquals(PreschoolErrorCode.SERVICE_UNAVAILABLE,
			assertThrows(BusinessException.class, () -> service.recommend(request)).getErrorCode());
		verify(generator, times(1)).generate(eq(request), eq(1), anyList());
	}

	private GeneratedQuestions.Question question(String text, String keyword) {
		return new GeneratedQuestions.Question(text, List.of(keyword));
	}
}
