package com.kh.md.messenger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("messenger")
public class MessengerController {

	@GetMapping("main")
	public String main() {
		return "messenger/main";
	}
	
	@GetMapping("profile")
	public String profile() {
		return "messenger/profile";
	}
	
	@GetMapping("profile/edit")
	public String profileEdit() {
		return "messenger/profileEdit";
	}
	
	@GetMapping("note")
	public String note() {
		return "messenger/note";
	}
	
	@GetMapping("note/write")
	public String noteWrite() {
		return "messenger/noteWrite";
	}
	
	@GetMapping("note/recipient")
	public String noteRecipient() {
		return "messenger/noteRecipient";
	} 
	
	@GetMapping("fileBox")
	public String fileBox() {
		return "messenger/fileBox";
	}
	
	@GetMapping("notice")
	public String notice() {
		return "messenger/notice";
	}

	@GetMapping("notice/detail")
	public String noticeDetail() {
		return "messenger/noticeDetail";
	}
	
	@GetMapping("notice/edit")
	public String noticeEdit() {
		return "messenger/noticeEdit";
	}
}//class
