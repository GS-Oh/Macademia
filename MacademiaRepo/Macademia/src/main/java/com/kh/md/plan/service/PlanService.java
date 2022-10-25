package com.kh.md.plan.service;

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

}
