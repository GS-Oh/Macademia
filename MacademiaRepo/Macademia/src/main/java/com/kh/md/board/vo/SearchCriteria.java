package com.kh.md.board.vo;

import lombok.Data;

@Data
public class SearchCriteria {
	private Integer page = 1;
	private Integer size = 10;
	private String title;
	private String writer;
	private String content;
	
	public int getPage() {
		return this.page <= 1 ? 1 : page;
	}
	
	public int getOffSet() {
		return (this.page-1) * (int)size;
	}
}
