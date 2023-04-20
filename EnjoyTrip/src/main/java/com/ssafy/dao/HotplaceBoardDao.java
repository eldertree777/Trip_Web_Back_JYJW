package com.ssafy.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.dto.HotplaceDto;

// HotplaceDto
public interface HotplaceBoardDao {
	// 글쓰기
	void writeHotplace(HotplaceDto hotplaceDto) throws SQLException;

	// 글 목록 조회
	List<HotplaceDto> listHotplace() throws SQLException;

	// 글 조회
	HotplaceDto getHotplace(int hotplace_id) throws SQLException;

	// 조회수 업데이트
	void updateHit(int hotplace_id) throws SQLException;

	// 게시글 수정
	void modifyHotplace(HotplaceDto hotplaceDto) throws SQLException;

	// 게시글 삭제
	void deleteHotplace(int hotplace_id) throws SQLException;
}
