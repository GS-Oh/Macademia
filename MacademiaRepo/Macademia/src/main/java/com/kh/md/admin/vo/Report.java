package com.kh.md.admin.vo;

import lombok.Data;

@Data
public class Report {

	private String reportNo;
	private String mNo;
	private String bNo;
	private String replyNo;
	private String reportType;
	private String reportCategory;
	private String reportDate;
	private int reportStatus;
	
//	private int reportNo;				//신고번호
//	private String reportType;			//신고유형 A,B -부적절한 내용/광고성
//	private Date reportDate;			//신고일
//	private int reportStatus;			//신고분류 게시글/댓글
//	private int bNo;					//글번호
//	private String bTitle;				//글제목
//	private String bType;				//글 타입(자유, 아무 등등)
//	private String bStatus;				//상태 0,1,2,3 정상 삭제 관리자 비활
//	private int replyNo;				//댓글번호
//	private String replyContent;		//댓글내용
//	private int rStatus;				//댓글 삭제
//	
//	private String writerName;			//작성자 이름
//	private String writerPositionName;	//작성자 직위
}
