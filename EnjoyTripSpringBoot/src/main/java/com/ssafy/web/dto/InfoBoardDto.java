package com.ssafy.web.dto;

public class InfoBoardDto {
	private int board_id;
	private String user_id;
	private String title;
	private String content;
	private int hit;
	private String registerTime;
	
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	@Override
	public String toString() {
		return "InfoBoardDto [board_id=" + board_id + ", user_id=" + user_id + ", title=" + title + ", content="
				+ content + ", hit=" + hit + ", registerTime=" + registerTime + "]";
	}
}
