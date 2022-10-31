package com.kh.md.address.vo;

import lombok.Data;

@Data
public class PageInfo {

	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	private int addressLimit;
}
