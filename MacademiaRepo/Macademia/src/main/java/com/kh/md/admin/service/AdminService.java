package com.kh.md.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.md.admin.vo.Dept;
import com.kh.md.admin.vo.Position;
import com.kh.md.admin.vo.PageInfo;
import com.kh.md.admin.vo.Report;
import com.kh.md.member.vo.MemberVo;

public interface AdminService {

	int getListCount();
	
	ArrayList<MemberVo> selectMemberList(PageInfo pi);

	ArrayList<Dept> selectDepartmentList();

	ArrayList<Position> selectPosiList();

	int getSearchListCount(HashMap<String, String> map);

	ArrayList<MemberVo> selectSearchMemberList(PageInfo pi, HashMap<String, String> map);

	ArrayList<Integer> getMemberCount();

	int updateMultiMember(String[] noArr, String quitYn);

	int updateMember(MemberVo m);

	int deleteMember(String[] noArr);

	MemberVo selectMember(String no);

	int deletePosi(String[] noArr);

	int insertPosi(Position posi);

	int updatePosi(Position posi);

	ArrayList<MemberVo> selectDeptMemberList(int upperDept);

	ArrayList<Dept> getSubDeptList(int upperDept);

	Dept insertDept(Dept dept);

	int deleteDept(int deptNo);

	int updateDept(Dept dept);

	int moveDept(HashMap<String, Integer> map);
	
	int sortDeptOrder(ArrayList<Dept> subDeptList);
	
	
	

	ArrayList<Report> selectBoardReportList(PageInfo pi);

	ArrayList<Report> selectReplyReportList(PageInfo pi);

	int getReportListCount();

	int handingBoardReport(Report report);

	int handingReplyReport(Report report);




}