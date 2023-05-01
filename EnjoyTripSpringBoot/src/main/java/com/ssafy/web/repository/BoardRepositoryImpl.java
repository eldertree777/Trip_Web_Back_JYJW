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
		
//		return session.selectList(ns + "selectBoardList", param);
		return session.selectList(ns + "selectBoardList");
	}
	
	@Override
	public int getTotalArticleCount(Map<String, Object> param) throws SQLException {
		return session.selectOne(ns + "selectBoardCount", param);
	}

	@Override
	public BoardDto getArticle(int articleNo) throws SQLException {
		return session.selectOne(ns + "selectBoardOne", articleNo);
	}

	@Override
	public void updateHit(int articleNo) throws SQLException {
		session.selectOne(ns + "updateHit", articleNo);
	}

	@Override
	public int modifyArticle(BoardDto boardDto) throws SQLException {
		return session.update(ns + "boardUpdate", boardDto);
	}

	@Override
	public int deleteArticle(List<String> articles) throws SQLException {
		return session.delete(ns + "boardDelete", articles);
	}
}