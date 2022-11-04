package com.kh.md.file.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileVo {
	
	private String no;
	private String memberNo;
	private String originName;
	private String updateName;
	private String uploadPath;
	private String uploadDate;
	private String updateDate;
	private String deleteYn;
	
	private MultipartFile file;
}

