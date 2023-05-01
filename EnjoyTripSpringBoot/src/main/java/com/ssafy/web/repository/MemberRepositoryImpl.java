package com.ssafy.web.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import com.ssafy.web.dto.MemberDto;
import com.ssafy.web.util.DBUtil;

public class MemberRepositoryImpl implements MemberRepository {
	
	@Autowired
	SqlSession session;
	String ns = "com.ssafy.web.repository.";
//	private static MemberRepository memberDao = new MemberRepositoryImpl();
//	private DBUtil dbUtil;

	@Override
	public int idCheck(String userId) throws SQLException {
		//int cnt = 1;
		
		return session.selectOne(ns + "selectMemberOne", userId);
		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn = dbUtil.getConnection();
//			StringBuilder loginMember = new StringBuilder();
//			loginMember.append("select count(user_id) \n");
//			loginMember.append("from members \n");
//			loginMember.append("where user_id = ? ");
//			pstmt = conn.prepareStatement(loginMember.toString());
//			pstmt.setString(1, userId);
//			rs = pstmt.executeQuery();
//			rs.next();
//			cnt = rs.getInt(1);
//			System.out.println(cnt);
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return cnt;
	}

	@Override
	public int joinMember(MemberDto memberDto) throws SQLException {
		return session.insert(ns + "memberInsert", memberDto);
		
//		int cnt = 0;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("insert into members (user_name, user_id, user_password, email_id, email_domain, join_date) \n");
//			sql.append("values (?, ?, ?, ?, ?, now())");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, memberDto.getUserName());
//			pstmt.setString(2, memberDto.getUserId());
//			pstmt.setString(3, memberDto.getUserPwd());
//			pstmt.setString(4, memberDto.getEmailId());
//			pstmt.setString(5, memberDto.getEmailDomain());
//			cnt = pstmt.executeUpdate();
//		} finally {
//			dbUtil.close(pstmt, conn);
//		}
//		return cnt;
	}

	@Override
	public MemberDto loginMember(String userId, String userPwd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("userPwd", userPwd);
		
		return session.selectOne("loginMember", map);
		
//		MemberDto memberDto = null;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn = dbUtil.getConnection();
//			StringBuilder loginMember = new StringBuilder();
//			loginMember.append("select user_id, user_name, user_password \n");
//			loginMember.append("from members \n");
//			loginMember.append("where user_id = ?\n");
//			pstmt = conn.prepareStatement(loginMember.toString());
//			pstmt.setString(1, userId);
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) {
//				memberDto = new MemberDto();
//				memberDto.setUserId(rs.getString("user_id"));
//				memberDto.setUserName(rs.getString("user_name"));
//				memberDto.setUserPwd(rs.getString("user_password"));
//			}
//			
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return memberDto;
	}

	@Override
	public int update(String userId, String userPwd) throws SQLException {
		Map<String, String> map = new HashMap<>();
		map.put("userPwd", userPwd);
		map.put("userId", userId);
		return session.update(ns + "memberUpdate", map);
		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int cnt = 0;
//		try {
//			conn = dbUtil.getConnection();
//			String sql = "update members set user_password=? where user_id=? ;";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, userPwd);
//			pstmt.setString(2, userId);
//			System.out.println(pstmt.toString());
//			cnt = pstmt.executeUpdate();
//			System.out.println(cnt);
//			
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return cnt;
	}
	
	@Override
	public int delete(String userId) throws SQLException {
		return session.delete(ns + "memberDelete", userId);
		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int cnt = 0;
//		try {
//			conn = dbUtil.getConnection();
//			String sql = "delete from members where user_id=? ;";
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, userId);
//			System.out.println(pstmt.toString());
//			cnt = pstmt.executeUpdate();
//			System.out.println(cnt);
//			
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return cnt;
	}

}
