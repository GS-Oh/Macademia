package com.kh.md.payroll.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.md.member.vo.MemberVo;
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
	
	//급여지급내역 ( 메인 화면 )
	@GetMapping("history")
	public String history() {
		return "payroll/history";
	}
	
	// 급여지급내역 ( 메인페이지 화면 )
	@PostMapping("history")
	public String history(PayrollVo prVo, HttpSession session, Model model) {
		
		//현재 로그인 한 멤버의 번호로 급여내역 조회하기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		prVo.setTargetNo(loginMember.getNo());
		
		List<PayrollVo> prVoList = ps.selectPayRollList(prVo);
		
		if(prVoList != null) {
			model.addAttribute("prVoList",prVoList);
			return "payroll/history";
		}else {
			return "";
		}
		
	}
	
	
	// 급여지급내역 ( 상세페이지 화면 )
	@PostMapping("history/detail")
	public String historyDetail(PayrollVo prVo, Model model) {
		System.out.println(prVo);
		model.addAttribute("prVo", prVo);
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
	
	//급여대장 작성 ( 메인화면 )
	@GetMapping("create")
	public String create() {
		return "payroll/create";
	}
	
	//급여대장 작성 ( 선택 옵션에 해당하는 멤버 불러오기 ) 
	@PostMapping("create")
	public String createSelectPart(PayrollVo prVo, String checkType, Model model) {
		
		List<PayrollVo> prVoList = ps.selectPayrollOption(prVo);
		
		if( prVoList != null) {
			model.addAttribute("prVoList", prVoList);
			
			model.addAttribute("yearValue", prVo.getPayDate());
			model.addAttribute("deptValue", prVo.getDeptNo());
			model.addAttribute("rankValue", prVo.getRankNo());
			
			if(checkType == "manage") {
				return "payroll/management";
			}
			
			return "payroll/create";
			
		} else {
			return "";
		}
		
		
	}
	
	//급여대장 작성 ( 작성하기 화면 )
	@GetMapping("create/detail")
	public String createDetail(PayrollVo prVo, Model model) {
		
		model.addAttribute("prVo", prVo);
		return "payroll/createDetail";
	}
	
	
	//급여대장 작성 ( 작성하기 처리 )
	@PostMapping("create/detail")
	public String createDetail(PayrollVo prVo) {
		
		int result = ps.insertSalaryBook(prVo);
		
		if(result == 1) {
			return "redirect:/create/detail";
		}else {
			return "";
		}
		
	}
	
	
	
	
	
}//class
