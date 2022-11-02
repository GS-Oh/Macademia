package com.kh.md.work.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.work.dao.WorkDao;

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

}
