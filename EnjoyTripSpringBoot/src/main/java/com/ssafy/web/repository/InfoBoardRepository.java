package com.ssafy.web.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.web.dto.InfoBoardDto;

public interface InfoBoardRepository {
	int writeArticle(InfoBoardDto boardDto) throws SQLException;
	List<InfoBoardDto> listArticle(Map<String, Object> param) throws SQLException;
	int getTotalArticleCount(Map<String, Object> param) throws SQLException;
	InfoBoardDto getArticle(int articleNo) throws SQLException;
	void updateHit(int articleNo) throws SQLException;
	int modifyArticle(InfoBoardDto boardDto) throws SQLException;
	int deleteArticle(int articleNo) throws SQLException;
//	int deleteArticle(List<String> articles) throws SQLException;	
}