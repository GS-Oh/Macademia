//package com.kh.md.admin.service;
//
//import java.util.ArrayList;
//import java.util.HashMap;
//
//import com.kh.md.admin.vo.PageInfo;
//import com.kh.md.member.vo.MemberVo;
//
//public interface AdminService {
//
//	int getListCount();
//	
//	ArrayList<MemberVo> selectMemberList(PageInfo pi);
//
//	ArrayList<Dept> selectDepartmentList();
//
//	ArrayList<Job> selectJobList();
//
//	int getSearchListCount(HashMap<String, String> map);
//
//	ArrayList<MemberVo> selectSearchMemberList(PageInfo pi, HashMap<String, String> map);
//
//	ArrayList<Integer> getMemberCount();
//
//	int updateMultiMember(String[] mIdArr, int mStatus);
//
//	int updateMember(MemberVo m);
//
//	int deleteMember(String[] mIdArr);
//
//	MemberVo selectMember(String mId);
//
//	int deleteJob(String[] jobIdArr);
//
//	int insertJob(Job job);
//
//	int updateJob(Job job);
//
//	ArrayList<Member> selectDeptMemberList(Integer upperDept);
//
//	ArrayList<Department> getSubDeptList(int upperDept);
//
//	Department insertDept(Department dept);
//
//	int deleteDept(int deptId);
//
//	int updateDept(Department dept);
//
//	int moveDept(HashMap<String, Integer> map);
//	
//	int sortDeptOrder(ArrayList<Department> subDeptList);
//
//
//	ArrayList<Report> selectBoardReportList(PageInfo pi);
//
//	ArrayList<Report> selectReplyReportList(PageInfo pi);
//
//	int getReportListCount();
//
//	int handingBoardReport(Report report);
//
//	int handingReplyReport(Report report);
//
//
//
//}

