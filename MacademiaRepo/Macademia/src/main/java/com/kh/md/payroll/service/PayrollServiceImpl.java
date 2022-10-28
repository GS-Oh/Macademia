package com.kh.md.payroll.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.payroll.dao.PayrollDao;
import com.kh.md.payroll.vo.PayrollVo;

@Service
public class PayrollServiceImpl implements PayrollService{

	private final PayrollDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public PayrollServiceImpl(PayrollDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	
	
	
	
	//급여대장 작성 ( 옵션에 따른 급여대장 리스트 가져오기 )
	@Override
	public List<PayrollVo> selectPayrollOption(PayrollVo prVo) {
		return dao.selectPayrollOption(sst, prVo);
	}

	
	
	
	
	
}//class
