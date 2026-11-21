package org.sopt.web3.school.controller;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.jupiter.api.Test;
import org.sopt.web3.global.exception.GlobalExceptionHandler;
import org.sopt.web3.school.service.SchoolAnswerService;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

class SchoolAnswerControllerTest {

	@Test
	void 예상하지_못한_오류는_내부_내용을_노출하지_않고_500을_반환한다() throws Exception {
		SchoolAnswerService service = mock(SchoolAnswerService.class);
		when(service.submitAnswer(anyLong(), any())).thenThrow(new IllegalStateException("DB 내부 상세 오류"));
		MockMvc mockMvc = MockMvcBuilders.standaloneSetup(new SchoolAnswerController(service))
			.setControllerAdvice(new GlobalExceptionHandler()).build();

		mockMvc.perform(post("/school/rounds/101/answers").contentType(MediaType.APPLICATION_JSON)
				.content("{\"questionId\":501,\"choiceId\":1001}"))
			.andExpect(status().isInternalServerError())
			.andExpect(jsonPath("$.success").value(false))
			.andExpect(jsonPath("$.code").value("500"))
			.andExpect(jsonPath("$.message").value("서버 내부 오류입니다."))
			.andExpect(jsonPath("$.data").isEmpty());
	}
}
