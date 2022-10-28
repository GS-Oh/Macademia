package com.kh.md.payroll.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.payroll.vo.PayrollVo;

public interface PayrollDao {

	//급여대장 작성 ( 옵션에 따른 급여대장 리스트 가져오기 )
	List<PayrollVo> selectPayrollOption(SqlSessionTemplate sst, PayrollVo prVo);

}//class
