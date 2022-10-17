package com.kh.md.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.md.member.vo.MemberVo;

@Controller
public class MemberController {
	
	@GetMapping("/")
	public String login() {
		return "member/login";
	}
	@PostMapping("/member/login")
	public String login(MemberVo vo) {
		return "home";
	}
	@GetMapping("/member/mypage")
	public String mypage() {
		return "member/mypage";
	}
	@GetMapping("/member/findpwd")
	public String findPwd() {
		return "member/find-pwd";
	}
}
