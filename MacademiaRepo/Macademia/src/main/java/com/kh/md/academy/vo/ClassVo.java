package com.kh.md.academy.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ClassVo {

	private String no;
	private String categoryNo;
	private String name;
	private String description;
	private String fileName;
	private MultipartFile f;
	private String max;
	private String memberNo;
	private String fee;
	private String classroom;
	private String beginDate;
	private String endDate;
	private String startTime;
	private String finishTime;
	private String enrollDate;
	private String status;
	
}
