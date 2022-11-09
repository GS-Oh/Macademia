package com.kh.md.payroll.controller;

import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.payroll.service.PayrollService;
import com.kh.md.payroll.vo.PayrollOptionMemberVo;
import com.kh.md.payroll.vo.PayrollVo;
import com.kh.md.payroll.vo.SoChangeVo;
import com.kh.md.payroll.vo.StandOrderVo;

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
	public String history(PayrollVo prVo, String payDate,HttpSession session, Model model) {
		
		//현재 로그인 한 멤버의 번호로 급여내역 조회하기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		prVo.setTargetNo(loginMember.getNo());
		
		List<PayrollVo> prVoList = ps.selectPayRollList(prVo);
		
		if(prVoList != null) {
			model.addAttribute("payDate", payDate);
			model.addAttribute("prVoList",prVoList);
			return "payroll/history";
		}else {
			return "";
		}
		
	}
	
	
	// 급여지급내역 ( 상세페이지 화면 )
	@PostMapping("history/detail")
	public String historyDetail(PayrollVo prVo, Model model) {
		model.addAttribute("prVo", prVo);
		return "payroll/historyDetail";
	}
	
	//지급 계좌 관리 ( 메인화면 )
	@GetMapping("account")
	public String account(HttpSession session, Model model) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		StandOrderVo soVo = ps.selectStandingOrderByNo(loginMember.getNo());
		List<SoChangeVo> soChangeVoList = ps.selectSoChangeHistory(loginMember.getNo());
		
		model.addAttribute("soChangeVoList",soChangeVoList);
		model.addAttribute("soVo", soVo);
		
		return "payroll/account";
		
	}
	
	//지급 계좌 등록 ( 메인화면처리 )
	@GetMapping("account/enroll")
	public String accountEnroll(HttpSession session, Model model) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		int result = ps.insertStandingOrderByNo(loginMember.getNo());
		
		if(result == 1) {
			return "redirect:/payroll/account";
		}else {
			return "";
		}
	}
	
	
	//지급 계좌 관리 ( 내역변경하기 )
	@PostMapping("account/change")
	@ResponseBody
	public String accountChange(SoChangeVo soChangeVo) {
		
			//신청작업
		int result = ps.insertChangeHistory(soChangeVo);
		
		if( result == 1) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	
	
	
	//급여대장 작성 ( 메인화면 )
	@GetMapping("create")
	public String create(String yearValue, String deptValue, String rankValue, Model model) {
		//검색값유지
		model.addAttribute("yearValue", yearValue);
		model.addAttribute("deptValue", deptValue);
		model.addAttribute("rankValue", rankValue);
		
		return "payroll/create";
	}
	
	
	//급여대장 작성 ( 처리 )
	@PostMapping("create")
	public String createSelectPart(PayrollVo prVo, Model model) {
		
		List<PayrollOptionMemberVo> prMemberList = ps.selectPayrollOptionMember(prVo);
		if( prMemberList != null) {
			model.addAttribute("prMemberList", prMemberList);
			
			//검색값유지
			model.addAttribute("yearValue", prVo.getPayDate());
			model.addAttribute("deptValue", prVo.getDeptNo());
			model.addAttribute("rankValue", prVo.getRankNo());
			
			
			return "payroll/create";
			
			
		} else {
			return "";
		}
		
		
	}
	
	//급여대장 관리 ( 메인화면 ) 
	@GetMapping("management")
	public String management() {
		return "payroll/management";
	}
	
	
	//급여대장 관리 ( 선택 옵션에 해당하는 멤버 불러오기 ) 
	@PostMapping("management" )
	public String management(PayrollVo prVo, Model model) {
		
				
		List<PayrollVo> prVoList = ps.selectPayrollOption(prVo);
		
		if( prVoList != null) {
			model.addAttribute("prVoList", prVoList);
			
			//검색값유지
			model.addAttribute("yearValue", prVo.getPayDate());
			model.addAttribute("deptValue", prVo.getDeptNo());
			model.addAttribute("rankValue", prVo.getRankNo());
			return "payroll/management";
			
			
		} else {
			return "";
		}
		
	}
	
	//급여대장 작성 ( 작성하기 화면 )
	@PostMapping("create/detail")
	public String createDetail(PayrollVo prVo, Model model) {
		
		model.addAttribute("prVo", prVo);
		return "payroll/createDetail";
	}
	
	
	//급여대장 작성 ( 작성하기 처리 )
	@PostMapping("create/detail/write")
	public String createDetail(PayrollVo prVo, HttpSession session) {
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		prVo.setWriterNo(loginMember.getNo());
		
		int result = ps.insertSalaryBook(prVo);
		
		if(result == 1) {
			return "redirect:/payroll/create?yearValue="+ prVo.getPayDate() +"&deptValue=" + prVo.getDeptNo()+"&rankValue=" + prVo.getRankNo();
		}else {
			return "";
		}
		
	}
	
	
	//급여대장 관리 ( 상태 변경하기-ALERT으로 요청 )
	@PostMapping("checkStatus/{checkSt}/{salNo}")
	public String checkStatus( @PathVariable String checkSt, @PathVariable String salNo, String stFormDate ,String stDeptName, Model model) {
		
		
		Map<String, String> checkStatus = new HashMap<String, String>();
		checkStatus.put("checkSt", checkSt);
		checkStatus.put("salNo", salNo);
		
		int result = ps.updateCheckStatus(checkStatus);
		
		if(result == 1) {
			//검색값유지
			model.addAttribute("yearValue", stFormDate);
			model.addAttribute("deptValue", stDeptName);
			return "payroll/management";
		}else{
			return "";
		}
		
	}
	
	
}//class
