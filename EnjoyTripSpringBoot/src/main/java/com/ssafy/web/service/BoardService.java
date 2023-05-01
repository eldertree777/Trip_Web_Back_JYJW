package com.ssafy.web.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.web.dto.BoardDto;
import com.ssafy.web.util.PageNavigation;

public interface BoardService {
	int writeArticle(BoardDto boardDto) throws SQLException;
	List<BoardDto> listArticle(Map<String, String> map) throws SQLException;
	PageNavigation makePageNavigation(Map<String, String> map) throws SQLException;
	BoardDto getArticle(int articleNo) throws SQLException;
	void updateHit(int articleNo) throws SQLException;
	int modifyArticle(BoardDto boardDto) throws SQLException;
	int deleteArticle(List<String> articles) throws SQLException;	
}