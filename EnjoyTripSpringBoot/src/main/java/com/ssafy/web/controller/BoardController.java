package com.ssafy.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/enjoytrip")
public class BoardController {

	@GetMapping("/")
	public String index() {
		System.out.println("index");
		return "index";
	}
	
	@GetMapping("/board")
	public String board() {
		System.out.println("board");
		return "board";
	}
}
