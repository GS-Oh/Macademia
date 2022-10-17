package com.kh.md.work.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
