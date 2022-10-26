package com.kh.md.academy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("academy")
public class AcademyController {

	@GetMapping("roll")
	public String roll() {
		return "academy/roll";
	}
	
	@GetMapping("roll/detail")
	public String rollDetail() {
		return "academy/roll-detail";
	}
	
	@GetMapping("roll/detail/edit")
	public String rollDetailEdit() {
		return "academy/roll-detail-edit";
	}
	
	@GetMapping("search")
	public String search() {
		return "academy/search";
	}
	
	@GetMapping("search/detail")
	public String searchDetail() {
		return "academy/search-detail";
	}
	
	@GetMapping("search/detail/edit")
	public String searchDetailEdit() {
		return "academy/search-detail-edit";
	}
	
	@GetMapping("add")
	public String addStudent() {
		return "academy/add-student";
	}
	
	@GetMapping("curriculum")
	public String curriculum() {
		return "academy/curriculum";
	}
	
	@GetMapping("addCurr")
	public String addCurriculum() {
		return "academy/add-curriculum";
	}
	
}
