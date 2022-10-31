package com.kh.md.sign.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.member.vo.MemberVo;

@Repository
public class SignDao {

	public List<MemberVo> getMemberAll(SqlSessionTemplate sst) {
		// TODO Auto-generated method stub
		return sst.selectList("signMapper.getListAll");
	}

	public List<MemberVo> getDeptMember(SqlSessionTemplate sst, String deptCode) {
		// TODO Auto-generated method stub
		return sst.selectList("signMapper.getListDept", deptCode);
	}

}
