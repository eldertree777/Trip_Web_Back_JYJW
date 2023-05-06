package com.ssafy.web.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.web.dto.InfoBoardDto;
import com.ssafy.web.util.PageNavigation;

public interface InfoBoardService {
	int writeArticle(InfoBoardDto boardDto) throws SQLException;
	List<InfoBoardDto> listArticle(Map<String, String> map) throws SQLException;
	PageNavigation makePageNavigation(Map<String, String> map) throws SQLException;
	InfoBoardDto getArticle(int articleNo) throws SQLException;
	void updateHit(int articleNo) throws SQLException;
	int modifyArticle(InfoBoardDto boardDto) throws SQLException;
//	int deleteArticle(List<String> articles) throws SQLException;
	int deleteArticle(int articleNo) throws SQLException;	
}