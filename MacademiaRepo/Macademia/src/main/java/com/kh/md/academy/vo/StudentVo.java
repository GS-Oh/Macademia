package com.kh.md.academy.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class StudentVo {

	private String no;
	private String name;
	private String gender;
	private String phone;
	private String email;
	private String profile;
	private MultipartFile f;
	private String newAddress;
	private String oldAddress;
	private String detailAddress;
	private String birth;
	private String finalDegree;
	private String major;
	private String enrolledClass;
	private String enrolledClassName;
	private String joinDate;
	private String stdComment;
	private String completeDate;
	
}
