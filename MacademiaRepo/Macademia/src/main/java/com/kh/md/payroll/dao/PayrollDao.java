package com.kh.md.payroll.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Component;

import com.kh.md.payroll.vo.PayrollVo;

public interface PayrollDao {

	//급여대장 - 옵션 검색 ( 옵션에 따른 급여대장 리스트 가져오기 )
	List<PayrollVo> selectPayrollOption(SqlSessionTemplate sst, PayrollVo prVo);

	//급여대장 - 작성하기
	int insertSalaryBook(SqlSessionTemplate sst, PayrollVo prVo);
	
	//급여지급내역 ( 메인페이지 )
	List<PayrollVo> selectPayRollList(SqlSessionTemplate sst, PayrollVo prVo);

	
}//class
