package com.kh.md.board.vo;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVo {
	private int no;
	private String userNo;
	private String categoryNo;
	private String title;
	private String content;
	private String hit;
	private String regdate;
	private String deleteYn;
	private MultipartFile[] file;
	private String thumbnail;
	private String position;
}