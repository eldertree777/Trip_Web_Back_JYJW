package com.ssafy.web.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.web.dto.BoardDto;
import com.ssafy.web.util.DBUtil;
import com.ssafy.web.util.quickSort;

@Repository("BoardRepositoryImpl")
public class BoardRepositoryImpl implements BoardRepository {
	@Autowired
	SqlSession session;
	String ns = "com.ssafy.web.repository.BoardRepository.";

	@Override
	public int writeArticle(BoardDto boardDto) throws SQLException {
		return session.insert(ns + "boardInsert", boardDto);
	}

	@Override
	public List<BoardDto> listArticle(Map<String, Object> param) throws SQLException {
		List<BoardDto> list = new ArrayList<>();

		return session.selectList(ns + "selectBoardList", param);
	}
	
	@Override
	public int getTotalArticleCount(Map<String, Object> param) throws SQLException {
		//int cnt = 0;
		
		return session.selectOne(ns + "selectBoardCount", param);
		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn = dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("select count(article_no) \n");
//			sql.append("from board \n");
//			String key = (String) param.get("key");
//			String word = (String) param.get("word");
//			if(!key.isEmpty() && !word.isEmpty()) {
//				if("subject".equals(key)) {
//					sql.append("where subject like concat('%', ?, '%') \n");
//				} else {
//					sql.append("where ").append(key).append(" = ? \n");
//				}
//			}
//			pstmt = conn.prepareStatement(sql.toString());
//			if(!key.isEmpty() && !word.isEmpty())
//				pstmt.setString(1, word);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				cnt = rs.getInt(1);
//			}
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
		//return cnt;
	}

	@Override
	public BoardDto getArticle(int articleNo) throws SQLException {
		return session.selectOne(ns + "selectBoardOne", articleNo);
//		BoardDto boardDto = null;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		try {
//			conn = dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("select article_no, user_id, subject, content, hit, register_time \n");
//			sql.append("from board \n");
//			sql.append("where article_no = ?");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setInt(1, articleNo);
//			rs = pstmt.executeQuery();
//			if(rs.next()) {
//				boardDto = new BoardDto();
//				boardDto.setArticleNo(rs.getInt("article_no"));
//				boardDto.setUserId(rs.getString("user_id"));
//				boardDto.setSubject(rs.getString("subject"));
//				boardDto.setContent(rs.getString("content"));
//				boardDto.setHit(rs.getInt("hit"));
//				boardDto.setRegisterTime(rs.getString("register_time"));
//			}
//		} finally {
//			dbUtil.close(rs, pstmt, conn);
//		}
//		return boardDto;
	}

	@Override
	public void updateHit(int articleNo) throws SQLException {
		session.selectOne(ns + "updateHit", articleNo);
		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("update board \n");
//			sql.append("set hit = hit + 1 \n");
//			sql.append("where article_no = ?");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setInt(1, articleNo);
//			pstmt.executeUpdate();
//		} finally {
//			dbUtil.close(pstmt, conn);
//		}	
	}

	@Override
	public int modifyArticle(BoardDto boardDto) throws SQLException {
		// TODO : 글번호에 해당하는 제목과 내용 변경.
		
		return session.update(ns + "boardUpdate", boardDto);
		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("update board \n");
//			sql.append("set subject = ?, content = ? \n");
//			sql.append("where article_no = ?");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setString(1, boardDto.getSubject());
//			pstmt.setString(2, boardDto.getContent());
//			pstmt.setInt(3, boardDto.getArticleNo());
//			pstmt.executeUpdate();
//		} finally {
//			dbUtil.close(pstmt, conn);
//		}
	}

	@Override
	public int deleteArticle(List<String> articles) throws SQLException {
		// TODO : 글번호에 해당하는 글삭제
		
		return session.delete(ns + "boardDelete", articles);
		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		try {
//			conn = dbUtil.getConnection();
//			StringBuilder sql = new StringBuilder();
//			sql.append("delete from board \n");
//			sql.append("where article_no = ?");
//			pstmt = conn.prepareStatement(sql.toString());
//			pstmt.setInt(1, articleNo);
//			pstmt.executeUpdate();
//		} finally {
//			dbUtil.close(pstmt, conn);
//		}
	}
}