package org.sopt.web3.global.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.web.config.EnableSpringDataWebSupport;
import org.springframework.data.web.config.PageableHandlerMethodArgumentResolverCustomizer;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableSpringDataWebSupport
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
			.allowedOrigins("http://localhost:5173", "https://play-haebom.vercel.app")
			.allowedMethods("GET", "POST", "OPTIONS")
			.allowedHeaders("Content-Type", "Authorization")
			.maxAge(3600);
	}

	@Bean
	public PageableHandlerMethodArgumentResolverCustomizer pageableCustomizer() {
		return resolver -> resolver.setOneIndexedParameters(true);
	}
}
