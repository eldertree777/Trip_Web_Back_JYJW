package com.ssafy.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.dto.HotplaceDto;
import com.ssafy.dto.TripBoardDto;

public interface TripBoardDao {
	// 글쓰기
	void writeHotplace(TripBoardDto tripBoardDto) throws SQLException;

	// 글 목록 조회
	List<TripBoardDto> listHotplace() throws SQLException;

	// 글 조회
	TripBoardDto getHotplace(int trip_id) throws SQLException;

	// 조회수 업데이트
	void updateHit(int trip_id) throws SQLException;

	// 게시글 수정
	void modifyHotplace(TripBoardDto tripBoardDto) throws SQLException;

	// 게시글 삭제
	void deleteHotplace(int trip_id) throws SQLException;
}
