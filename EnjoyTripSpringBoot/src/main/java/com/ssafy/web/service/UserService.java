package com.ssafy.web.service;

import java.sql.SQLException;

import com.ssafy.web.dto.UserDto;

public interface UserService {
	int idCheck(String userId) throws SQLException;
	int joinMember(UserDto userDto) throws SQLException;
	UserDto loginUser(String userId, String userPwd) throws SQLException;
	int update(String userId, String userPwd) throws SQLException;
	int delete(String userId) throws SQLException;
}