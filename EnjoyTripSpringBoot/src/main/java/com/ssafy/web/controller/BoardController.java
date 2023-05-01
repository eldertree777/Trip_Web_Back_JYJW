package com.ssafy.web.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.web.dto.BoardDto;
import com.ssafy.web.dto.MemberDto;
import com.ssafy.web.service.BoardService;
import com.ssafy.web.util.PageNavigation;

@Controller
public class BoardController {
	
	@Autowired
	@Qualifier("BoardServiceImpl")
	BoardService boardService;
	
	@GetMapping("/")
	public String index() {
		System.out.println("index");
		return "index";  
	}
	
	
//	pgno = ParameterCheck.notNumberToOne(request.getParameter("pgno"));
//	key = ParameterCheck.nullToBlank(request.getParameter("key"));
//	word = ParameterCheck.nullToBlank(request.getParameter("word"));
//	queryStrig = "?pgno=" + pgno + "&key=" + key + "&word=" + URLEncoder.encode(word, "utf-8");
	@GetMapping("/board")
	public ModelAndView board(ModelAndView mv, MemberDto userinfo, String pgno, String key, String word) throws Exception {
		System.out.println("board");
		
		String queryStrig = "?pgno=" + pgno + "&key=" + key + "&word=" + URLEncoder.encode(word, "utf-8");
		
		System.out.println(queryStrig);
		System.out.println(userinfo);
		
		if(userinfo != null) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("pgno", pgno + "");
			map.put("key", key);
			map.put("word", word);

			List<BoardDto> list = boardService.listArticle(map);
			mv.addObject("articles", list);
			
			PageNavigation pageNavigation = boardService.makePageNavigation(map);
			mv.addObject("navigation", pageNavigation);
			
			mv.setViewName("board");
		}else {
			mv.setViewName("index");
		}
//		boardService.
		
		
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
