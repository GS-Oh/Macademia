package com.kh.md.messenger.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MessengerVo {
	
	private String msgNo;
	private String no;
	private String fileName;
	private MultipartFile profile;
	private String introduce;
	private String enrollDate;
	
	//멤버에있는거
	private String name;
	private String email;
	private String address;
	private String account;
	private String dept;
	private String part;
	private String position;
	
	
}//class
