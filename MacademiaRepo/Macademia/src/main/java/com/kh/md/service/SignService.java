package com.kh.md.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.sign.dao.SignDao;
import com.kh.md.sign.vo.SignVo;

@Service
public class SignService {
	@Autowired
	private SignDao dao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	
	public List<MemberVo> getMemberAll() {
		
		return dao.getMemberAll(sst);
	}


	public List<MemberVo> getDeptMember(String deptCode) {
		// TODO Auto-generated method stub
		return dao.getDeptMember(sst,deptCode);
	}





	public int signWrite(SignVo vo) {
		// TODO Auto-generated method stub
		return dao.signWrite(sst, vo);
	}

}
