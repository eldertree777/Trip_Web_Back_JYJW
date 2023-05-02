package com.ssafy.web.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.web.dto.BoardDto;

public interface BoardRepository {

	int writeArticle(BoardDto boardDto) throws SQLException;
	List<BoardDto> listArticle(Map<String, Object> param) throws SQLException;
	int getTotalArticleCount(Map<String, Object> param) throws SQLException;
	BoardDto getArticle(int articleNo) throws SQLException;
	void updateHit(int articleNo) throws SQLException;
	int modifyArticle(BoardDto boardDto) throws SQLException;
	int deleteArticle(int articleNo) throws SQLException;
//	int deleteArticle(List<String> articles) throws SQLException;
	
}

