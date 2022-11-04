package com.kh.md.payroll.service;

import java.util.List;
import java.util.Map;

import com.kh.md.payroll.vo.PayrollOptionMemberVo;
import com.kh.md.payroll.vo.PayrollVo;
import com.kh.md.payroll.vo.SoChangeVo;
import com.kh.md.payroll.vo.StandOrderVo;

public interface PayrollService {

	
	//급여대장 ( 검색 ( 옵션에 따른 작성대상 멤버 리스트 가져오기 )
	List<PayrollOptionMemberVo> selectPayrollOptionMember(PayrollVo prVo);
	
	//급여대장 ( 검색 ( 옵션에 따른 급여대장 리스트 가져오기 )
	List<PayrollVo> selectPayrollOption(PayrollVo prVo);
	
	//급여대장 ( 작성하기 )
	int insertSalaryBook(PayrollVo prVo);
	
	//급여지급내역 ( 메인 화면 )
	List<PayrollVo> selectPayRollList(PayrollVo prVo);

	//지급계좌관리 ( 자동이체 정보 조회 )
	StandOrderVo selectStandingOrderByNo(String no);
	
	//지급 계좌 등록 ( 메인화면처리 )
	int insertStandingOrderByNo(String no);
	
	//지급 계좌 관리 ( 변경이력추가 )
	int insertChangeHistory(SoChangeVo soChangeVo);

	//지급 계좌 관리 ( 변경이력가져오기 )
	List<SoChangeVo> selectSoChangeHistory(String no);
	
	//급여대장 ( 상태 변경하기 )
	int updateCheckStatus(Map<String, String> checkStatus);
	
	
	
	

}//class
