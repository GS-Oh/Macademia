package com.kh.md.myboard.vo;

public class SearchVo {
	private Integer page = 1;
	private Integer size = 10;
	private String title;
	
	public int getPage() {
		return this.page <= 1 ? 1 : page;
	}
	
	public int getOffSet() {
		return (this.page-1) * (int)size;
	}
}
