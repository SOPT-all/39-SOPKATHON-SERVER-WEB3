package org.sopt.web3.school;

import static org.assertj.core.api.Assertions.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.sopt.web3.support.MySqlTestConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.context.annotation.Import;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import com.jayway.jsonpath.JsonPath;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Import(MySqlTestConfiguration.class)
@DirtiesContext(classMode = DirtiesContext.ClassMode.BEFORE_CLASS)
@Transactional
class SchoolSeedDataIntegrationTest {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	@Autowired
	private MockMvc mockMvc;

	@Test
	void 콘텐츠만_등록하고_사용자_1의_풀이_이력은_만들지_않는다() {
		assertThat(count("auth")).isEqualTo(1);
		assertThat(count("topic")).isEqualTo(3);
		assertThat(count("question")).isEqualTo(589);
		assertThat(count("choice")).isEqualTo(1178);
		assertThat(count("activity")).isZero();
		assertThat(count("activity_question")).isZero();
		assertThat(count("answer")).isZero();
		assertThat(jdbcTemplate.queryForObject(
			"SELECT COUNT(*) FROM topic WHERE rules IS NULL OR example IS NULL", Integer.class)).isZero();
		assertThat(jdbcTemplate.queryForObject(
			"SELECT description FROM topic WHERE id = 1", String.class))
			.isEqualTo("빈칸에 어울리는 말을 골라 문장을 완성해요");
	}

	@Test
	void 문제마다_보기_두_개와_정답_하나와_필수_문구가_있다() {
		assertThat(jdbcTemplate.queryForList("""
			SELECT q.id FROM question q
			LEFT JOIN choice c ON c.question_id = q.id
			GROUP BY q.id HAVING COUNT(c.id) <> 2 OR SUM(c.is_correct) <> 1
			""")).isEmpty();
		assertThat(jdbcTemplate.queryForObject("""
			SELECT COUNT(*) FROM question
			WHERE target_age IS NULL OR target_age NOT IN (8, 9, 10)
			   OR TRIM(content) = '' OR TRIM(correct_answer_text) = ''
			""", Integer.class)).isZero();
		assertThat(jdbcTemplate.queryForObject("""
			SELECT COUNT(*) FROM choice WHERE TRIM(content) = '' OR TRIM(feedback) = ''
			""", Integer.class)).isZero();
		assertThat(jdbcTemplate.queryForObject(
			"SELECT correct_answer_text FROM question WHERE id = 1", String.class))
			.isEqualTo("아침에 일어나서 이를 닦아요.");
	}

	@ParameterizedTest
	@CsvSource({"1,8", "1,9", "1,10", "2,8", "2,9", "2,10", "3,8", "3,9", "3,10"})
	void 모든_놀이와_나이에서_답변과_결과를_확인하고_풀이_문제를_제외한다(int gameId, int age) throws Exception {
		int initialCount = jdbcTemplate.queryForObject(
			"SELECT COUNT(*) FROM question WHERE topic_id = ? AND target_age = ?",
			Integer.class, gameId, age);
		assertThat(initialCount).isGreaterThanOrEqualTo(65);
		String started = mockMvc.perform(post("/school/games/{gameId}/rounds", gameId)
				.contentType(MediaType.APPLICATION_JSON).content("{\"age\":" + age + "}"))
			.andExpect(status().isCreated())
			.andExpect(jsonPath("$.data.questions.length()").value(3))
			.andReturn().getResponse().getContentAsString();
		var document = JsonPath.parse(started);
		long roundId = document.read("$.data.roundId", Long.class);
		List<Long> answeredIds = new ArrayList<>();
		List<Long> selectedChoiceIds = new ArrayList<>();
		for (int index = 0; index < 3; index++) {
			long questionId = document.read("$.data.questions[" + index + "].questionId", Long.class);
			boolean correct = index != 1;
			long choiceId = jdbcTemplate.queryForObject(
				"SELECT id FROM choice WHERE question_id = ? AND is_correct = ?", Long.class, questionId, correct);
			answeredIds.add(questionId);
			selectedChoiceIds.add(choiceId);
			mockMvc.perform(post("/school/rounds/{roundId}/answers", roundId)
					.contentType(MediaType.APPLICATION_JSON)
					.content("{\"questionId\":" + questionId + ",\"choiceId\":" + choiceId + "}"))
				.andExpect(status().isOk())
				.andExpect(jsonPath("$.data.correct").value(correct))
				.andExpect(jsonPath("$.data.feedback").isNotEmpty());
		}

		String resultBody = mockMvc.perform(get("/school/rounds/{roundId}/result", roundId))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.success").value(true))
			.andExpect(jsonPath("$.code").value("200"))
			.andExpect(jsonPath("$.data.answeredCount").value(3))
			.andExpect(jsonPath("$.data.correctCount").value(2))
			.andExpect(jsonPath("$.data.reviews.length()").value(3))
			.andReturn().getResponse().getContentAsString();
		var result = JsonPath.parse(resultBody);
		List<Number> reviewedIds = result.read("$.data.reviews[*].questionId");
		assertThat(reviewedIds.stream().map(Number::longValue).toList()).containsExactlyElementsOf(answeredIds);
		for (int index = 0; index < 3; index++) {
			String path = "$.data.reviews[" + index + "]";
			assertThat(result.read(path + ".correct", Boolean.class)).isEqualTo(index != 1);
			assertThat(result.read(path + ".correctAnswer", String.class)).isEqualTo(
				jdbcTemplate.queryForObject("SELECT correct_answer_text FROM question WHERE id = ?",
					String.class, answeredIds.get(index)));
		}
		long wrongChoiceId = selectedChoiceIds.get(1);
		assertThat(result.read("$.data.reviews[1].selectedChoice.choiceId", Long.class)).isEqualTo(wrongChoiceId);
		assertThat(result.read("$.data.reviews[1].selectedChoice.text", String.class)).isEqualTo(
			jdbcTemplate.queryForObject("SELECT content FROM choice WHERE id = ?", String.class, wrongChoiceId));
		assertThat(result.read("$.data.reviews[1].feedback", String.class)).isEqualTo(
			jdbcTemplate.queryForObject("SELECT feedback FROM choice WHERE id = ?", String.class, wrongChoiceId));

		var next = mockMvc.perform(post("/school/games/{gameId}/rounds", gameId)
			.contentType(MediaType.APPLICATION_JSON).content("{\"age\":" + age + "}"));
		if (initialCount - 3 < 3) {
			next.andExpect(status().isConflict())
				.andExpect(jsonPath("$.message").value("놀이를 시작할 수 있는 문제가 부족합니다."));
		} else {
			String nextBody = next.andExpect(status().isCreated()).andReturn().getResponse().getContentAsString();
			List<Number> nextIds = JsonPath.parse(nextBody).read("$.data.questions[*].questionId");
			assertThat(nextIds.stream().map(Number::longValue).toList()).doesNotContainAnyElementsOf(answeredIds);
		}
		assertThat(jdbcTemplate.queryForObject("SELECT COUNT(*) FROM answer", Integer.class)).isEqualTo(3);
	}

	private int count(String table) {
		return jdbcTemplate.queryForObject("SELECT COUNT(*) FROM " + table, Integer.class);
	}
}
