package com.kh.md.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {

	@GetMapping("main")
	public String adminHome() {
		return "admin/main";
	}
	
	@GetMapping("main2")
	public String adminMain() {
		return "admin";
	}
	
	@GetMapping("settingMemberProfile")
	public String memberProfile(){
		return "admin/settingMemberProfile";
		
	}
}
