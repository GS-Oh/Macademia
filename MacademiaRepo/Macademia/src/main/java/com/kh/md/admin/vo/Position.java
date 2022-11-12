package com.kh.md.admin.vo;

import lombok.Data;

@Data
public class Position {

	private String no;
	private String name;
	private String rankNo;
	private String deptNo;
//	private String no;
//	private String name;		//직책명
//	private String order;		//정렬순서
//	private String status;		//직위/직책상태
	private String memberCount; //사원 수

}
