package com.ssafy.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.web.dto.SidoDto;
import com.ssafy.web.service.SidoService;

@RestController
@RequestMapping("/api")
public class RestAttraction {
	
	@Autowired
	SidoService sidoService;
	
	@GetMapping("/sido")
	public List<SidoDto> getsido(){
		return sidoService.getAllSido();
	}
}
