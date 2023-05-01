package com.ssafy.web.controller;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
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
	public ModelAndView login(ModelAndView mv, MemberDto dto, HttpServletResponse response, HttpServletRequest request,
			String saveid) throws SQLException {
		System.out.println("login");
		System.out.println(dto);

		// 로그인 처리
		MemberDto memberDto = memberService.loginMember(dto.getUserId(), dto.getUserPwd());

		if (memberDto != null) {
			// session setting
			HttpSession session = request.getSession();
			session.setAttribute("userinfo", memberDto);

			// cookie setting
//			if ("ok".equals(saveid)) { // 아이디 저장을 체크 했다면.
//				Cookie cookie = new Cookie("ssafy_id", dto.getUserId());
//				cookie.setPath(request.getContextPath());
////				크롬의 경우 400일이 최대
////				https://developer.chrome.com/blog/cookie-max-age-expires/
//				cookie.setMaxAge(60 * 60 * 24 * 365 * 40); // 40년간 저장.
//				response.addCookie(cookie);
//			} else { // 아이디 저장을 해제 했다면.
//				Cookie cookies[] = request.getCookies();
//				if (cookies != null) {
//					for (Cookie cookie : cookies) {
//						if ("ssafy_id".equals(cookie.getName())) {
//							cookie.setMaxAge(0);
//							response.addCookie(cookie);
//							break;
//						}
//					}
//				}
//			}
		}
		// cookie

		// session

		mv.setViewName("redirect:/");
		return mv;
	}

	@PostMapping("/join")
	public ModelAndView join(ModelAndView mv, MemberDto dto) throws SQLException {
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
	public ModelAndView delete(ModelAndView mv, MemberDto dto) throws SQLException {
		System.out.println("delete");
		System.out.println(dto);

		// 회원 탈퇴
		memberService.delete(dto.getUserId());
		
		mv.setViewName("redirect:/");
		return mv;
	}

	@PostMapping("/update")
	public ModelAndView update(ModelAndView mv, MemberDto dto) throws SQLException {
		System.out.println("update");
		System.out.println(dto);

		// 회원 수정
		int result = memberService.update(dto.getUserId(), dto.getUserPwd());
		System.out.println(result + " " + dto.getUserId() + " " +  dto.getUserPwd());
		
		mv.setViewName("redirect:/");
		return mv;
	}
}
