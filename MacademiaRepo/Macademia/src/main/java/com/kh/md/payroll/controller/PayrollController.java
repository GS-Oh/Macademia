package com.kh.md.payroll.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.md.payroll.service.PayrollService;
import com.kh.md.payroll.vo.PayrollVo;

@Controller
@RequestMapping("payroll")
public class PayrollController {

	private final PayrollService ps;
	
	@Autowired
	public PayrollController(PayrollService ps) {
		this.ps = ps;
	}

	
	
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
	
	//급여대장 작성 ( 화면 )
	@GetMapping("create")
	public String create() {
		return "payroll/create";
	}
	
	//급여대장 작성 ( 선택 옵션에 해당하는 멤버 불러오기 ) 
	@PostMapping("create")
	public String createSelectPart(PayrollVo prVo, HttpSession session) {
		
		List<PayrollVo> prVoList = ps.selectPayrollOption(prVo);
		
		System.out.println(prVo.getPayDate());
		System.out.println(prVo.getDeptNo());
		System.out.println(prVo.getRankNo());
		
		if( prVoList != null) {
			session.setAttribute("prVoList", prVoList);
			return "payroll/create";
			
		} else {
			return "";
		}
		
		
	}
	
	
	@GetMapping("create/detail")
	public String createDetail() {
		return "payroll/createDetail";
	}
	
}//class
