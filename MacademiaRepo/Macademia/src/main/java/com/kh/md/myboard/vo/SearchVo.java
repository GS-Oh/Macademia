package com.kh.md.myboard.vo;

import lombok.Data;

@Data
public class SearchVo {
	private Integer categoryNo = 1;
	private Integer page;
	private String memberNo;
	private String title;
}
