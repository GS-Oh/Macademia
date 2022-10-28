package com.kh.md.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {

	@GetMapping("main")
	public String adminHome() {
		return "admin/main";
	}
	
	@GetMapping("main2")
	public String adminMain() {
		return "admin";
	}
	
	@GetMapping("settingMemberProfile")
	public String memberProfile(){
		return "admin/settingMemberProfile";
		
	}
		
	//사원 목록 조회
	@GetMapping("admin/mlist.ad")
	public String selectMemberList() {
		return "admin/mlist.ad";
	}
	
	//사원검색
	@GetMapping("admin/msearch.ad")
	public String selectSearchMemberList() {
		return "admin/msearch.ad";
	}
	
	//사원 정보 수정(여러 명)
	@GetMapping("admin/mupdatemulti.ad")
	public String updateMultiMember() {
		return "admin/mupdatemulti.ad";
	}

	//사원 삭제
	@GetMapping("admin/mdelete.ad")
	public String deleteMember() {
		return "admin/mdelete.ad";
	}
		
	//사원 상세 조회
	@GetMapping("admin/mdetail.ad")
	public String memberDetail() {
		return "admin/mdetail.ad";
	}
	
	//사원 정보 수정(1명)
	@GetMapping("admin/mupdate.ad")
	public String updateMember() {
		return "redirect:mdetail.ad";
	}
	
    //직위 목록
	@GetMapping("admin/joblist.ad")
	public String selectJobList() {
		return "jobList";
	}
	
    //직위 삭제
	@GetMapping("admin/jdelete.ad")
	public void deleteJob() {
		
	}	
	
    //직위 등록
	@GetMapping("admin/jinsert.ad")
	public void insertJob() {

	}
	
    //직위 수정
	@GetMapping("admin/jupdate.ad")
	public void updateJob() {
	
	}
	
    //부서 목록 조회
	@GetMapping("admin/deptlist.ad")
	public String selectDepartmentList() {
		return "deptList";		
	}	
	
    //하위 부서 및 부서원 목록 조회
	@GetMapping("admin/subDeptList.ad")
	public String getSubDeptList() {
		return "";
	}
	
    //부서 등록
	@GetMapping("admin/dinsert.ad")
	public void insertDept() {
		
	}
	
    //부서 삭제
	@GetMapping("admin/ddelete.ad")
	public String deleteDept() {
		return "";
	}
	
    //부서 수정
	@GetMapping("admin/dupdate.ad")
	public String updateDept() {
		return "";
	}	
	
	//부서이동
	@GetMapping("admin/dmove.ad")
	public String moveDept() {
		return "";
	}
	
	//정렬
	public int sortDept() {
		return 1;
	}
	
    //신고글 목록 조회	
	@RequestMapping("admin/reportList.ad")
	public String reportList() {
		return "";
	}
	
    //신고된 게시글 관리
	@RequestMapping("admin/handingBoardReport")
	public String handingBoardReport() {
		return "";
	}
	
    //신고된 댓글 관리	
	@RequestMapping("handingReplyReport")
	public String handingReplyReport() {		
		return "";
	}


}
