package com.kh.md.myboard.vo;

import lombok.Data;

@Data
public class MyboardVo {
	private String no;
	private String categoryNo;
	private String userName;
	private String title;
	private String content;
	private String hit;
	private String regdate;
	private String deleteYn;
}
