package com.kh.md.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student")
public class StudentController {

	@GetMapping("roll")
	public String roll() {
		return "student/roll";
	}
	
}
