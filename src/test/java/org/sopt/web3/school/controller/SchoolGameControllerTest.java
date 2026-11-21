package org.sopt.web3.school.controller;

import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.sopt.web3.global.exception.GlobalExceptionHandler;
import org.sopt.web3.school.domain.Topic;
import org.sopt.web3.school.repository.TopicRepository;
import org.sopt.web3.school.service.SchoolGameService;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

class SchoolGameControllerTest {

	private final TopicRepository repository = mock(TopicRepository.class);
	private final MockMvc mockMvc = MockMvcBuilders
		.standaloneSetup(new SchoolGameController(new SchoolGameService(repository)))
		.setControllerAdvice(new GlobalExceptionHandler())
		.build();

	@Test
	void 놀이_목록과_안내를_반환한다() throws Exception {
		Topic topic = mock(Topic.class);
		when(topic.getId()).thenReturn(1L);
		when(topic.getName()).thenReturn("문장 완성하기");
		when(topic.getRules()).thenReturn("빈칸에 어울리는 표현을 골라요.");
		when(repository.findAllByOrderByIdAsc()).thenReturn(List.of(topic));

		mockMvc.perform(get("/school/games"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.success").value(true))
			.andExpect(jsonPath("$.code").value("200"))
			.andExpect(jsonPath("$.data.games[0].gameId").value(1))
			.andExpect(jsonPath("$.data.games[0].name").value("문장 완성하기"))
			.andExpect(jsonPath("$.data.games[0].rules").value("빈칸에 어울리는 표현을 골라요."))
			.andExpect(jsonPath("$.data.games[0].example").doesNotHaveJsonPath());
	}

	@Test
	void 등록된_놀이가_없으면_빈_목록을_반환한다() throws Exception {
		when(repository.findAllByOrderByIdAsc()).thenReturn(List.of());

		mockMvc.perform(get("/school/games"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.data.games").isEmpty());
	}

	@Test
	void 조회_실패는_공통_서버_오류로_응답한다() throws Exception {
		when(repository.findAllByOrderByIdAsc()).thenThrow(new IllegalStateException("조회 실패"));

		mockMvc.perform(get("/school/games"))
			.andExpect(status().isInternalServerError())
			.andExpect(jsonPath("$.success").value(false))
			.andExpect(jsonPath("$.code").value("500"))
			.andExpect(jsonPath("$.message").value("서버 내부 오류입니다."))
			.andExpect(jsonPath("$.data").isEmpty());
	}
}
