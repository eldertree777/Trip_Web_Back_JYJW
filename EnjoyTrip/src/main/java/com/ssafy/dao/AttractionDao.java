package com.ssafy.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.dto.AttractionDto;

public interface AttractionDao {
	// 글 업로드
	void writeAttraction(AttractionDto attractionDto) throws SQLException;

	// 정보 목록 조회
	List<AttractionDto> listAttraction() throws SQLException;

	// 정보 조회
	AttractionDto getAttraction(int content_id) throws SQLException;

	// 정보 수정
	void modifyAttraction(AttractionDto attractionDto) throws SQLException;

	// 정보 삭제
	void deleteAttraction(int content_id) throws SQLException;
}
