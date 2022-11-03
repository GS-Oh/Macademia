package com.kh.md.payroll.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.payroll.vo.PayrollOptionMemberVo;
import com.kh.md.payroll.vo.PayrollVo;
import com.kh.md.payroll.vo.SoChangeVo;
import com.kh.md.payroll.vo.StandOrderVo;

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
	
	//지급계좌관리 ( 자동이체 정보 조회 )
	@Override
	public StandOrderVo selectStandingOrderByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("payrollMapper.selectStandingOrderByNo", no);
	}
	
	//지급 계좌 등록 ( 메인화면처리 )
	@Override
	public int insertStandingOrderByNo(SqlSessionTemplate sst, String no) {
		return sst.insert("payrollMapper.insertStandingOrderByNo", no);
		
	}
	
	//지급 계좌 관리 ( 자동이체신청내역 수정 )
	@Override
	public int updateStandingOrderPay(SqlSessionTemplate sst, SoChangeVo soChangeVo) {
		return sst.update("payrollMapper.updateStandingOrderPay", soChangeVo);
	}

	
	//지급 계좌 관리 ( 자동이체 변경내역 추가 )
	@Override
	public int insertChangeHistory(SqlSessionTemplate sst, SoChangeVo soChangeVo) {
		return sst.insert("payrollMapper.insertChangeHistory", soChangeVo);
	}

	//지급 계좌 관리 ( 변경이력가져오기 )
	@Override
	public List<SoChangeVo> selectSoChangeHistory(SqlSessionTemplate sst, String no) {
		return sst.selectList("payrollMapper.selectSoChangeHistory", no);
	}

	//급여대장 ( 검색 ( 옵션에 따른 작성대상 멤버 리스트 가져오기 )
	@Override
	public List<PayrollOptionMemberVo> selectPayrollOptionMember(SqlSessionTemplate sst, PayrollVo prVo) {
		return sst.selectList("payrollMapper.selectPayrollOptionMember",prVo);
	}

	
	
	
	
}//class
