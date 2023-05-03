package com.ssafy.web.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ssafy.web.dto.AttractionDto;

public interface AttractionService {
	List<AttractionDto> listAttraction() throws SQLException;
	void updateRead_count(AttractionDto dto) throws SQLException;
	List<AttractionDto> listAttractionSearch(int areaCode, int contentTypeId, String keyword) throws SQLException;
}
