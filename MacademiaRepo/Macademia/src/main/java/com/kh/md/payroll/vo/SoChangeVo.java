package com.kh.md.payroll.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class SoChangeVo {

	
	private String chNo;
	private String stNo;
	private String name;
	private String status;
	private Date changeDate;
	
};
