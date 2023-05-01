package com.ssafy.web.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ssafy.web.dto.MemberDto;
import com.ssafy.web.repository.MemberRepository;
import com.ssafy.web.repository.MemberRepositoryImpl;

@Service("MemberServiceImpl")
public class MemberServiceImpl implements MemberService {
	@Autowired
	@Qualifier("MemberRepositoryImpl")
	MemberRepository repo;
	
	@Override
	public int idCheck(String userId) throws SQLException {
		return repo.idCheck(userId);
	}

	@Override
	public int joinMember(MemberDto memberDto) throws SQLException {
		return repo.joinMember(memberDto);
	}

	@Override
	public MemberDto loginMember(String userId, String userPwd) throws SQLException {
		return repo.loginMember(userId, userPwd);
	}

	@Override
	public int update(String userId, String userPwd) throws SQLException {
		return repo.update(userId, userPwd);
	}

	@Override
	public int delete(String userId) throws SQLException {
		return repo.delete(userId);
	}
}
