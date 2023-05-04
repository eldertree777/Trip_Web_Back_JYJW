package com.ssafy.web.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.web.dto.BoardDto;
import com.ssafy.web.dto.MemberDto;
import com.ssafy.web.service.BoardService;

@RestController
@RequestMapping("/info")
public class RestInfoBoardController {
	@Autowired
	@Qualifier("BoardServiceImpl")
	BoardService boardService;

	@GetMapping("/view")
	public ModelAndView view(ModelAndView mv, int articleno, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println(articleno);

		BoardDto boardDto = boardService.getArticle(articleno);
		boardService.updateHit(articleno);

		System.out.println(boardDto);

		mv.addObject("article", boardDto);
		mv.setViewName("/board/view");
		return mv;
	}

	@GetMapping("/info_write")
	public String info_write() {
		return "board/write";
	}

	@PostMapping("/info_write")
	public ModelAndView info_write(ModelAndView mv, BoardDto boardDto, HttpServletRequest request) throws Exception {
		System.out.println("info_write");
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		boardDto.setUserId(memberDto.getUserId());
		boardService.writeArticle(boardDto);

		mv.setViewName("redirect:/board");
		return mv;
	}

	@GetMapping("/info_modify")
	public ModelAndView info_modify(ModelAndView mv, String articleno, HttpServletRequest request) throws NumberFormatException, SQLException {
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		
		BoardDto boardDto = boardService.getArticle(Integer.parseInt(articleno));
		
		mv.addObject("article", boardDto);
		mv.setViewName("board/modify");
		return mv;
	}
	
	@PostMapping("/info_modify")
	public ModelAndView info_modify(ModelAndView mv, BoardDto boardDto, HttpServletRequest request) throws SQLException {
		System.out.println("info_modify");
		System.out.println(boardDto);
		
		HttpSession session = request.getSession();
		MemberDto memberDto = (MemberDto) session.getAttribute("userinfo");
		boardDto.setUserId(memberDto.getUserId());
		
		boardService.modifyArticle(boardDto);
		mv.setViewName("redirect:/board");
		return mv;
	}
	
	@GetMapping("/info_delete")
	public ModelAndView info_delete(ModelAndView mv, String articleno) throws SQLException {
		List<String> nos = new ArrayList();
		boardService.deleteArticle(Integer.parseInt(articleno));
		mv.setViewName("redirect:/board");
		
		return mv;
	}
	
}
