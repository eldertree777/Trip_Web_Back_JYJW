package com.ssafy.web.service;

import java.util.List;
import java.util.Map;

import com.ssafy.web.dto.BoardDto;
import com.ssafy.web.util.PageNavigation;

public interface BoardService {
	int writeArticle(BoardDto boardDto) throws Exception;
	List<BoardDto> listArticle(Map<String, String> map) throws Exception;
	PageNavigation makePageNavigation(Map<String, String> map) throws Exception;
	BoardDto getArticle(int articleNo) throws Exception;
	void updateHit(int articleNo) throws Exception;
	int modifyArticle(BoardDto boardDto) throws Exception;
	int deleteArticle(List<String> articles) throws Exception;	
}