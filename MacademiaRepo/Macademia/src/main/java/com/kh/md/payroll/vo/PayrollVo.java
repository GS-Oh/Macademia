package com.kh.md.payroll.vo;

import lombok.Data;

@Data
public class PayrollVo {

	//테이블에 입력받을 것들
	private String salNo;
	private String writerNo;
	private String targetNo;
	private String payDate;
	private int pay; //월 급여액
	
	private int attendance; //정근수당
	private int attendancePlus; //정근가산금
	private int technical; //기술정보수당
	private int specialduty; //특수직무수당
	private int emergency;//비상근무수당
	private int lunchFee;//정액급식비
	private int holiday;//명절휴가비
	private int subsidy;//직급보조비
	private int publicActivity;//대민활동비
	
	private int contribution;//기여금
	private int mutualFee;//대한공제회비
	private int safeDeposit;//직장금고회비
	private int other; //기타공제
	
	// 계산해서 얻을 것들
 	private int taxfree; //비과세 근로소득 ( 정근수당 ~기타공제 까지  값들을 더해서 구함 ) = 수당총액
	private int baseMonthPay; //기준소득월액 ( 월급여액 - 비과세근로소득 )
	private int nationalPension; //국민연금 ( 기준소득월액 * 4.5% )1
	private int healthPremium; //건강보험료 ( 기준소득월액 * 3.335% )1
	private int longtermCare; //장기요양보험 ( 건강보험료 * 50% )2
	private int employmentPay; //고용 보험 ( 기준소득월액 * 4.5% )2
	private int incomeTax; //소득세 ( 월급여액 * 4.3% )1
	private int localTax; //지방소득세 ( 소득세 * 10% )1
	private int accidentPay; // 산재 보험 ( 보수총액 x 보험요율 / 1000 )2
	
	//
	private int totalPayment; //총지급액
	private	int actualPayment;	//실급여액
	private int totalDeduction; //공제총액 	
		
	//
	private String no;
	private String name;
	private String email;
	private String address;
	private String phone;
	private String profileName;
	private String bankNo;
	private String account;
	private String enrollDate;
	
	
	//
	private String position;
	private String rankNo;
	private String deptNo;
	private String rankName;
	private String deptName;
	
	
	
	
	
}
