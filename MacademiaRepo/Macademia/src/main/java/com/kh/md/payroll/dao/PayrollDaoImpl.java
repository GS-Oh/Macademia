package com.kh.md.payroll.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.payroll.vo.PayrollVo;

@Repository
public class PayrollDaoImpl implements PayrollDao{
	
	
	
	//급여대장 작성 ( 옵션에 따른 급여대장 리스트 가져오기 )
	@Override
	public List<PayrollVo> selectPayrollOption(SqlSessionTemplate sst, PayrollVo prVo) {
		return sst.selectList("payrollMapper.selectPayrollOption",prVo);
	}

	
	
	
	
	
}//class
