package com.kh.md.member.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.md.file.vo.FileVo;
import com.kh.md.member.service.MemberService;
import com.kh.md.member.vo.MemberVo;

@Controller
public class MemberController {
	
	private final MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@GetMapping("/")
	public String login() {
		return "member/login";
	}
	@PostMapping("/member/login")
	public String login(MemberVo vo, HttpSession session,Model model) {
		MemberVo loginMember = memberService.login(vo);
		System.out.println(loginMember);
		if(loginMember!=null) {
			session.setAttribute("loginMember", loginMember);
			return "home";
		}else {
			model.addAttribute("alertMsg","아이디/비밀번호를 다시 확인해주세요.");
			return "member/login";
		}
		
	}
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "member/login";
	}
	@GetMapping("/member/findpwd")
	public String findPwd() {
		return "member/findpwd";
	}
	@PostMapping("/member/findpwd")
	public String findPwd(String Email, String privateEmail, Model model) {
		
		model.addAttribute("alertMsg","임시비밀번호 발송완료.");
		return "member/login";
	}
	
	@GetMapping("/member/insert")
	public String insert() {
		return "member/insert";
	}
	@PostMapping("/member/insert")
	public String insert(MemberVo vo){
		return "member/insert";
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
	public String myFiles(HttpSession session,Model model) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		List<FileVo> fileList = memberService.getPrivatefileList(loginMember.getNo());
		System.out.println(fileList);
		if(fileList!=null) {
			model.addAttribute("fileList", fileList);
		}
		return "member/myfiles";
	}
	@GetMapping("/member/myboards")
	public String myBoards() {
		return "member/myboards";
	}
}
