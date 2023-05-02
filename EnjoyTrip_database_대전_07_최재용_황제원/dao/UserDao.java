package com.ssafy.dao;

import java.sql.SQLException;

import com.ssafy.dto.UserDto;

public interface UserDao {
	int idCheck(String userId) throws SQLException;

	// 회원가입
	int joinMember(UserDto userDto) throws SQLException;

	// 로그인
	UserDto loginMember(String userId, String userPwd) throws SQLException;

	// 아이디 수정
	int update(String userId, String userPwd) throws SQLException;

	// 회원 탈퇴
	int delete(String userId) throws SQLException;
}
