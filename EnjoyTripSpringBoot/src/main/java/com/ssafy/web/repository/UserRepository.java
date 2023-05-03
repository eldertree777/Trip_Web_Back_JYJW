package com.ssafy.web.repository;

import java.sql.SQLException;

import com.ssafy.web.dto.UserDto;

public interface UserRepository {
	int idCheck(String userId) throws SQLException;
	int joinMember(UserDto memberDto) throws SQLException;
	UserDto loginMember(String userId, String userPwd) throws SQLException;
	int update(String userId, String userPwd) throws SQLException;
	int delete(String userId) throws SQLException;
	//boolean checkRole(String userId) throws SQLException;
}