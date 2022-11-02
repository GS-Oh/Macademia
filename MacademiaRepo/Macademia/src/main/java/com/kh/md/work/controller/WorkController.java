package com.kh.md.work.controller;

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
import com.kh.md.work.service.WorkService;
import com.kh.md.work.vo.WorkVo;

@Controller
@RequestMapping("work")
public class WorkController {
	
	@Autowired
	private WorkService service;
	
	@GetMapping("list")
	public String workList() {
		
		return "/work/workList";
	}
	
	@GetMapping("write")
	public String workWrite(HttpSession session, Model model) {
		
		MemberVo loginMember= (MemberVo) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		System.out.println("로그인한" +loginMember);
		List<MemberVo> memberList = service.getMemberAll();
		System.out.println(memberList);
		model.addAttribute("memberList", memberList);
		
		return "/work/workWrite";
	}
	
	@GetMapping("complate")
	public String workComplate() {
		return "/work/workComplate";
	}
	@GetMapping("detail")
	public String workDetail() {
		return "/work/workDetail";
	}
	
	@PostMapping("write")
	public String workWrite(WorkVo vo) {
			
		return "";
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
	
}
