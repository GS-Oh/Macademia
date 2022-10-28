package com.kh.md.plan.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.plan.dao.PlanDao;
import com.kh.md.plan.vo.PlanVo;

@Service
public class PlanService {
	@Autowired
	private  PlanDao dao;
	@Autowired
	private  SqlSessionTemplate sst;
	public int write(PlanVo vo) {
		// TODO Auto-generated method stub
		return dao.insertPlan(sst, vo);
	}
	public List<PlanVo> getPlan() {
		// TODO Auto-generated method stub
		return dao.getPlan(sst);
	}

	public PlanVo getPlanOne(String pno) {
		// TODO Auto-generated method stub
		return dao.getPlanOne(sst, pno);
		
	}
	public int planDelete(String pno) {
		return dao.planDelete(sst, pno);
		
	}
	public PlanVo getModify(String no) {
		return dao.getModify(sst, no);
		
	}
	public int modify(PlanVo vo) {
		// TODO Auto-generated method stub
		return dao.modify(sst, vo);
	}

}
