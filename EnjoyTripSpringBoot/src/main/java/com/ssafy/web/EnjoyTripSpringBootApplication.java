package com.ssafy.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
//http://localhost:9003/enjoytrip/swagger-ui.html
public class EnjoyTripSpringBootApplication {

	public static void main(String[] args) {
		SpringApplication.run(EnjoyTripSpringBootApplication.class, args);
	}
	
	
	
	@Bean
	public WebMvcConfigurer corsConfigurer() {
		return new WebMvcConfigurer() {
			public void addCorsMappings(CorsRegistry registry) {
			    registry.addMapping("/**")
			      .allowedOrigins("*")
			      .allowedMethods("GET", "POST", "PUT", "DELETE")
			      .allowedHeaders("*")
			      .exposedHeaders("Authorization")
			      .allowCredentials(false)
			      .maxAge(3600);
			  }
		};
	}
	
	

}
