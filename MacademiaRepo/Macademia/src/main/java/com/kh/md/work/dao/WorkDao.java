package com.kh.md.work.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.member.vo.MemberVo;

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

}
