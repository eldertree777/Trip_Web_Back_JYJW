package com.ssafy.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.dto.NoticeDto;

public interface NoticeBoardDao {

	// 글쓰기
	void writeNotice(NoticeDto noticeDto) throws SQLException;

	// 글 목록 조회
	List<NoticeDto> listNotice() throws SQLException;

	// 글 조회
	NoticeDto getNotice(int board_id) throws SQLException;

	// 조회수 업데이트
	void updateHit(int board_id) throws SQLException;

	// 게시글 수정
	void modifyNotice(NoticeDto noticeDto) throws SQLException;

	// 게시글 삭제
	void deleteNotice(int board_id) throws SQLException;
}
