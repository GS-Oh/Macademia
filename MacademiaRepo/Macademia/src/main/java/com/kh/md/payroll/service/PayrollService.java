package com.kh.md.payroll.service;

import java.util.List;

import com.kh.md.payroll.vo.PayrollVo;

public interface PayrollService {

	
	
	
	//급여대장 작성 ( 옵션에 따른 급여대장 리스트 가져오기 )
	List<PayrollVo> selectPayrollOption(PayrollVo prVo);
	
	
	

}//class
