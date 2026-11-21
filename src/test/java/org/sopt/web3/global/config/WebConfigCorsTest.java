package org.sopt.web3.global.config;

import static org.hamcrest.Matchers.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.ValueSource;
import org.sopt.web3.support.MySqlTestConfiguration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.context.annotation.Import;
import org.springframework.http.HttpHeaders;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
@AutoConfigureMockMvc
@ActiveProfiles("test")
@Import(MySqlTestConfiguration.class)
class WebConfigCorsTest {

	@Autowired
	private MockMvc mockMvc;

	@ParameterizedTest
	@ValueSource(strings = {"http://localhost:5173", "https://play-haebom.vercel.app"})
	void 허용한_프론트의_POST_사전_요청을_허용한다(String origin) throws Exception {
		mockMvc.perform(options("/school/rounds/101/answers")
				.header(HttpHeaders.ORIGIN, origin)
				.header(HttpHeaders.ACCESS_CONTROL_REQUEST_METHOD, "POST")
				.header(HttpHeaders.ACCESS_CONTROL_REQUEST_HEADERS, "content-type,authorization"))
			.andExpect(status().isOk())
			.andExpect(header().string(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN, origin))
			.andExpect(header().string(HttpHeaders.ACCESS_CONTROL_ALLOW_METHODS, containsString("POST")))
			.andExpect(header().string(HttpHeaders.ACCESS_CONTROL_ALLOW_HEADERS,
				containsStringIgnoringCase("content-type")))
			.andExpect(header().doesNotExist(HttpHeaders.ACCESS_CONTROL_ALLOW_CREDENTIALS));
	}

	@ParameterizedTest
	@ValueSource(strings = {"http://localhost:5173", "https://play-haebom.vercel.app"})
	void 허용한_프론트의_실제_GET_응답에_허용_주소를_포함한다(String origin) throws Exception {
		mockMvc.perform(get("/school/games").header(HttpHeaders.ORIGIN, origin))
			.andExpect(status().isOk())
			.andExpect(header().string(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN, origin))
			.andExpect(jsonPath("$.success").value(true));
	}

	@ParameterizedTest
	@ValueSource(strings = {"http://localhost:3000", "https://unapproved.example"})
	void 허용하지_않은_주소는_사전_요청과_실제_요청을_거절한다(String origin) throws Exception {
		mockMvc.perform(options("/school/rounds/101/answers")
				.header(HttpHeaders.ORIGIN, origin)
				.header(HttpHeaders.ACCESS_CONTROL_REQUEST_METHOD, "POST"))
			.andExpect(status().isForbidden())
			.andExpect(header().doesNotExist(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN));
		mockMvc.perform(get("/school/games").header(HttpHeaders.ORIGIN, origin))
			.andExpect(status().isForbidden())
			.andExpect(header().doesNotExist(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN));
	}

	@Test
	void 허용하지_않은_메서드의_사전_요청을_거절한다() throws Exception {
		mockMvc.perform(options("/school/rounds/101/answers")
				.header(HttpHeaders.ORIGIN, "https://play-haebom.vercel.app")
				.header(HttpHeaders.ACCESS_CONTROL_REQUEST_METHOD, "DELETE"))
			.andExpect(status().isForbidden())
			.andExpect(header().doesNotExist(HttpHeaders.ACCESS_CONTROL_ALLOW_ORIGIN));
	}
}
