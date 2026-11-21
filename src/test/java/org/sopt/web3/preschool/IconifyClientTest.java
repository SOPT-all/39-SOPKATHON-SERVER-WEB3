package org.sopt.web3.preschool;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.*;
import static org.springframework.test.web.client.response.MockRestResponseCreators.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.sopt.web3.global.exception.BusinessException;
import org.sopt.web3.preschool.service.IconifyClient;
import org.springframework.http.MediaType;
import org.springframework.test.web.client.MockRestServiceServer;
import org.springframework.web.client.RestClient;

class IconifyClientTest {
	private final RestClient.Builder builder = RestClient.builder().baseUrl("https://api.iconify.design");
	private final MockRestServiceServer server = MockRestServiceServer.bindTo(builder).build();
	private final IconifyClient client = new IconifyClient(builder.build());

	@Test
	void 검색어를_순서대로_시도하고_일치하는_아이콘과_색상을_반환한다() {
		server.expect(requestTo("https://api.iconify.design/search?query=seat&prefix=tabler"))
			.andRespond(withSuccess("{\"icons\":[]}", MediaType.APPLICATION_JSON));
		server.expect(requestTo("https://api.iconify.design/search?query=chair&prefix=tabler"))
			.andRespond(withSuccess("{\"icons\":[\"tabler:chair-off\",\"tabler:chair\"]}", MediaType.APPLICATION_JSON));
		assertEquals("https://api.iconify.design/tabler/chair.svg?color=%23A1CEFE",
			client.findImage(List.of("seat", "chair")).orElseThrow());
		server.verify();
	}

	@Test
	void 외부_API_오류는_검색_결과_없음과_구분한다() {
		server.expect(requestTo("https://api.iconify.design/search?query=chair&prefix=tabler"))
			.andRespond(withServerError());
		assertThrows(BusinessException.class, () -> client.findImage(List.of("chair")));
	}
}
