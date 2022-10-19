package com.kh.md.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	@GetMapping("/member/logout")
	public String logout() {
		return "member/login";
	}
	@GetMapping("/member/findpwd")
	public String findPwd() {
		return "member/findpwd";
	}
	@PostMapping("/member/findpwd")
	public String findPwd(String Email, String privateEmail,Model model) {
		
		model.addAttribute("alertMsg","임시비밀번호를 발송하였습니다. 개인이메일을 확인해주세요.");
		return "member/login";
	}
	@GetMapping("/member/mypage")
	public String myPage() {
		return "member/mypage";
	}
	@GetMapping("/member/edit")
	public String edit() {
		return "member/edit";
	}
	@GetMapping("/member/myfiles")
	public String myFiles() {
		return "member/myfiles";
	}
	@GetMapping("/member/myboards")
	public String myBoards() {
		return "member/myboards";
	}
}
