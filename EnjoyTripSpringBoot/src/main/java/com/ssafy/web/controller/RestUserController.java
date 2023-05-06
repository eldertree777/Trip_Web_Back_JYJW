package com.ssafy.web.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.web.dto.UserDto;
import com.ssafy.web.service.UserService;

import io.swagger.annotations.Api;

@RestController
@RequestMapping("/restUser")
@Api(value="User")
public class RestUserController {
	
	@Autowired
	@Qualifier("UserServiceImpl")
	private UserService userService;
	
	//로그인
	@GetMapping("/login")
	public UserDto login(UserDto dto) throws SQLException {
		System.out.println("login");
		System.out.println(dto);

		// 로그인 처리
		UserDto userDto = userService.loginUser(dto.getUserId(), dto.getUserPwd());

		return userDto;
	}
	
	// 가입
	@PostMapping("/join")
	public int join(UserDto dto) throws SQLException {
		System.out.println("join");
		System.out.println(dto);

		// 회원가입
		int result = userService.joinUser(dto);

		return result;
	}
	
	//로그아웃
	
	// 삭제
	@DeleteMapping("/delete")
	public int delete(UserDto dto) throws SQLException {
		System.out.println("delete");
		System.out.println(dto);

		// 회원 탈퇴
		int result = userService.delete(dto.getUserId());
		
		return result;
	}
	
	// 회원정보 갱신
	@PutMapping("/update")
	public int update(UserDto dto) throws SQLException {
		System.out.println("update");
		System.out.println(dto);

		// 회원 수정
		int result = userService.update(dto.getUserId(), dto.getUserPwd());
		System.out.println(result + " " + dto.getUserId() + " " +  dto.getUserPwd());
		
		return result;
	}
}
