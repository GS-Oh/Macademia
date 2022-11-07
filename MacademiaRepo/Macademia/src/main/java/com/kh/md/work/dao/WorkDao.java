package com.kh.md.work.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.work.common.PageVo;
import com.kh.md.work.vo.WorkVo;

@Repository
public class WorkDao {

	public List<MemberVo> getMemberAll(SqlSessionTemplate sst) {
		// TODO Auto-generated method stub
		return sst.selectList("workMapper.getMemberAll");
	}

	public List<MemberVo> getDeptMember(SqlSessionTemplate sst, String dept) {
		// TODO Auto-generated method stub
		return sst.selectList("workMapper.getDeptMember", dept);
	}

	public int workWrite(SqlSessionTemplate sst, WorkVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("workMapper.workWrite", vo);
	}

	public List<WorkVo> getSlaveList(SqlSessionTemplate sst, WorkVo workVo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("workMapper.getSlaveList", workVo, rb);
	}

	public List<WorkVo> getBossList(SqlSessionTemplate sst, WorkVo workVo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("workMapper.getBossList", workVo, rb);
	}

	public WorkVo slaveOne(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.selectOne("workMapper.slaveOne", no);
	}

	public WorkVo bossOne(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.selectOne("workMapper.bossOne", no);
	}

	public int workComplete(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.update("workMapper.workComplete", no);
	}

	public int workDelete(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.delete("workMapper.workDelete", no);
	}

	

	public WorkVo getModify(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.selectOne("workMapper.getModify", no);
	}

	public int setModify(SqlSessionTemplate sst, WorkVo vo) {
		// TODO Auto-generated method stub
		return sst.update("workMapper.setModify", vo);
	}

	public List<WorkVo> getCompleteList(SqlSessionTemplate sst, WorkVo workVo, PageVo pv) {
		// TODO Auto-generated method stub
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pv.getBoardLimit());
		return sst.selectList("workMapper.getComplete",workVo, rb);
	}

	public int selectCountAll(SqlSessionTemplate sst, String slaveNo) {
		// TODO Auto-generated method stub
		return sst.selectOne("workMapper.selectCountAll", slaveNo);
	}

	public int selectBossCountAll(SqlSessionTemplate sst, String memberNo) {
		// TODO Auto-generated method stub
		return sst.selectOne("workMapper.selectBossCountAll", memberNo);
	}

	public int selectCompleteCountAll(SqlSessionTemplate sst, String slaveNo) {
		// TODO Auto-generated method stub
		return sst.selectOne("workMapper.selectCompleteCountAll", slaveNo);
	}

}
