package com.kh.md.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee")
public class EmployeeController {

	@GetMapping("/myAtdc")
	public String myAtdc() {
		return "/employee/my-atdc";
	}
	
	@GetMapping("/deptAtdc")
	public String deptAtdc() {
		return "/employee/dept-atdc";
	}
	
}
