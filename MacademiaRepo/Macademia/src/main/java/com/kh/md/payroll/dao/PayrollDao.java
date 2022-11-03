package com.kh.md.payroll.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.kh.md.payroll.vo.PayrollOptionMemberVo;
import com.kh.md.payroll.vo.PayrollVo;
import com.kh.md.payroll.vo.SoChangeVo;
import com.kh.md.payroll.vo.StandOrderVo;

public interface PayrollDao {

	//급여대장 ( 검색 ( 옵션에 따른 작성대상 멤버 리스트 가져오기 )
	List<PayrollOptionMemberVo> selectPayrollOptionMember(SqlSessionTemplate sst, PayrollVo prVo);
	
	//급여대장 - 옵션 검색 ( 옵션에 따른 급여대장 리스트 가져오기 )
	List<PayrollVo> selectPayrollOption(SqlSessionTemplate sst, PayrollVo prVo);

	//급여대장 - 작성하기
	int insertSalaryBook(SqlSessionTemplate sst, PayrollVo prVo);
	
	//급여지급내역 ( 메인페이지 )
	List<PayrollVo> selectPayRollList(SqlSessionTemplate sst, PayrollVo prVo);
	
	//지급계좌관리 ( 자동이체 정보 조회 )
	StandOrderVo selectStandingOrderByNo(SqlSessionTemplate sst, String no);
	
	//지급 계좌 등록 ( 메인화면처리 )
	int insertStandingOrderByNo(SqlSessionTemplate sst, String no);
	
	//지급 계좌 관리 ( 자동이체신청내역 수정 )
	int updateStandingOrderPay(SqlSessionTemplate sst, SoChangeVo soChangeVo);
	
	//지급 계좌 관리 ( 자동이체 변경내역 추가 )
	int insertChangeHistory(SqlSessionTemplate sst, SoChangeVo soChangeVo);

	//지급 계좌 관리 ( 변경이력가져오기 )
	List<SoChangeVo> selectSoChangeHistory(SqlSessionTemplate sst, String no);
	

	
}//class
