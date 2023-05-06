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

import com.ssafy.web.dto.InfoBoardDto;
import com.ssafy.web.util.DBUtil;
import com.ssafy.web.util.quickSort;

@Repository("InfoBoardRepositoryImpl")
public class InfoBoardRepositoryImpl implements InfoBoardRepository {
	@Autowired
	SqlSession session;
	String ns = "com.ssafy.web.repository.InfoBoardRepository.";

	@Override
	public int writeArticle(InfoBoardDto boardDto) throws SQLException {
		return session.insert(ns + "boardInsert", boardDto);
	}

	@Override
	public List<InfoBoardDto> listArticle(Map<String, Object> param) throws SQLException {
		List<InfoBoardDto> list = new ArrayList<>();
		
		return session.selectList(ns + "selectBoardList", param);
//		return session.selectList(ns + "selectBoardList");
	}
	
	@Override
	public int getTotalArticleCount(Map<String, Object> param) throws SQLException {
		return session.selectOne(ns + "selectBoardCount", param);
	}

	@Override
	public InfoBoardDto getArticle(int articleNo) throws SQLException {
		return session.selectOne(ns + "selectBoardOne", articleNo);
	}

	@Override
	public void updateHit(int articleNo) throws SQLException {
		session.selectOne(ns + "updateHit", articleNo);
	}

	@Override
	public int modifyArticle(InfoBoardDto boardDto) throws SQLException {
		return session.update(ns + "boardUpdate", boardDto);
	}

	@Override
	public int deleteArticle(int articleNo) throws SQLException {
		return session.delete(ns + "boardDelete", articleNo);
	}
}