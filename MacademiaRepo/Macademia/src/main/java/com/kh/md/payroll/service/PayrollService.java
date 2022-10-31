package com.kh.md.payroll.service;

import java.util.List;

import com.kh.md.payroll.vo.PayrollVo;

public interface PayrollService {

	
	
	
	//급여대장 ( 검색 ( 옵션에 따른 급여대장 리스트 가져오기 )
	List<PayrollVo> selectPayrollOption(PayrollVo prVo);
	
	//급여대장 ( 작성하기 )
	int insertSalaryBook(PayrollVo prVo);
	
	//급여지급내역 ( 메인 화면 )
	List<PayrollVo> selectPayRollList(PayrollVo prVo);
	
	
	

}//class
