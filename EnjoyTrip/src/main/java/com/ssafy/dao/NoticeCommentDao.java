package com.ssafy.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.dto.NoticeCommentDto;

public interface NoticeCommentDao {

	// 댓글쓰기
	// 대댓글 쓰기
	void writeComment(NoticeCommentDto noticeCommentDto) throws SQLException;

	// 댓글 목록 조회
	List<NoticeCommentDto> listComment() throws SQLException;

	// 댓글 조회
	NoticeCommentDto getComment(int comment_id) throws SQLException;

	// 댓글 수정
	void modifyComment(NoticeCommentDto noticeCommentDto) throws SQLException;

	// 댓글 삭제
	void deleteComment(int comment_id) throws SQLException;
}
