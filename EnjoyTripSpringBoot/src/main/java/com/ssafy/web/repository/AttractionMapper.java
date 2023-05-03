package com.ssafy.web.repository;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.web.dto.AttractionDto;

@Mapper
public interface AttractionMapper {
	
	List<AttractionDto> listAttraction() throws SQLException;
	List<AttractionDto> listAttractionSearch(Map<String, Object> param) throws SQLException;
	void updateRead_count(int content_id) throws SQLException;
}
