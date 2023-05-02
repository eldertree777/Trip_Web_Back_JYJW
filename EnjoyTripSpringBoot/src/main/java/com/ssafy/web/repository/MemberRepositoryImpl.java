package com.ssafy.web.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.web.dto.MemberDto;
import com.ssafy.web.util.DBUtil;

@Repository("MemberRepositoryImpl")
public class MemberRepositoryImpl implements MemberRepository {
	
	@Autowired
	SqlSession session;
	
	String ns = "com.ssafy.web.repository.BoardRepository.";
//	private static MemberRepository memberDao = new MemberRepositoryImpl();
//	private DBUtil dbUtil;

	@Override
	public int idCheck(String userId) throws SQLException {
		return session.selectOne(ns + "selectMemberOne", userId);
	}

	@Override
	public int joinMember(MemberDto memberDto) throws SQLException {
		return session.insert(ns + "memberInsert", memberDto);
	}

	@Override
	public MemberDto loginMember(String userId, String userPwd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("userPwd", userPwd);
		
		return session.selectOne("loginMember", map);
	}

	@Override
	public int update(String userId, String userPwd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("userPwd", userPwd);
		map.put("userId", userId);
		return session.update(ns + "memberUpdate", map);
	}
	
	@Override
	public int delete(String userId) throws SQLException {
		return session.delete(ns + "memberDelete", userId);
	}

}
