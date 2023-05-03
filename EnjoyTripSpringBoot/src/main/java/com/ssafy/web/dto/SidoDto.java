package com.ssafy.web.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class SidoDto {
	
	@JsonProperty("sido_code")
	int sido_code;
	
	@JsonProperty("sido_name")
	String sido_name;
}
