package com.kh.md.plan.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.md.plan.service.PlanService;
import com.kh.md.plan.vo.PlanVo;

@Controller
@RequestMapping("plan")
public class PlanController {
	
	@Autowired
	private PlanService service;
	
	@GetMapping("list")
	public String planList() {
		
		return "/plan/planList";
	}
	@GetMapping("write")
	public String planWrite(){
		
		return "/plan/planWrite";
	}
	@PostMapping("write")
	public String planWrite(HttpServletRequest req, PlanVo vo) {
		String no = "1";
		vo.setMNo(no);
		int result = service.write(vo);
		if(result == 1) {
			return "redirect:/plat/planList";
		}else {
			return "error/errorPage";
		}
		
		
		
		
	}
}
