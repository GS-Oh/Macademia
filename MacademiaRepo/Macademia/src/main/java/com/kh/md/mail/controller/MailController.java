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
}
