package com.ssafy.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.web.dto.MemberDto;
import com.ssafy.web.service.MemberService;

@Controller
@RequestMapping("/user")
public class MemberController {
	
	@Autowired
	@Qualifier("MemberServiceImpl")
	private MemberService memberService;
	
	@PostMapping("/login")
	public ModelAndView login(ModelAndView mv, MemberDto dto, HttpServletResponse response, HttpServletRequest request) {
		System.out.println("login");
		System.out.println(dto);

		// 로그인 처리
		//cookie
//		Cookie cookie = new Cookie("","");
//		cookie.setPath(uri);
//		cookie.setMaxAge(expiry);
//		response.addCookie(cookie);
		
		//session
//		HttpSession session = request.getSession();
//		session.setAttribute(name, value);
		
		mv.setViewName("redirect:/");
		return mv;
	}

	@PostMapping("/join")
	public ModelAndView join(ModelAndView mv, MemberDto dto) throws Exception {
		System.out.println("join");
		System.out.println(dto);

		// 회원가입
		int result = memberService.joinMember(dto);

		mv.setViewName("redirect:/");
		return mv;
	}

	@GetMapping("/logout")
	public ModelAndView logout(ModelAndView mv, HttpServletRequest request) {
		System.out.println("logout");
		
		// 로그아웃 처리
		HttpSession session = request.getSession();
		session.invalidate();
		
		mv.setViewName("redirect:/");
		return mv;
	}

	@GetMapping("/delete")
	public ModelAndView delete(ModelAndView mv, MemberDto dto) {
		System.out.println("delete");
		System.out.println(dto);
		
		// 회원 탈퇴

		mv.setViewName("redirect:/");
		return mv;
	}
	
	@PostMapping("/update")
	public ModelAndView update(ModelAndView mv, MemberDto dto) {
		System.out.println("update");
		System.out.println(dto);
		
		// 회원 수정

		mv.setViewName("redirect:/");
		return mv;
	}
}
