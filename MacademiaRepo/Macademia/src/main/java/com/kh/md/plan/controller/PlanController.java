package com.kh.md.plan.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.md.plan.service.PlanService;
import com.kh.md.plan.vo.PlanVo;

@Controller
@RequestMapping("plan")
public class PlanController {
	
	@Autowired
	private PlanService service;
	
	@GetMapping("list")
	public String planList(HttpServletRequest req) {
		List<PlanVo> planList = service.getPlan();
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
	public String planWrite(){
		
		return "/plan/planWrite";
	}
	@PostMapping("write")
	public String planWrite(HttpServletRequest req, PlanVo vo) {
		String no = "1";
		
		
		
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
		System.out.println(pno);
		int result = service.planDelete(pno);
		
		return result;
	
		
}
	@GetMapping("modify")
	public String planGetModify(HttpServletRequest req, String no, Model model) {
		PlanVo vo = service.getModify(no);
		System.out.println(vo);
		model.addAttribute("vo", vo);
		
		
		
		
		return "/plan/planModify";
	}
	@PostMapping("modify")
	public String planModify(PlanVo vo,String no) {
		vo.setPNo(no);
		
		
		int result = service.modify(vo);
		System.out.println(result);
		
			return "redirect:/plan/list";
		
		
	}
	
	
}