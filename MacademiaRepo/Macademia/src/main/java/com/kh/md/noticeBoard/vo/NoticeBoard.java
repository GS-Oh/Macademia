package com.kh.md.noticeBoard.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeBoard {

	private int bNo;
	private String bType;
	private String bTitle;
	private String bContent;
	private int views;
	private Date createDate;
	private Date modifyDate;
	private int status;
	private String pin;
	private String mNo;
	private String mName;
	private String positionName;
	private int replyCount;
	
}
