package com.ssafy.web.service;

import com.ssafy.web.dto.MemberDto;

public interface MemberService {

	int idCheck(String userId) throws Exception;
	int joinMember(MemberDto memberDto) throws Exception;
	MemberDto loginMember(String userId, String userPwd) throws Exception;
	int update(String userId, String userPwd) throws Exception;
	int delete(String userId) throws Exception;
}
