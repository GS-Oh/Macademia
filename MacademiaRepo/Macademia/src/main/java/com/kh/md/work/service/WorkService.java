package com.kh.md.work.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.work.common.PageVo;
import com.kh.md.work.dao.WorkDao;
import com.kh.md.work.vo.WorkVo;

@Service
public class WorkService {

	@Autowired
	private WorkDao dao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<MemberVo> getMemberAll() {
		// TODO Auto-generated method stub
		return dao.getMemberAll(sst);
	}

	public List<MemberVo> getDeptMember(String dept) {
		// TODO Auto-generated method stub
		return dao.getDeptMember(sst, dept);
	}

	public int workWrite(WorkVo vo) {
		// TODO Auto-generated method stub
		return dao.workWrite(sst, vo);
	}

	public List<WorkVo> getSlaveList(WorkVo workVo, PageVo pv) {
		// TODO Auto-generated method stub
		return dao.getSlaveList(sst, workVo, pv);
	}

	public List<WorkVo> getBossList(WorkVo workVo, PageVo pv) {
		// TODO Auto-generated method stub
		return dao.getBossList(sst, workVo, pv);
	}

	public WorkVo slaveOne(String no) {
		// TODO Auto-generated method stub
		return dao.slaveOne(sst, no);
	}

	public WorkVo BossOne(String no) {
		// TODO Auto-generated method stub
		return dao.bossOne(sst, no);
	}

	public int workComplete(String no) {
		return dao.workComplete(sst, no);
		
	}

	public int workDelete(String no) {
		// TODO Auto-generated method stub
		return dao.workDelete(sst, no);
	}

	public WorkVo getModify(String no) {
		// TODO Auto-generated method stub
		return dao.getModify(sst,no);
	}

	public int setModify(WorkVo vo) {
		// TODO Auto-generated method stub
		return dao.setModify(sst, vo);
	}

	public List<WorkVo> getCompleteList(WorkVo workVo, PageVo pv) {
		// TODO Auto-generated method stub
		return dao.getCompleteList(sst,workVo, pv);
	}

	public int selectTotalCnt(String slaveNo) {
		// TODO Auto-generated method stub
		return dao.selectCountAll(sst, slaveNo);
	}

	public int selectBossTotalCnt(String memberNo) {
		return dao.selectBossCountAll(sst, memberNo);
	}

	public int selectCompleteTotalCnt(String slaveNo) {
		// TODO Auto-generated method stub
		return dao.selectCompleteCountAll(sst, slaveNo);
	}

}
