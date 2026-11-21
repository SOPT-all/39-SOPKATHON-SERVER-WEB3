package org.sopt.web3.school;

import static org.assertj.core.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.sopt.web3.school.dto.AnswerSubmitRequest;
import org.sopt.web3.school.dto.AnswerSubmitResponse;
import org.sopt.web3.school.service.SchoolAnswerService;
import org.sopt.web3.support.MySqlTestConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.support.TransactionTemplate;

import com.jayway.jsonpath.JsonPath;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Import(MySqlTestConfiguration.class)
@Sql("/db/fixtures/school-answers.sql")
@Sql(scripts = "/db/fixtures/clear-school-answers.sql", executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
class SchoolAnswerIntegrationTest {

	private static final String ENDPOINT = "/school/rounds/{roundId}/answers";
	private static final String RESULT_ENDPOINT = "/school/rounds/{roundId}/result";

	@Autowired
	private MockMvc mockMvc;

	@Autowired
	private SchoolAnswerService service;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private PlatformTransactionManager transactionManager;

	@Test
	void 새로_시작한_회차에_답변을_제출하고_결과를_조회한다() throws Exception {
		jdbcTemplate.update("UPDATE question SET target_age = 9 WHERE id IN (501, 502, 503)");
		var started = mockMvc.perform(post("/school/games/1/rounds")
				.contentType(MediaType.APPLICATION_JSON).content("{\"age\":9}"))
			.andExpect(status().isCreated())
			.andReturn();
		long roundId = JsonPath.parse(started.getResponse().getContentAsString()).read("$.data.roundId", Long.class);

		for (String answer : List.of(
			"{\"questionId\":501,\"choiceId\":1001}",
			"{\"questionId\":502,\"choiceId\":1004}",
			"{\"questionId\":503,\"choiceId\":1005}")) {
			mockMvc.perform(post(ENDPOINT, roundId).contentType(MediaType.APPLICATION_JSON).content(answer))
				.andExpect(status().isOk());
		}

		mockMvc.perform(get(RESULT_ENDPOINT, roundId))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.data.answeredCount").value(3))
			.andExpect(jsonPath("$.data.correctCount").value(2))
			.andExpect(jsonPath("$.data.reviews[1].selectedChoice.choiceId").value(1004));

		mockMvc.perform(post("/school/games/1/rounds")
				.contentType(MediaType.APPLICATION_JSON).content("{\"age\":9}"))
			.andExpect(status().isConflict());
	}

	@ParameterizedTest
	@ValueSource(ints = {0, 1, 3})
	void 회차_결과를_출제_순서대로_반환한다(int correctCount) throws Exception {
		service.submitAnswer(101L, new AnswerSubmitRequest(503L, correctCount == 3 ? 1005L : 1006L));
		service.submitAnswer(101L, new AnswerSubmitRequest(502L, correctCount == 3 ? 1003L : 1004L));
		service.submitAnswer(101L, new AnswerSubmitRequest(501L, correctCount > 0 ? 1001L : 1002L));

		var response = mockMvc.perform(get(RESULT_ENDPOINT, 101))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.success").value(true))
			.andExpect(jsonPath("$.code").value("200"))
			.andExpect(jsonPath("$.data.answeredCount").value(3))
			.andExpect(jsonPath("$.data.correctCount").value(correctCount))
			.andExpect(jsonPath("$.data.reviews.length()").value(3))
			.andExpect(jsonPath("$.data.reviews[0].questionId").value(501))
			.andExpect(jsonPath("$.data.reviews[1].questionId").value(502))
			.andExpect(jsonPath("$.data.reviews[2].questionId").value(503))
			.andExpect(jsonPath("$.data.reviews[0].correctAnswer").value("친구가 공을 던져요."));

		if (correctCount == 0) {
			response.andExpect(jsonPath("$.data.reviews[0].selectedChoice.choiceId").value(1002))
				.andExpect(jsonPath("$.data.reviews[0].selectedChoice.text").value("마셔요"))
				.andExpect(jsonPath("$.data.reviews[0].feedback").value("물은 마시고, 공은 던져요."));
		} else {
			response.andExpect(jsonPath("$.data.reviews[0].selectedChoice").doesNotHaveJsonPath())
				.andExpect(jsonPath("$.data.reviews[0].feedback").doesNotHaveJsonPath());
		}
	}

	@Test
	void 결과_조회에_잘못된_회차나_완료되지_않은_회차를_거절한다() throws Exception {
		mockMvc.perform(get(RESULT_ENDPOINT, "abc")).andExpect(status().isBadRequest());
		mockMvc.perform(get(RESULT_ENDPOINT, 999)).andExpect(status().isNotFound());
		mockMvc.perform(get(RESULT_ENDPOINT, 201)).andExpect(status().isNotFound());
		service.submitAnswer(101L, new AnswerSubmitRequest(501L, 1001L));
		mockMvc.perform(get(RESULT_ENDPOINT, 101))
			.andExpect(status().isConflict())
			.andExpect(jsonPath("$.code").value("409"));
	}

	@Test
	void Swagger에_회차_결과_조회가_표시된다() throws Exception {
		String path = "$.paths['/school/rounds/{roundId}/result'].get.responses";
		mockMvc.perform(get("/v3/api-docs"))
			.andExpect(status().isOk())
			.andExpect(jsonPath(path + "['200']").exists())
			.andExpect(jsonPath(path + "['400']").exists())
			.andExpect(jsonPath(path + "['404']").exists())
			.andExpect(jsonPath(path + "['409']").exists())
			.andExpect(jsonPath(path + "['500']").exists())
			.andExpect(jsonPath("$.components.schemas.RoundResultResponse.properties.reviews").exists());
	}

	@Test
	void 오답도_저장하고_선택한_보기의_피드백을_반환한다() throws Exception {
		mockMvc.perform(post(ENDPOINT, 101).contentType(MediaType.APPLICATION_JSON)
				.content("{\"questionId\":501,\"choiceId\":1002}"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.success").value(true))
			.andExpect(jsonPath("$.code").value("200"))
			.andExpect(jsonPath("$.message").value("요청 처리 성공"))
			.andExpect(jsonPath("$.data.correct").value(false))
			.andExpect(jsonPath("$.data.selectedChoice.choiceId").value(1002))
			.andExpect(jsonPath("$.data.selectedChoice.text").value("마셔요"))
			.andExpect(jsonPath("$.data.correctAnswer").value("친구가 공을 던져요."))
			.andExpect(jsonPath("$.data.feedback").value("물은 마시고, 공은 던져요."));
		assertThat(answerCount()).isEqualTo(1);
		assertThat(jdbcTemplate.queryForObject("SELECT is_correct FROM answer", Boolean.class)).isFalse();
	}

	@Test
	void 정답도_저장하고_정답_보기의_피드백을_반환한다() throws Exception {
		mockMvc.perform(post(ENDPOINT, 101).contentType(MediaType.APPLICATION_JSON)
				.content("{\"questionId\":501,\"choiceId\":1001}"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.data.correct").value(true))
			.andExpect(jsonPath("$.data.selectedChoice.text").value("던져요"))
			.andExpect(jsonPath("$.data.feedback").value("공은 던질 수 있어요."));
		assertThat(jdbcTemplate.queryForObject("SELECT is_correct FROM answer", Boolean.class)).isTrue();
	}

	@Test
	void 다른_보기를_재제출해도_최초_결과를_반환하고_중복_저장하지_않는다() {
		AnswerSubmitResponse first = service.submitAnswer(101L, new AnswerSubmitRequest(501L, 1002L));
		assertThat(service.submitAnswer(101L, new AnswerSubmitRequest(501L, 1002L))).isEqualTo(first);
		assertThat(service.submitAnswer(101L, new AnswerSubmitRequest(501L, 1001L))).isEqualTo(first);
		assertThat(answerCount()).isEqualTo(1);
	}

	@Test
	void 동시에_서로_다른_답을_제출해도_처음_저장한_답_하나만_유지한다() throws Exception {
		CountDownLatch ready = new CountDownLatch(2);
		CountDownLatch start = new CountDownLatch(1);
		try (var executor = Executors.newFixedThreadPool(2)) {
			Callable<AnswerSubmitResponse> correct = () -> submitAfterSignal(1001L, ready, start);
			Callable<AnswerSubmitResponse> incorrect = () -> submitAfterSignal(1002L, ready, start);
			var first = executor.submit(correct);
			var second = executor.submit(incorrect);
			try {
				assertThat(ready.await(5, TimeUnit.SECONDS)).isTrue();
			} finally {
				start.countDown();
			}
			assertThat(first.get(10, TimeUnit.SECONDS)).isEqualTo(second.get(10, TimeUnit.SECONDS));
		}
		assertThat(answerCount()).isEqualTo(1);
	}

	@Test
	void 없는_회차와_사용자_1의_회차가_아니면_404를_반환한다() throws Exception {
		for (long roundId : List.of(999L, 201L)) {
			mockMvc.perform(post(ENDPOINT, roundId).contentType(MediaType.APPLICATION_JSON)
					.content("{\"questionId\":501,\"choiceId\":1001}"))
				.andExpect(status().isNotFound())
				.andExpect(jsonPath("$.code").value("404"))
				.andExpect(jsonPath("$.message").value("요청한 리소스가 존재하지 않습니다."))
				.andExpect(jsonPath("$.data").isEmpty());
		}
		assertThat(answerCount()).isZero();
	}

	@Test
	void 배정되지_않은_문제나_다른_문제의_보기는_400이고_저장하지_않는다() throws Exception {
		for (String body : List.of(
			"{\"questionId\":504,\"choiceId\":1001}",
			"{\"questionId\":501,\"choiceId\":1003}",
			"{\"questionId\":501,\"choiceId\":9999}")) {
			mockMvc.perform(post(ENDPOINT, 101).contentType(MediaType.APPLICATION_JSON).content(body))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.success").value(false))
				.andExpect(jsonPath("$.code").value("400"))
				.andExpect(jsonPath("$.message").value("요청 값이 올바르지 않습니다."))
				.andExpect(jsonPath("$.data").isEmpty());
		}
		assertThat(answerCount()).isZero();
	}

	@Test
	void 필수값이_없으면_필드별_검증_오류를_반환한다() throws Exception {
		for (String body : List.of("{}", "{\"questionId\":null,\"choiceId\":null}")) {
			mockMvc.perform(post(ENDPOINT, 101).contentType(MediaType.APPLICATION_JSON).content(body))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.code").value("400"))
				.andExpect(jsonPath("$.data.questionId").value("문제 ID는 필수입니다."))
				.andExpect(jsonPath("$.data.choiceId").value("보기 ID는 필수입니다."));
		}
		assertThat(answerCount()).isZero();
	}

	@ParameterizedTest
	@ValueSource(strings = {
		"{\"questionId\":501.9,\"choiceId\":1002}",
		"{\"questionId\":501,\"choiceId\":1002.9}",
		"{\"questionId\":501.9,\"choiceId\":1002.9}",
		"{\"questionId\":501.0,\"choiceId\":1002}",
		"{\"questionId\":501,\"choiceId\":1.002e3}",
		"{\"questionId\":\"501\",\"choiceId\":1002}",
		"{\"questionId\":501,\"choiceId\":\"1002\"}",
		"{\"questionId\":9223372036854775808,\"choiceId\":1002}"
	})
	void JSON_정수가_아닌_ID는_400이고_답변을_저장하지_않는다(String body) throws Exception {
		mockMvc.perform(post(ENDPOINT, 101).contentType(MediaType.APPLICATION_JSON).content(body))
			.andExpect(status().isBadRequest())
			.andExpect(jsonPath("$.success").value(false))
			.andExpect(jsonPath("$.code").value("400"))
			.andExpect(jsonPath("$.message").value("요청 값이 올바르지 않습니다."))
			.andExpect(jsonPath("$.data").isEmpty());
		assertThat(answerCount()).isZero();
	}

	@Test
	void 잘못된_JSON과_경로_형식은_400과_null_data를_반환한다() throws Exception {
		for (String body : List.of("{", "{\"questionId\":\"abc\",\"choiceId\":1001}", "null")) {
			mockMvc.perform(post(ENDPOINT, 101).contentType(MediaType.APPLICATION_JSON).content(body))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.data").isEmpty());
		}
		mockMvc.perform(post(ENDPOINT, "abc").contentType(MediaType.APPLICATION_JSON)
				.content("{\"questionId\":501,\"choiceId\":1001}"))
			.andExpect(status().isBadRequest())
			.andExpect(jsonPath("$.code").value("400"))
			.andExpect(jsonPath("$.data").isEmpty());
		assertThat(answerCount()).isZero();
	}

	@Test
	void 채점_결과와_관계없이_사용자별_이미_답한_문제를_조회할_수_있다() {
		service.submitAnswer(101L, new AnswerSubmitRequest(501L, 1002L));
		service.submitAnswer(101L, new AnswerSubmitRequest(502L, 1003L));
		List<Long> answered = jdbcTemplate.queryForList("""
			SELECT DISTINCT aq.question_id FROM answer a
			JOIN activity_question aq ON a.activity_question_id = aq.id
			JOIN activity ac ON aq.activity_id = ac.id
			WHERE ac.auth_id = 1 AND ac.topic_id = 1
			ORDER BY aq.question_id
			""", Long.class);
		assertThat(answered).containsExactly(501L, 502L);
		assertThat(jdbcTemplate.queryForList("""
			SELECT q.id FROM question q WHERE q.topic_id = 1 AND NOT EXISTS (
			    SELECT 1 FROM answer a
			    JOIN activity_question aq ON a.activity_question_id = aq.id
			    JOIN activity ac ON aq.activity_id = ac.id
			    WHERE ac.auth_id = 1 AND aq.question_id = q.id
			) ORDER BY q.id
			""", Long.class)).containsExactly(503L, 504L);
	}

	@Test
	void 트랜잭션이_실패하면_답변_저장도_취소된다() {
		TransactionTemplate transaction = new TransactionTemplate(transactionManager);
		assertThatThrownBy(() -> transaction.executeWithoutResult(status -> {
			service.submitAnswer(101L, new AnswerSubmitRequest(501L, 1001L));
			throw new IllegalStateException("후속 작업 실패");
		})).isInstanceOf(IllegalStateException.class);
		assertThat(answerCount()).isZero();
	}

	@Test
	void Swagger에_답변_제출과_응답_필드가_표시된다() throws Exception {
		mockMvc.perform(get("/v3/api-docs"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.paths['/school/rounds/{roundId}/answers'].post.responses['200']").exists())
			.andExpect(jsonPath("$.paths['/school/rounds/{roundId}/answers'].post.responses['400']").exists())
			.andExpect(jsonPath("$.paths['/school/rounds/{roundId}/answers'].post.responses['404']").exists())
			.andExpect(jsonPath("$.components.schemas.AnswerSubmitResponse.properties.correct").exists())
			.andExpect(jsonPath("$.components.schemas.AnswerSubmitResponse.properties.selectedChoice").exists())
			.andExpect(jsonPath("$.components.schemas.AnswerSubmitResponse.properties.correctAnswer").exists())
			.andExpect(jsonPath("$.components.schemas.AnswerSubmitResponse.properties.feedback").exists());
	}

	private AnswerSubmitResponse submitAfterSignal(Long choiceId, CountDownLatch ready, CountDownLatch start)
		throws InterruptedException {
		ready.countDown();
		if (!start.await(5, TimeUnit.SECONDS)) {
			throw new IllegalStateException("동시 요청 시작 시간 초과");
		}
		return service.submitAnswer(101L, new AnswerSubmitRequest(501L, choiceId));
	}

	private int answerCount() {
		return jdbcTemplate.queryForObject("SELECT COUNT(*) FROM answer", Integer.class);
	}
}
