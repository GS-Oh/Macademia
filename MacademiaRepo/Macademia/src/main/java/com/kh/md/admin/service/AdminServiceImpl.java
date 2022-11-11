package com.kh.md.admin.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.md.admin.dao.AdminDao;
import com.kh.md.admin.vo.Dept;
import com.kh.md.admin.vo.Position;
import com.kh.md.admin.vo.PageInfo;
import com.kh.md.admin.vo.Report;
import com.kh.md.member.vo.MemberVo;

@Service("aService")
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao aDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return aDAO.getListCount(sqlSession); 
	}

	@Override
	public ArrayList<MemberVo> selectMemberList(PageInfo pi) {
		
		ArrayList<MemberVo> mList = null;
		if (pi != null) {
			mList = aDAO.selectMemberList(sqlSession, pi);
		} else {
			mList = aDAO.selectMemberList(sqlSession, null);
		}
		
		return mList;
	}

	@Override
	public ArrayList<Dept> selectDeptList() {
		return aDAO.selectDeptList(sqlSession);
	}

	@Override
	public ArrayList<Position> selectPosiList() {
		return aDAO.selectPosiList(sqlSession);
	}

	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return aDAO.getSearchListCount(sqlSession, map);
	}

	@Override
	public ArrayList<MemberVo> selectSearchMemberList(PageInfo pi, HashMap<String, String> map) {
		return aDAO.selectSearchMemberList(sqlSession, pi, map);
	}

	@Override
	public ArrayList<Integer> getMemberCount() {
		return aDAO.getMemberCount(sqlSession);
	}

	@Override
	public int updateMultiMember(String[] noArr, String quitYn) {
		return aDAO.updateMultiMember(sqlSession, noArr, quitYn);
	}

	@Override
	public int updateMember(MemberVo m) {
		return aDAO.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String[] noArr) {
		return aDAO.deleteMember(sqlSession, noArr);
	}

	@Override
	public MemberVo selectMember(String no) {
		return aDAO.selectMember(sqlSession, no);
	}

	@Override
	public int deletePosi(String[] positionNoArr) {
		return aDAO.deletePosi(sqlSession, positionNoArr);
	}

	@Override
	public int insertPosi(Position position) {
		return aDAO.insertPosi(sqlSession, position);
	}

	@Override
	public int updatePosi(Position position) {
		return aDAO.updatePosi(sqlSession, position);
	}

	@Override
	public ArrayList<MemberVo> selectDeptMemberList(Integer upperDept) {
		System.out.println(upperDept);
		return aDAO.selectDeptMemberList(sqlSession, upperDept);
		
	}

	@Override
	public ArrayList<Dept> getSubDeptList(Integer upperDept) {
		return aDAO.getSubDeptList(sqlSession, upperDept);
	}

	@Override
	@Transactional // 트랜잭션 관리
	public Dept insertDept(Dept dept) {
		int result = aDAO.insertDept(sqlSession, dept);
		// 부서 등록 후 등록한 부서 정보 가져오기
		Dept d = null;
		if (result > 0) {
			d = aDAO.selectDept(sqlSession);
		}
		
		return d;
	}

	@Override
	public int deleteDept(int deptNo) {
		return aDAO.deleteDept(sqlSession, deptNo);
	}

	@Override
	public int updateDept(Dept dept) {
		return aDAO.updateDept(sqlSession, dept);
	}

	@Override
	public int moveDept(HashMap<String, Integer> map) {
		return aDAO.moveDept(sqlSession, map);
	}
	
	@Override
	public int sortDeptOrder(ArrayList<Dept> subDeptList) {
		return aDAO.sortDeptOrder(sqlSession, subDeptList);
	}

	
	
	@Override
	public int getReportListCount() {
		return aDAO.getReportListCount(sqlSession); 
	}
	
	@Override
	public ArrayList<Report> selectBoardReportList(PageInfo pi) {
		return aDAO.selectBoardReportList(sqlSession, pi); 
	}

	@Override
	public ArrayList<Report> selectReplyReportList(PageInfo pi) {
		return aDAO.selectReplyReportList(sqlSession, pi); 
	}

	@Override
	@Transactional
	public int handingBoardReport(Report report) {
		System.out.println(report);
		int result = aDAO.handingBoardReport(sqlSession, report);
		
		if (result > 0 && report.getReportStatus() == 1) {
			result = aDAO.deleteBoard(sqlSession, report.getBNo());
		}
		
		return result;
	}

	@Override
	@Transactional
	public int handingReplyReport(Report report) {
		System.out.println(report);
		int result = aDAO.handingReplyReport(sqlSession, report);
		
		if (result > 0 && report.getReportStatus() == 1) {
			result = aDAO.deleteReply(sqlSession, report.getReplyNo());
		}
		
		return result;
	}



}
