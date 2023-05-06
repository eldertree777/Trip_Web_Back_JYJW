package com.ssafy.web.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.ssafy.web.dto.InfoBoardDto;
import com.ssafy.web.repository.BoardRepository;
import com.ssafy.web.repository.InfoBoardRepository;
import com.ssafy.web.util.PageNavigation;
import com.ssafy.web.util.SizeConstant;

@Service("InfoBoardServiceImpl")
public class InfoBoardServiceImpl implements InfoBoardService {
	@Autowired
	@Qualifier("InfoBoardRepositoryImpl")
	InfoBoardRepository repo;

	@Override
	public int writeArticle(InfoBoardDto boardDto) throws SQLException {
		return repo.writeArticle(boardDto);
	}

	@Override
	public List<InfoBoardDto> listArticle(Map<String, String> map) throws SQLException {
		Map<String, Object> param = new HashMap<String, Object>();
		String key = map.get("key");
//		if("userid".equals(key))
//			key = "user_id";
		param.put("key", key.isEmpty() ? "" : key);
		param.put("word", map.get("word").isEmpty() ? "" : map.get("word"));
		int pgno = Integer.parseInt(map.get("pgno"));
		int start = pgno * SizeConstant.LIST_SIZE - SizeConstant.LIST_SIZE;
		param.put("start", start);
		param.put("listsize", SizeConstant.LIST_SIZE);
		
		return repo.listArticle(param);
	}
	
	@Override
	public PageNavigation makePageNavigation(Map<String, String> map) throws SQLException {
		PageNavigation pageNavigation = new PageNavigation();

		int naviSize = SizeConstant.NAVIGATION_SIZE;
		int sizePerPage = SizeConstant.LIST_SIZE;
		int currentPage = Integer.parseInt(map.get("pgno"));

		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		Map<String, Object> param = new HashMap<String, Object>();
		String key = map.get("key");
//		if ("userid".equals(key))
//			key = "user_id";
		param.put("key", key.isEmpty() ? "" : key);
		param.put("word", map.get("word").isEmpty() ? "" : map.get("word"));
		int totalCount = repo.getTotalArticleCount(param);
//		System.out.println(totalCount);
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1;
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize;
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage;
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		
//		System.out.println(pageNavigation);
		
		return pageNavigation;
	}

	@Override
	public InfoBoardDto getArticle(int articleNo) throws SQLException {
		return repo.getArticle(articleNo);
	}

	@Override
	public void updateHit(int articleNo) throws SQLException {
		repo.updateHit(articleNo);
	}

	@Override
	public int modifyArticle(InfoBoardDto boardDto) throws SQLException {
		// TODO : BoardDaoImpl의 modifyArticle 호출
		return repo.modifyArticle(boardDto);
	}

	@Override
	public int deleteArticle(int articleNo) throws SQLException {
		// TODO : BoardDaoImpl의 deleteArticle 호출
		return repo.deleteArticle(articleNo);
	}

}
