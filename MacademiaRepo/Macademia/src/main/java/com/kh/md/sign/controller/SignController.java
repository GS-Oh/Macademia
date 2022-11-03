package com.kh.md.sign.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.service.SignService;
import com.kh.md.sign.vo.SignVo;

@Controller
@RequestMapping("sign")
public class SignController {
	
	@Autowired
	private SignService service;

	@GetMapping("list")
	public String signList() {
		
		return "/sign/signList";
		
	}
	@GetMapping("write")
	public String signWrtie(Model model, HttpSession session) {
		MemberVo loginMember= (MemberVo) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		System.out.println("로그인한" +loginMember);
		List<MemberVo> memberList = service.getMemberAll();
		System.out.println(memberList);
		model.addAttribute("memberList", memberList);
		
		return "/sign/write";
	}
	@GetMapping("complateSign")
	public String ComplateSign() {
		
		return "/sign/complateSign";
	}
	@GetMapping("reference")
	public String reference() {
		
		return "/sign/reference";
	}
	@GetMapping("deptList")
	@ResponseBody
	public List<MemberVo> deptList(HttpServletRequest req ) {
		String dept = req.getParameter("dept");
		System.out.println("뎁트코드는" +dept);
		List<MemberVo> list = service.getDeptMember(dept);
		System.out.println(list);
		
		return list;
		
	}
	@PostMapping("signWrite")
	@ResponseBody
	public int signWrite(HttpServletRequest req,HttpSession session) {
		String  title= req.getParameter("title");
		String  type= req.getParameter("type");
		String  content= req.getParameter("content");
		MemberVo loginMember= (MemberVo) session.getAttribute("loginMember");
		String no = loginMember.getNo();
		SignVo vo = new SignVo();
		vo.setSTitle(title);
		vo.setSTypeNo(type);
		vo.setSContent(content);
		vo.setENo(no);
		
		
		int result = service.signWrite(vo);
		
		
		
		return 1;
		
	}
	@PostMapping("signLine")
	@ResponseBody
	public int signLine(HttpServletRequest req, HttpSession session) {
		String[] signLine = req.getParameterValues("line");
		System.out.println("이것은signLine"+signLine);
				
				return 1;
		
		
		
	}
}
