package com.ssafy.web.dto;

import io.swagger.annotations.ApiModel;

@ApiModel
public class AttractionDto {
	int content_id;
	int content_type_id;
	int lat; // y
	int lon; // x
	int read_count;
	int sido_code;
	int gugun_code;
	String title;
	String addr1;
	String addr2;
	String first_img_1;
	String tel;

	@Override
	public String toString() {
		return "AttractionDto [content_id=" + content_id + ", content_type_id=" + content_type_id + ", lat=" + lat
				+ ", lon=" + lon + ", read_count=" + read_count + ", sido_code=" + sido_code + ", gugun_code="
				+ gugun_code + ", title=" + title + ", addr1=" + addr1 + ", addr2=" + addr2 + ", first_img_1="
				+ first_img_1 + ", tel=" + tel + "]";
	}

	public int getContent_id() {
		return content_id;
	}

	public void setContent_id(int content_id) {
		this.content_id = content_id;
	}

	public int getContent_type_id() {
		return content_type_id;
	}

	public void setContent_type_id(int content_type_id) {
		this.content_type_id = content_type_id;
	}

	public int getLat() {
		return lat;
	}

	public void setLat(int lat) {
		this.lat = lat;
	}

	public int getLon() {
		return lon;
	}

	public void setLon(int lon) {
		this.lon = lon;
	}

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}

	public int getSido_code() {
		return sido_code;
	}

	public void setSido_code(int sido_code) {
		this.sido_code = sido_code;
	}

	public int getGugun_code() {
		return gugun_code;
	}

	public void setGugun_code(int gugun_code) {
		this.gugun_code = gugun_code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getFirst_img_1() {
		return first_img_1;
	}

	public void setFirst_img_1(String first_img_1) {
		this.first_img_1 = first_img_1;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

}
