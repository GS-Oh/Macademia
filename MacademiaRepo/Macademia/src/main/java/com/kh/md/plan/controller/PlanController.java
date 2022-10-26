package com.kh.md.plan.controller;

import java.util.List;

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
	public String planList(HttpServletRequest req) {
		List<PlanVo> planList = service.getPlan();
		req.setAttribute("planList", planList);
		
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
		System.out.println(vo);
		int result = service.write(vo);
		if(result == 1) {
			return "redirect:/plan/list";
		}else {
			return "error/errorPage";
		}
		
		
		
		
	}
}
