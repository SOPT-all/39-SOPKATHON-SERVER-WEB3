package org.sopt.web3;

import static org.assertj.core.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.flywaydb.core.Flyway;
import org.junit.jupiter.api.Test;
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
import org.springframework.transaction.annotation.Transactional;

@SpringBootTest
@AutoConfigureMockMvc
@Import(MySqlTestConfiguration.class)
@ActiveProfiles("test")
class Web3ApplicationTest {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private Flyway flyway;

	@Autowired
	private MockMvc mockMvc;

	@Test
	void 놀이_시작_OpenAPI에_나이와_응답_상태가_표시된다() throws Exception {
		String endpoint = "$.paths['/school/games/{gameId}/rounds'].post";
		mockMvc.perform(get("/v3/api-docs"))
			.andExpect(status().isOk())
			.andExpect(jsonPath(endpoint + ".requestBody.content['application/json'].schema['$ref']")
				.value("#/components/schemas/StartRoundRequest"))
			.andExpect(jsonPath("$.components.schemas.StartRoundRequest.properties.age.type").value("integer"))
			.andExpect(jsonPath(endpoint + ".responses['201']").exists())
			.andExpect(jsonPath(endpoint + ".responses['409']").exists());
	}

	@Test
	@Transactional
	@Sql("/db/fixtures/clear-school-answers.sql")
	void 선택한_놀이와_나이의_미풀이_문제_세_개를_회차에_저장한다() throws Exception {
		jdbcTemplate.update("""
			INSERT INTO question (id, topic_id, target_age, content, correct_answer_text) VALUES
			(99, 1, 9, '보기가 하나인 문제', '정답'), (100, 1, 9, '보기가 세 개인 문제', '정답'),
			(101, 1, 9, '이미 답한 문제', '정답'), (102, 1, 8, '다른 나이', '정답'),
			(103, 2, 9, '다른 놀이', '정답'), (104, 1, 9, '첫 번째', '정답'),
			(105, 1, 9, '두 번째', '정답'), (106, 1, 9, '세 번째', '정답')
			""");
		jdbcTemplate.update("""
			INSERT INTO choice (id, question_id, choice_order, content, is_correct, feedback) VALUES
			(991, 99, 1, '보기', TRUE, '설명'),
			(998, 100, 1, '첫째 보기', TRUE, '설명'), (999, 100, 2, '둘째 보기', FALSE, '설명'),
			(1000, 100, 3, '셋째 보기', FALSE, '설명'),
			(1001, 101, 1, '오답', FALSE, '설명'),
			(1011, 101, 2, '정답', TRUE, '설명'),
			(1021, 102, 1, '정답', TRUE, '설명'), (1022, 102, 2, '오답', FALSE, '설명'),
			(1031, 103, 1, '정답', TRUE, '설명'), (1032, 103, 2, '오답', FALSE, '설명'),
			(1042, 104, 2, '둘째 보기', FALSE, '설명'), (1041, 104, 1, '첫째 보기', TRUE, '설명'),
			(1051, 105, 1, '첫째 보기', TRUE, '설명'), (1052, 105, 2, '둘째 보기', FALSE, '설명'),
			(1061, 106, 1, '첫째 보기', TRUE, '설명'), (1062, 106, 2, '둘째 보기', FALSE, '설명')
			""");
		jdbcTemplate.update("""
			INSERT INTO activity (id, auth_id, topic_id, age, status, current_question_number, total_question_count)
			VALUES (100, 1, 1, 9, 'IN_PROGRESS', 1, 3)
			""");
		jdbcTemplate.update("""
			INSERT INTO activity_question (id, activity_id, question_id, question_number) VALUES (100, 100, 101, 1)
			""");
		jdbcTemplate.update("INSERT INTO answer (activity_question_id, choice_id, is_correct) VALUES (100, 1001, FALSE)");

		mockMvc.perform(post("/school/games/1/rounds").contentType(MediaType.APPLICATION_JSON)
				.content("{\"age\":9}"))
			.andExpect(status().isCreated())
			.andExpect(jsonPath("$.code").value("201"))
			.andExpect(jsonPath("$.data.questions.length()").value(3))
			.andExpect(jsonPath("$.data.questions[0].questionId").value(104))
			.andExpect(jsonPath("$.data.questions[1].questionId").value(105))
			.andExpect(jsonPath("$.data.questions[2].questionId").value(106))
			.andExpect(jsonPath("$.data.questions[0].choices[0].choiceId").value(1041))
			.andExpect(jsonPath("$.data.questions[0].choices[0].isCorrect").doesNotExist())
			.andExpect(jsonPath("$.data.questions[0].choices[0].feedback").doesNotExist());

		assertThat(jdbcTemplate.queryForList("""
			SELECT aq.question_id
			FROM activity_question aq JOIN activity a ON a.id = aq.activity_id
			WHERE a.id <> 100 AND a.auth_id = 1 AND a.age = 9 AND a.topic_id = 1
			ORDER BY aq.question_number
			""", Long.class)).containsExactly(104L, 105L, 106L);
	}

	@Test
	@Transactional
	@Sql("/db/fixtures/clear-school-answers.sql")
	void 나이_검증과_놀이_존재_여부와_문제_부족을_응답한다() throws Exception {
		mockMvc.perform(post("/school/games/1/rounds").contentType(MediaType.APPLICATION_JSON)
				.content("{\"age\":11}"))
			.andExpect(status().isBadRequest())
			.andExpect(jsonPath("$.data.age").exists());
		mockMvc.perform(post("/school/games/1/rounds").contentType(MediaType.APPLICATION_JSON)
				.content("{\"age\":9.5}"))
			.andExpect(status().isBadRequest());
		mockMvc.perform(post("/school/games/1/rounds").contentType(MediaType.APPLICATION_JSON)
				.content("{\"age\":\"9\"}"))
			.andExpect(status().isBadRequest());
		mockMvc.perform(post("/school/games/999/rounds").contentType(MediaType.APPLICATION_JSON)
				.content("{\"age\":9}"))
			.andExpect(status().isNotFound());
		mockMvc.perform(post("/school/games/1/rounds").contentType(MediaType.APPLICATION_JSON)
				.content("{\"age\":9}"))
			.andExpect(status().isConflict());
		assertThat(jdbcTemplate.queryForObject("SELECT COUNT(*) FROM activity", Integer.class)).isZero();
	}

	@Test
	void MySQL_연결과_Flyway_마이그레이션이_정상_동작한다() {
		assertThat(jdbcTemplate.queryForObject("SELECT VERSION()", String.class)).startsWith("8.4.");
		assertThat(jdbcTemplate.queryForObject(
			"SELECT COUNT(*) FROM information_schema.tables WHERE table_schema = DATABASE() AND table_name = ?",
			Integer.class, "migration_probe")).isEqualTo(1);
		assertThat(flyway.validateWithResult().validationSuccessful).isTrue();
	}

	@Test
	@Transactional
	void 마이그레이션으로_생성한_테이블에_데이터를_저장하고_조회한다() {
		jdbcTemplate.update("INSERT INTO migration_probe (id, marker) VALUES (?, ?)", 1L, "connected");
		assertThat(jdbcTemplate.queryForObject("SELECT marker FROM migration_probe WHERE id = ?", String.class, 1L))
			.isEqualTo("connected");
	}

	@Test
	void 이미_적용한_마이그레이션은_다시_실행하지_않는다() {
		assertThat(flyway.migrate().migrationsExecuted).isZero();
	}
}
