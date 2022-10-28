package com.kh.md.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.md.work.vo.WorkVo;

@Controller
@RequestMapping("work")
public class WorkController {
	
	@GetMapping("list")
	public String workList() {
		
		return "/work/workList";
	}
	
	@GetMapping("write")
	public String workWrite() {
		
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
	
	
}
