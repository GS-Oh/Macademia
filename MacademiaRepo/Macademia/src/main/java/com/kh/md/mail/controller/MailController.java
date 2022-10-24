package com.kh.md.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mail")
public class MailController {
	@GetMapping("main")
	public String mailHome() {
		return "mail/mail";
	}
	@GetMapping("send")
	public String sendMail() {
		return "mail/send";
	}
	@GetMapping("receive")
	public String receiveMail() {
		return "mail/receive";
	}
	@GetMapping("write")
	public String writeMail() {
		return "mail/write";
	}
	@GetMapping("detail")
	public String detailMail() {
		return "mail/detail";
	}
}
