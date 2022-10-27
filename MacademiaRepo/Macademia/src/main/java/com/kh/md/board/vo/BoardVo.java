package com.kh.md.board.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class BoardVo {
	public int no;
	public String userNo;
	public String commnetNo;
	public String title;
	public String content;
	public String hit;
	public String regdate;
	public String status;
	public String category;
}