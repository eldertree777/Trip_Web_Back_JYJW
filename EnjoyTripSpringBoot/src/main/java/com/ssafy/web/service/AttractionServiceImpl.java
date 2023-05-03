package com.ssafy.web.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import com.ssafy.web.dto.AttractionDto;
import com.ssafy.web.repository.AttractionMapper;

@Service
public class AttractionServiceImpl implements AttractionService{
	
	private AttractionMapper attractionMapper;

	@Autowired
	public AttractionServiceImpl(AttractionMapper attractionMapper) {
		super();
		this.attractionMapper = attractionMapper;
	}

	@Override
	public List<AttractionDto> listAttraction() throws SQLException {
		return attractionMapper.listAttraction();
	}

	@Override
	public List<AttractionDto> listAttractionSearch(int areaCode,int contentTypeId,String keyword) throws SQLException {
		//areaCode=5&contentTypeId=28&keyword=산
		Map<String, Object> map = new HashMap<String, Object>();
		// put
		map.put("sido_code", areaCode);
		map.put("content_type_id", contentTypeId);
		map.put("keyword", keyword);
		
		return attractionMapper.listAttractionSearch(map);
	}

	@Override
	public void updateRead_count(AttractionDto dto) throws SQLException {
		attractionMapper.updateRead_count(dto.getContent_id());
	}

}
