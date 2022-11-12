package com.kh.md.plan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.plan.service.PlanService;
import com.kh.md.plan.vo.PlanVo;

@Controller
@RequestMapping("plan")
public class PlanController {
	
	@Autowired
	private PlanService service;
	
	@GetMapping("list")
	public String planList(HttpServletRequest req, HttpSession session) {
		MemberVo loginMember= (MemberVo) session.getAttribute("loginMember");
		String no = loginMember.getNo();
		PlanVo vo = new PlanVo();
		
		
		List<PlanVo> planList = service.getPlan(no);
		System.out.println(planList);
		req.setAttribute("planList", planList);
		
		return "/plan/planList";
	}
	@ResponseBody
	@GetMapping("listDetail")
	public PlanVo planDetail(HttpServletRequest req, Model model, PlanVo vo) {
		String pno = req.getParameter("pno");
		
		PlanVo plan = service.getPlanOne(pno);
		
		//model.addAttribute("plan", plan);
		//System.out.println(plan);
		
		
		return plan;
		
	}
	
	@GetMapping("write")
	public String planWrite(HttpSession session , Model model){
		MemberVo loginMember= (MemberVo) session.getAttribute("loginMember");
		model.addAttribute("loginMember",loginMember);
		return "/plan/planWrite";
	}
	@PostMapping("write")
	public String planWrite(HttpServletRequest req, PlanVo vo, HttpSession session) {
		
		MemberVo loginMember= (MemberVo) session.getAttribute("loginMember");
		String no = loginMember.getNo();
		vo.setMNo(no);
		System.out.println(vo);
		int result = service.write(vo);
		if(result == 1) {
			return "redirect:/plan/list";
		}else {
			return "error/errorPage";
		}
		
		
		
		
	}
	@PostMapping("delete")
	@ResponseBody
	public int planDelete(HttpServletRequest req) {
		
		String pno = req.getParameter("pno");
		
		int result = service.planDelete(pno);
		
		return result;
	
		
}
	@GetMapping("modify")
	public String planGetModify(HttpServletRequest req, String no, Model model) {
		PlanVo vo = service.getModify(no);
		model.addAttribute("vo", vo);
		
		
		
		
		return "/plan/planModify";
	}
	@PostMapping("modify/{pno}")
	@ResponseBody
	public int planModify(@PathVariable String pno, PlanVo vo, String title, String content, String type, String start, String end) {
		vo.setPNo(pno);
		vo.setPTitle(title);
		vo.setPContent(content);
		vo.setPStartDate(start);
		vo.setPEndDate(end);
		vo.setPType(type);
		
		System.out.println(vo);
		int result = service.modify(vo);
		System.out.println(result);
		
			return result;
		
		
	}
	
	
}
