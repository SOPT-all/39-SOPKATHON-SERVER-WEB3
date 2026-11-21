package org.sopt.web3.preschool;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.sopt.web3.global.exception.GlobalExceptionHandler;
import org.sopt.web3.preschool.controller.RecommendationController;
import org.sopt.web3.preschool.dto.RecommendationResponse;
import org.sopt.web3.preschool.service.RecommendationService;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

class RecommendationControllerTest {
	private final RecommendationService service = mock(RecommendationService.class);
	private final MockMvc mvc = MockMvcBuilders.standaloneSetup(new RecommendationController(service))
		.setControllerAdvice(new GlobalExceptionHandler()).build();

	@Test
	void 요청과_응답_계약을_따른다() throws Exception {
		when(service.recommend(any())).thenReturn(new RecommendationResponse("병원", List.of(
			new RecommendationResponse.Question("시계", "https://example.com/clock.svg"),
			new RecommendationResponse.Question("의자", "https://example.com/chair.svg"),
			new RecommendationResponse.Question("문", "https://example.com/door.svg"))));
		mvc.perform(post("/preschool/recommendations").contentType(MediaType.APPLICATION_JSON)
			.content("{\"age\":5,\"placeName\":\"병원\",\"waitingMinutes\":10}"))
			.andExpect(status().isOk()).andExpect(jsonPath("$.data.placeName").value("병원"))
			.andExpect(jsonPath("$.data.questions.length()").value(3))
			.andExpect(jsonPath("$.data.questions[0].imageUrl").value("https://example.com/clock.svg"));
	}

	@Test
	void 잘못된_나이와_대기시간을_검증한다() throws Exception {
		mvc.perform(post("/preschool/recommendations").contentType(MediaType.APPLICATION_JSON)
			.content("{\"age\":3,\"placeName\":\"병원\",\"waitingMinutes\":7}"))
			.andExpect(status().isBadRequest()).andExpect(jsonPath("$.data.age").exists())
			.andExpect(jsonPath("$.data.waitingMinutes").exists());
		verifyNoInteractions(service);
	}

	@Test
	void 대기시간_생략은_가능하고_null은_허용하지_않는다() throws Exception {
		when(service.recommend(any())).thenReturn(new RecommendationResponse("병원", List.of()));
		mvc.perform(post("/preschool/recommendations").contentType(MediaType.APPLICATION_JSON)
			.content("{\"age\":5,\"placeName\":\"병원\"}")) .andExpect(status().isOk());
		mvc.perform(post("/preschool/recommendations").contentType(MediaType.APPLICATION_JSON)
			.content("{\"age\":5,\"placeName\":\"병원\",\"waitingMinutes\":null}"))
			.andExpect(status().isBadRequest());
	}
}
