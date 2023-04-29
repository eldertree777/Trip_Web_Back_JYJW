package com.ssafy.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
//@RequestMapping("/enjoytrip")
public class BoardController {

	@GetMapping("/")
	public String index() {
		System.out.println("index");
		return "index";  
	}
	
	@GetMapping("/board")
	public ModelAndView board(ModelAndView mv) {
		System.out.println("board");
		mv.setViewName("board");
		
		return mv;
	}
	
	@GetMapping("/attraction")
	public ModelAndView attraction(ModelAndView mv) {
		System.out.println("attraction");
		mv.setViewName("attraction");
		
		return mv;
	}
	@GetMapping("/plan")
	public ModelAndView plan(ModelAndView mv) {
		System.out.println("plan");
		mv.setViewName("plan");
		
		return mv;
	}
	@GetMapping("/hotplace")
	public ModelAndView hotplace(ModelAndView mv) {
		System.out.println("hotplace");
		mv.setViewName("hotplace");
		
		return mv;
	}
	@GetMapping("/notice")
	public ModelAndView notice(ModelAndView mv) {
		System.out.println("notice");
		mv.setViewName("notice");
		
		return mv;
	}
}
