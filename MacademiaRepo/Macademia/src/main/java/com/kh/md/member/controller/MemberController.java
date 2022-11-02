package com.kh.md.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
	private JavaMailSender mailSender;
	
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
	public String findPwd(String email, String privateEmail, Model model) {
		
		Map<String,String> map = new HashMap<>();
		map.put("email", email);
		map.put("privateEmail", privateEmail);
		
		String newPwd = memberService.findPwd(map);
		
		if(newPwd != null) {
			try {
				MimeMessage mimeMessage = mailSender.createMimeMessage();
			    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	 
			    messageHelper.setFrom("mdFindPwd@gmail.com"); 
			    messageHelper.setTo(privateEmail); 
			    messageHelper.setSubject("임시비밀번호가 발급되었습니다"); 
			    messageHelper.setText("임시비밀번호 : "+newPwd); 
	 
			    mailSender.send(mimeMessage);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("alertMsg","임시비밀번호 발송완료.");
			return "member/login";
		}else {
			model.addAttribute("alertMsg","사내/개인이메일을 다시 확인해주세요.");
			return "member/findpwd";
		}

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


	@GetMapping("/member/myboards")
	public String myBoards() {
		return "member/myboards";
	}
}
