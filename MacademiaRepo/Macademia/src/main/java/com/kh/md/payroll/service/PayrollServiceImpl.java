package com.kh.md.payroll.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.md.payroll.dao.PayrollDao;
import com.kh.md.payroll.vo.PayrollOptionMemberVo;
import com.kh.md.payroll.vo.PayrollVo;
import com.kh.md.payroll.vo.SoChangeVo;
import com.kh.md.payroll.vo.StandOrderVo;

@Service
public class PayrollServiceImpl implements PayrollService{

	private final PayrollDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public PayrollServiceImpl(PayrollDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	
	
	
	
	//급여대장 검색 ( 옵션에 따른 급여대장 리스트 가져오기 )
	@Override
	public List<PayrollVo> selectPayrollOption(PayrollVo prVo) {
		
		List<PayrollVo> payRollList = dao.selectPayrollOption(sst, prVo);
		
		
		for (int i = 0; i < payRollList.size(); i++) {
					
			PayrollVo temp = payRollList.get(i);
			
			int taxFree = temp.getAttendance() + temp.getAttendancePlus() + temp.getTechnical() + temp.getSpecialduty() + temp.getEmergency() + temp.getLunchFee() + temp.getHoliday() + temp.getSubsidy() + temp.getPublicActivity();
			temp.setTaxfree(taxFree);
			
			int baseMonthPay = temp.getPay() - taxFree;
			int longTermcare = ((int)((baseMonthPay*0.03335)*0.5)/1000 )* 1000 + 1000;
			int employmentpay = ((int)(baseMonthPay*0.045)/1000 )* 1000 + 1000;
			int	nationalPension = ((int)(baseMonthPay*0.045)/1000 )* 1000 + 1000;
			int healthPremium = ((int)(baseMonthPay*0.03335)/1000 )* 1000 + 1000;
			int incomeTax = ((int)(temp.getPay()*0.043)/1000 )* 1000 + 1000;
			int localTax = ((int)((temp.getPay()*0.043)*0.1)/1000 )* 1000 + 1000;
			
			temp.setBaseMonthPay(baseMonthPay);
			temp.setNationalPension(nationalPension);
			temp.setHealthPremium(healthPremium);
			temp.setLongtermCare(longTermcare);
			temp.setEmploymentPay(employmentpay);
			temp.setIncomeTax(incomeTax);
			temp.setLocalTax(localTax);
			
			//  공제총액 : 총지급액 : 실급여액
			int totlaDeduction = ((temp.getContribution()/1000) * 1000 + 1000) + ((temp.getMutualFee()/1000) * 1000 + 1000) + ((temp.getSafeDeposit()/1000) * 1000 + 1000)+ temp.getOther() + longTermcare + employmentpay ;
			int totalPayment = temp.getPay() + taxFree;
			int actualPayment =	totalPayment - totlaDeduction - nationalPension - healthPremium - incomeTax - localTax;	
			
			temp.setTotalDeduction(totlaDeduction);
			temp.setTotalPayment(totalPayment);
			temp.setActualPayment(actualPayment);
			
		}

		
		
		return payRollList;
	}

	
	//급여대장 작성 ( 작성하기 처리 )
	@Override
	public int insertSalaryBook(PayrollVo prVo) {
		
		if(prVo.getAttendance() != 0){ prVo.setAttendance(((prVo.getAttendance()/1000) *1000) + 1000); } 
		if(prVo.getAttendancePlus() != 0){ prVo.setAttendancePlus(((prVo.getAttendancePlus()/1000) * 1000) +1000); } 
		if(prVo.getTechnical() != 0){ prVo.setTechnical(((prVo.getTechnical()/1000) * 1000) +1000); } 
		if(prVo.getSpecialduty() != 0){ prVo.setSpecialduty(((prVo.getSpecialduty()/1000) * 1000) +1000); }
		if(prVo.getEmergency() != 0){ prVo.setEmergency(((prVo.getEmergency()/1000) * 1000) +1000); }
		if(prVo.getLunchFee() != 0){ prVo.setLunchFee(((prVo.getLunchFee()/1000) * 1000) +1000); }
		if(prVo.getHoliday() != 0){ prVo.setHoliday(((prVo.getHoliday()/1000) * 1000) +1000); } 
		if(prVo.getSubsidy() != 0){ prVo.setSubsidy(((prVo.getAttendancePlus()/1000) * 1000) +1000); } 
		if(prVo.getPublicActivity() != 0){ prVo.setPublicActivity(((prVo.getPublicActivity()/1000) * 1000) +1000); } 
		if(prVo.getContribution() != 0){ prVo.setContribution(((prVo.getContribution()/1000) * 1000) +1000); } 
		if(prVo.getMutualFee() != 0){ prVo.setMutualFee(((prVo.getMutualFee()/1000) * 1000) +1000); } 
		if(prVo.getSafeDeposit() != 0){ prVo.setSafeDeposit(((prVo.getSafeDeposit()/1000) * 1000) +1000); } 
		if(prVo.getOther() != 0){ prVo.setOther(((prVo.getOther()/1000) * 1000) +1000); } 
		
		
		return dao.insertSalaryBook(sst, prVo);
	}


	//급여지급내역 ( 메인페이지 )
	@Override
	public List<PayrollVo> selectPayRollList(PayrollVo prVo) {
		
		List<PayrollVo> payRollList = dao.selectPayRollList(sst, prVo);
		
		for (int i = 0; i < payRollList.size(); i++) {
			
			PayrollVo temp = payRollList.get(i);
			
			int taxFree = temp.getAttendance() + temp.getAttendancePlus() + temp.getTechnical() + temp.getSpecialduty() + temp.getEmergency() + temp.getLunchFee() + temp.getHoliday() + temp.getSubsidy() + temp.getPublicActivity();
			temp.setTaxfree(taxFree);
			
			int baseMonthPay = temp.getPay() - taxFree;
			int longTermcare = ((int)((baseMonthPay*0.03335)*0.5)/1000 )* 1000 + 1000;
			int employmentpay = ((int)(baseMonthPay*0.045)/1000 )* 1000 + 1000;
			int	nationalPension = ((int)(baseMonthPay*0.045)/1000 )* 1000 + 1000;
			int healthPremium = ((int)(baseMonthPay*0.03335)/1000 )* 1000 + 1000;
			int incomeTax = ((int)(temp.getPay()*0.043)/1000 )* 1000 + 1000;
			int localTax = ((int)((temp.getPay()*0.043)*0.1)/1000 )* 1000 + 1000;
			
			temp.setBaseMonthPay(baseMonthPay);
			temp.setNationalPension(nationalPension);
			temp.setHealthPremium(healthPremium);
			temp.setLongtermCare(longTermcare);
			temp.setEmploymentPay(employmentpay);
			temp.setIncomeTax(incomeTax);
			temp.setLocalTax(localTax);
			
			//  공제총액 : 총지급액 : 실급여액
			int totlaDeduction = temp.getContribution() + temp.getMutualFee() + temp.getSafeDeposit()+ temp.getOther() + longTermcare + employmentpay ;
			temp.setTotalDeduction(totlaDeduction);
			int totalPayment = temp.getPay() + taxFree;
			temp.setTotalPayment(totalPayment);
			int actualPayment =	totalPayment - totlaDeduction - nationalPension - healthPremium - incomeTax - localTax;	
			temp.setActualPayment(actualPayment);
			
		}
		
		return payRollList; 
	}


	//지급계좌관리 ( 자동이체 정보 조회 )
	@Override
	public StandOrderVo selectStandingOrderByNo(String no) {
		return dao.selectStandingOrderByNo(sst, no);
	}


	//지급 계좌 등록 ( 메인화면처리 )
	@Override
	public int insertStandingOrderByNo(String no) {
		return dao.insertStandingOrderByNo(sst, no);
	}


	//지급 계좌 관리 ( 변경이력추가 )
	@Override
	@Transactional
	public int insertChangeHistory(SoChangeVo soChangeVo) {
		
		//계좌신청정보 변경
		int result = dao.updateStandingOrderPay(sst, soChangeVo);
		//성공하면 변경이력 추가
		if(result == 1) {
			return dao.insertChangeHistory(sst, soChangeVo);
		}else {
			return 0;
		}
	}


	//지급 계좌 관리 ( 변경이력가져오기 )
	@Override
	public List<SoChangeVo> selectSoChangeHistory(String no) {
		return dao.selectSoChangeHistory(sst, no);
	}





	//급여대장 ( 검색 ( 옵션에 따른 작성대상 멤버 리스트 가져오기 )
	@Override
	public List<PayrollOptionMemberVo> selectPayrollOptionMember(PayrollVo prVo) {
		return dao.selectPayrollOptionMember(sst, prVo);
	}


	//급여대장 ( 상태 변경하기 )
	@Override
	public int updateCheckStatus(Map<String, String> checkStatus) {
		return dao.updateCheckStatus(sst, checkStatus);
	}}//class





