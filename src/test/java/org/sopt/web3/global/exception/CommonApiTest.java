package org.sopt.web3.global.exception;

import static org.assertj.core.api.Assertions.*;
import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import org.slf4j.LoggerFactory;
import org.sopt.web3.global.code.GlobalErrorCode;
import org.sopt.web3.global.code.SuccessCode;
import org.sopt.web3.global.response.BaseResponse;
import org.sopt.web3.global.response.PageResponse;
import org.sopt.web3.support.MySqlTestConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import ch.qos.logback.classic.spi.ILoggingEvent;
import ch.qos.logback.core.read.ListAppender;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;

@SpringBootTest
@AutoConfigureMockMvc
@Import({CommonApiTest.TestConfig.class, MySqlTestConfiguration.class})
@ActiveProfiles("test")
class CommonApiTest {

	@Autowired
	private MockMvc mockMvc;

	@Test
	void 컨트롤러가_공통_성공_응답을_반환한다() throws Exception {
		mockMvc.perform(get("/test/success"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.success").value(true))
			.andExpect(jsonPath("$.code").value("200"))
			.andExpect(jsonPath("$.message").value("테스트 조회 성공"))
			.andExpect(jsonPath("$.data").value("ok"));
	}

	@ParameterizedTest
	@CsvSource({"UNAUTHORIZED,401", "FORBIDDEN,403", "NOT_FOUND,404", "CONFLICT,409", "INTERNAL_SERVER_ERROR,500"})
	void 비즈니스_예외의_상태와_응답_코드를_유지한다(String code, int statusCode) throws Exception {
		mockMvc.perform(get("/test/business").param("code", code))
			.andExpect(status().is(statusCode))
			.andExpect(jsonPath("$.success").value(false))
			.andExpect(jsonPath("$.code").value(String.valueOf(statusCode)))
			.andExpect(jsonPath("$.message").value(GlobalErrorCode.valueOf(code).getMessage()))
			.andExpect(jsonPath("$.data").value(nullValue()));
	}

	@Test
	void 요청_본문_검증_실패는_필드별_메시지를_반환한다() throws Exception {
		mockMvc.perform(post("/test/validation").contentType(MediaType.APPLICATION_JSON).content("{\"name\":\"\"}"))
			.andExpect(status().isBadRequest())
			.andExpect(jsonPath("$.code").value("400"))
			.andExpect(jsonPath("$.data.name").value("이름은 필수입니다."));
	}

	@Test
	void 잘못된_JSON은_파싱_내부_정보를_노출하지_않는다() throws Exception {
		mockMvc.perform(post("/test/validation").contentType(MediaType.APPLICATION_JSON).content("{"))
			.andExpect(status().isBadRequest())
			.andExpect(jsonPath("$.code").value("400"))
			.andExpect(jsonPath("$.message").value("요청 값이 올바르지 않습니다."))
			.andExpect(jsonPath("$.data").value(nullValue()));
	}

	@Test
	void 지원하지_않는_메서드는_405와_Allow_헤더를_유지한다() throws Exception {
		mockMvc.perform(post("/test/success"))
			.andExpect(status().isMethodNotAllowed())
			.andExpect(header().string("Allow", containsString("GET")))
			.andExpect(jsonPath("$.code").value("405"));
	}

	@Test
	void 지원하지_않는_요청_형식은_415로_반환한다() throws Exception {
		mockMvc.perform(post("/test/validation").contentType(MediaType.TEXT_PLAIN).content("text"))
			.andExpect(status().isUnsupportedMediaType())
			.andExpect(jsonPath("$.code").value("415"));
	}

	@Test
	void 존재하지_않는_주소도_공통_응답으로_반환한다() throws Exception {
		mockMvc.perform(get("/missing"))
			.andExpect(status().isNotFound())
			.andExpect(jsonPath("$.code").value("404"))
			.andExpect(jsonPath("$.success").value(false));
	}

	@Test
	void 예상하지_못한_오류는_내부_정보를_숨긴다() throws Exception {
		mockMvc.perform(get("/test/unexpected"))
			.andExpect(status().isInternalServerError())
			.andExpect(jsonPath("$.message").value("서버 내부 오류입니다."))
			.andExpect(jsonPath("$.data").value(nullValue()))
			.andExpect(jsonPath("$.trace").doesNotExist());
	}

	@Test
	void 요청_파라미터_검증_실패도_필드별_메시지를_반환한다() throws Exception {
		mockMvc.perform(get("/test/parameter").param("count", "0"))
			.andExpect(status().isBadRequest())
			.andExpect(jsonPath("$.data.count").value("개수는 1 이상이어야 합니다."));
	}

	@Test
	void 누락된_파라미터와_타입_오류는_400으로_반환한다() throws Exception {
		for (String url : List.of("/test/parameter", "/test/parameter?count=abc")) {
			mockMvc.perform(get(url))
				.andExpect(status().isBadRequest())
				.andExpect(jsonPath("$.code").value("400"));
		}
	}

	@ParameterizedTest
	@CsvSource({"1,1", "2,2"})
	void 페이징_요청과_응답은_1부터_시작한다(String requestedPage, int responsePage) throws Exception {
		mockMvc.perform(get("/test/pages").param("page", requestedPage).param("size", "2"))
			.andExpect(status().isOk())
			.andExpect(jsonPath("$.data.page").value(responsePage))
			.andExpect(jsonPath("$.data.size").value(2));
	}

	@Test
	void 클라이언트_오류는_warn이고_서버_오류만_스택을_기록한다() throws Exception {
		Logger logger = (Logger)LoggerFactory.getLogger(GlobalExceptionHandler.class);
		ListAppender<ILoggingEvent> appender = new ListAppender<>();
		appender.start();
		logger.addAppender(appender);
		try {
			mockMvc.perform(get("/test/business").param("code", "NOT_FOUND"))
				.andExpect(status().isNotFound());
			mockMvc.perform(get("/test/unexpected"))
				.andExpect(status().isInternalServerError());
			assertThat(appender.list).hasSize(2);
			assertThat(appender.list.get(0).getLevel()).isEqualTo(Level.WARN);
			assertThat(appender.list.get(0).getThrowableProxy()).isNull();
			assertThat(appender.list.get(1).getLevel()).isEqualTo(Level.ERROR);
			assertThat(appender.list.get(1).getThrowableProxy()).isNotNull();
		} finally {
			logger.detachAppender(appender);
			appender.stop();
		}
	}

	@TestConfiguration
	static class TestConfig {

		@Bean
		TestController testController() {
			return new TestController();
		}
	}

	@RestController
	@RequestMapping("/test")
	static class TestController {

		@GetMapping("/success")
		ResponseEntity<BaseResponse<String>> success() {
			return BaseResponse.success(TestSuccessCode.TEST_FETCHED, "ok");
		}

		@GetMapping("/business")
		ResponseEntity<BaseResponse<Void>> business(@RequestParam GlobalErrorCode code) {
			throw new BusinessException(code);
		}

		@PostMapping("/validation")
		ResponseEntity<BaseResponse<Void>> validation(@Valid @RequestBody TestRequest request) {
			return BaseResponse.success(TestSuccessCode.TEST_FETCHED);
		}

		@GetMapping("/unexpected")
		ResponseEntity<BaseResponse<Void>> unexpected() {
			throw new IllegalStateException("SQL and internal details must stay private");
		}

		@GetMapping("/parameter")
		ResponseEntity<BaseResponse<Void>> parameter(
			@RequestParam @Min(value = 1, message = "개수는 1 이상이어야 합니다.") int count) {
			return BaseResponse.success(TestSuccessCode.TEST_FETCHED);
		}

		@GetMapping("/pages")
		ResponseEntity<BaseResponse<PageResponse<String>>> pages(Pageable pageable) {
			return BaseResponse.success(TestSuccessCode.TEST_FETCHED,
				PageResponse.from(new PageImpl<>(List.of("item"), pageable, 10)));
		}
	}

	enum TestSuccessCode implements SuccessCode {

		TEST_FETCHED;

		@Override
		public HttpStatus getHttpStatus() {
			return HttpStatus.OK;
		}

		@Override
		public String getMessage() {
			return "테스트 조회 성공";
		}
	}

	record TestRequest(@NotBlank(message = "이름은 필수입니다.") String name) {
	}
}
