package com.kh.md.payroll.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.payroll.vo.PayrollVo;

@Repository
public class PayrollDaoImpl implements PayrollDao{
	
	
	
	//급여대장 - 옵션 검색 ( 옵션에 따른 급여대장 리스트 가져오기 )
	@Override
	public List<PayrollVo> selectPayrollOption(SqlSessionTemplate sst, PayrollVo prVo) {
		return sst.selectList("payrollMapper.selectPayrollOption",prVo);
	}

	//급여대장 - 작성 하기
	@Override
	public int insertSalaryBook(SqlSessionTemplate sst, PayrollVo prVo) {
		return sst.insert("payrollMapper.insertSalaryBook", prVo);
	}
	
	//급여지급내역 ( 메인페이지 )
	@Override
	public List<PayrollVo> selectPayRollList(SqlSessionTemplate sst, PayrollVo prVo) {
		return sst.selectList("payrollMapper.selectPayRollList", prVo);
	}

	
	
	
	
	
}//class
