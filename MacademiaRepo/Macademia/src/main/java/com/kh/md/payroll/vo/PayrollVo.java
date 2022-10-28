package com.kh.md.payroll.vo;

import lombok.Data;

@Data
public class PayrollVo {

	
	private String salNo;
	private String writerNo;
	private String targetNo;
	private String payDate;
	
	//
	private int pay;
	private int taxfree;
	private int attendance;
	private int attendancePlus;
	private int technical;
	private int specialduty;
	private int emergency;
	private int lunchFee;
	private int holiday;
	private int subsidy;
	private int publicActivity;
	private int other;
	private String standingOrder;
	private int contribution;
	private int longtermCare;
	private int mutualFee;
	private int safeDeposit;
	private int incomeTax;
	private int localTax;
	
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
