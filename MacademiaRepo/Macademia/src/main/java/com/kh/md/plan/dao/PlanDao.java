package com.kh.md.plan.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.plan.vo.PlanVo;

@Repository
public class PlanDao {

	public int insertPlan(SqlSessionTemplate sst, PlanVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("planMapper.insertPlan", vo);
	}

}
