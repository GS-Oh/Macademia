package com.kh.md.admin.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.admin.vo.Dept;
import com.kh.md.admin.vo.Position;
import com.kh.md.admin.vo.PageInfo;
import com.kh.md.admin.vo.Report;
import com.kh.md.member.vo.MemberVo;

@Repository("aDAO")
public class AdminDao {

	public int getListCount(SqlSessionTemplate sqlSession) {
		int listCount = sqlSession.selectOne("adminMapper.getListCount");
		
		return listCount;
	}

	public ArrayList<MemberVo> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		ArrayList<MemberVo> mList = null;
		if (pi != null) {
			int offset  = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
			RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
			mList = (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
		} else {
			mList = (ArrayList)sqlSession.selectList("adminMapper.selectMemberList2");
		}
		
		return mList;
	}

	public ArrayList<Dept> selectDeptList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectDeptList");
	}

	public ArrayList<Position> selectPosiList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.selectPosiList");
	}

	public int getSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("adminMapper.getSearchListCount", map);
	}

	public ArrayList<MemberVo> selectSearchMemberList(SqlSessionTemplate sqlSession, PageInfo pi,
			HashMap<String, String> map) {
		int offset  = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSearchMemberList", map, rowBounds);
	}

	public ArrayList<Integer> getMemberCount(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.getMemberCount");
	}

	public int updateMultiMember(SqlSessionTemplate sqlSession, String[] noArr, String quitYn) {
		int result = 0;
		for(String no : noArr) {
//			HashMap<String, String> map = new HashMap<String, String>();
//			map.put("mId", mId);
//			map.put("mStatus", String.valueOf(mStatus));
			MemberVo m = new MemberVo();
			m.setNo(no);
			m.setQuitYn(quitYn);
			result += sqlSession.update("adminMapper.updateMultiMember", m);
		}
		
		return result;
	}

	public int updateMember(SqlSessionTemplate sqlSession, MemberVo m) {
		return sqlSession.update("adminMapper.updateMember", m);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String[] noArr) {
		int result = 0;
		for (String no : noArr) {
			result += sqlSession.update("adminMapper.deleteMember", no);
		}
		return result;
	}

	public MemberVo selectMember(SqlSessionTemplate sqlSession, String no) {
		return sqlSession.selectOne("adminMapper.selectMember", no);
	}

	public int deletePosi(SqlSessionTemplate sqlSession, String[] PositionNoArr) {
		int result = 0;
		for (String positionNo : PositionNoArr) {
			result += sqlSession.update("adminMapper.deletePosi", positionNo);
		}
		
		return result;
	}

	public int insertPosi(SqlSessionTemplate sqlSession, Position position) {
		return sqlSession.insert("adminMapper.insertPosi", position);
	}

	public int updatePosi(SqlSessionTemplate sqlSession, Position position) {
		return sqlSession.update("adminMapper.updatePosi", position);
	}

	public ArrayList<MemberVo> selectDeptMemberList(SqlSessionTemplate sqlSession, Integer upperDept) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("upperDept", upperDept); // mapper에서 if로 upperDept속성 사용하기 위해 map의 속성으로 추가
		return (ArrayList)sqlSession.selectList("adminMapper.selectDeptMemberList", map);
	}

	public ArrayList<Dept> getSubDeptList(SqlSessionTemplate sqlSession, Integer upperDept) {
		return (ArrayList)sqlSession.selectList("adminMapper.getSubDeptList", upperDept);
	}

	public int insertDept(SqlSessionTemplate sqlSession, Dept dept) {
		return sqlSession.insert("adminMapper.insertDept", dept);
	}
	
	public Dept selectDept(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectDept");
	}

	public int deleteDept(SqlSessionTemplate sqlSession, int deptNo) {
		return sqlSession.update("adminMapper.deleteDept", deptNo);
	}

	public int updateDept(SqlSessionTemplate sqlSession, Dept dept) {
		return sqlSession.update("adminMapper.updateDept", dept);
	}

	public int moveDept(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.update("adminMapper.moveDept", map);
	}
	
	public int sortDeptOrder(SqlSessionTemplate sqlSession, ArrayList<Dept> subDeptList) {
		int result = 0;
		
		for (Dept d : subDeptList) {
			result += sqlSession.update("adminMapper.sortDeptOrder", d);
		}
		
		return result;
	}
	
	
	

	public int getReportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.getReportListCount");
	}

	public ArrayList<Report> selectBoardReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset  = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectBoardReportList", null, rowBounds);
	}

	public ArrayList<Report> selectReplyReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset  = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectReplyReportList", null, rowBounds);
	}

	public int handingBoardReport(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.update("adminMapper.handingBoardReport", report);
	}

	public int deleteBoard(SqlSessionTemplate sqlSession, String bNo) {
		return sqlSession.update("adminMapper.deleteBoard", bNo);
	}

	public int handingReplyReport(SqlSessionTemplate sqlSession, Report report) {
		return sqlSession.update("adminMapper.handingReplyReport", report);
	}

	public int deleteReply(SqlSessionTemplate sqlSession, String replyNo) {
		return sqlSession.update("adminMapper.deleteReply", replyNo);
	}


}
