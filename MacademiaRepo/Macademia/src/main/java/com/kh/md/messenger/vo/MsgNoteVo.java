package com.kh.md.messenger.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MsgNoteVo {

	private String noteNo;
	private String msgNo;
	private String receiveNo;
	private String title;
	private String content;
	private String sendDate;
	private String receiveDate;
	private String fileName;
	private MultipartFile attFile;
	private String checkDelete;
	
	
}//class
