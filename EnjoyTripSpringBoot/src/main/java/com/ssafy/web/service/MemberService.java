package com.ssafy.web.service;

import java.sql.SQLException;

import com.ssafy.web.dto.MemberDto;

public interface MemberService {

	int idCheck(String userId) throws SQLException;
	int joinMember(MemberDto memberDto) throws SQLException;
	MemberDto loginMember(String userId, String userPwd) throws SQLException;
	int update(String userId, String userPwd) throws SQLException;
	int delete(String userId) throws SQLException;
}
