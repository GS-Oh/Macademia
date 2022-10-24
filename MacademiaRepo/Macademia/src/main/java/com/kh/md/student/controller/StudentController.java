package com.kh.md.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("student")
public class StudentController {

	@GetMapping("roll")
	public String roll() {
		return "student/roll";
	}
	
	@GetMapping("roll/detail")
	public String rollDetail() {
		return "student/roll-detail";
	}
	
	@GetMapping("roll/detail/edit")
	public String rollDetailEdit() {
		return "student/roll-detail-edit";
	}
	
	@GetMapping("search")
	public String search() {
		return "student/search";
	}
	
	@GetMapping("search/add")
	public String addStudent() {
		return "student/search-add";
	}
	
	@GetMapping("search/detail")
	public String searchDetail() {
		return "student/search-detail";
	}
	
	@GetMapping("search/detail/edit")
	public String searchDetailEdit() {
		return "student/search-detail-edit";
	}
	
}
