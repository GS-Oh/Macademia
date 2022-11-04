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
	public String workList(Model model, HttpSession session) {
		MemberVo loginMember =(MemberVo) session.getAttribute("loginMember");
		
		
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
	
		List<MemberVo> list = service.getDeptMember(dept);
		System.out.println(list);
		
		return list;
		
	}
	@PostMapping("workWrite")
	@ResponseBody
	public int workWrite(HttpServletRequest req, HttpSession session) {
		String wNo =req.getParameter("wNo");
		String selectWork =req.getParameter("select");
		String title =req.getParameter("title");
		String content =req.getParameter("content");
		String deadLine =req.getParameter("deadLine");
		
		System.out.println(wNo);
		System.out.println(selectWork);
		System.out.println(title);
		System.out.println(content);
		System.out.println(deadLine);
		
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String mNo = loginMember.getNo();
		WorkVo vo = new WorkVo();
		vo.setWSlaveNo(wNo);
		vo.setWBossNo(mNo);
		vo.setWContent(content);
		vo.setWType(selectWork);
		vo.setWTitle(title);
		vo.setWDeadLine(deadLine);
		System.out.println(vo);
		int result = service.workWrite(vo);
		
		
		return result;
		
		
	}
	
}
