package com.kh.md.admin.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Dept {

	private int no;
	private String name;
	private Integer upperDept;
	private int lev;
	private Date createDate;
	private Date deleteDate;
	private String deleteYn;
	private int hasChildren;
	private int deptOrder;
	
//	private int deptNo;
//	private String deptName;
//	private String deptManager;		//부서책임자(사원아이디)
//	private String deptManagerName; //부서책임자(이름)
//	private String deptManagerJob;	//부서책임자(직위)
//	private	Integer upperDept;
//	private int deptLevel;
//	private int deptOrder;
//	private int deptStatus;
//	private Date createDate;
//	private Date deleteDate;
//	private int hasChildren;
	
}
