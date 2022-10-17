package com.kh.md.payroll.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("payroll")
public class PayrollController {

	
	@GetMapping("main")
	public String main() {
		return "payroll/main";
	}
	
	@GetMapping("history")
	public String history() {
		return "payroll/history";
	}
	
	@GetMapping("history/detail")
	public String historyDetail() {
		return "payroll/historyDetail";
	}
	
	@GetMapping("account")
	public String account() {
		return "payroll/account";
	}
	
	@GetMapping("management")
	public String management() {
		return "payroll/management";
	}
	
	@GetMapping("create")
	public String create() {
		return "payroll/create";
	}
	
	@GetMapping("create/detail")
	public String createDetail() {
		return "payroll/createDetail";
	}
	
}//class
