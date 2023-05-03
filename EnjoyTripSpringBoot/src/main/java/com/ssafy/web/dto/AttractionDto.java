package com.ssafy.web.dto;

import lombok.Data;

@Data
public class AttractionDto {
	int content_id;
	int content_type_id;
	int lat; //y
	int lon; //x
	int read_count;
	String title;
	String addr1;
	String addr2;
	String first_img_1;
	String tel;
}
