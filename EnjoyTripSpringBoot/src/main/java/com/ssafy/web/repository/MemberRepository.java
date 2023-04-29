package com.ssafy.web.repository;

import java.sql.SQLException;

import com.ssafy.web.dto.MemberDto;

public interface MemberRepository {

	int idCheck(String userId) throws SQLException;
	int joinMember(MemberDto memberDto) throws SQLException;
	MemberDto loginMember(String userId, String userPwd) throws SQLException;
	int update(String userId, String userPwd) throws SQLException;
	int delete(String userId) throws SQLException;
}
