package com.kh.md.sign.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("sign")
public class SignController {

	@GetMapping("list")
	public String signList() {
		
		return "/sign/signList";
		
	}
}
