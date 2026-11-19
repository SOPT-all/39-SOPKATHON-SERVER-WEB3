package org.sopt.web3.global.response;

import static org.assertj.core.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

class PageResponseTest {

	@Test
	void 내부_페이지를_1부터_시작하는_페이지로_변환한다() {
		var response = PageResponse.from(new PageImpl<>(List.of("third", "fourth"), PageRequest.of(1, 2), 5));
		assertThat(response.content()).containsExactly("third", "fourth");
		assertThat(response.page()).isEqualTo(2);
		assertThat(response.size()).isEqualTo(2);
		assertThat(response.totalElements()).isEqualTo(5);
		assertThat(response.totalPages()).isEqualTo(3);
		assertThat(response.hasNext()).isTrue();
	}

	@Test
	void 빈_페이지도_1부터_시작한다() {
		var response = PageResponse.from(Page.empty(PageRequest.of(0, 20)));
		assertThat(response.page()).isEqualTo(1);
		assertThat(response.content()).isEmpty();
		assertThat(response.totalElements()).isZero();
		assertThat(response.hasNext()).isFalse();
	}
}
