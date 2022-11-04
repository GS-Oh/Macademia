package com.kh.md.sign.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.sign.vo.SignLineVo;
import com.kh.md.sign.vo.SignVo;

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

	public int signWrite(SqlSessionTemplate sst, SignVo vo) {
		// TODO Auto-generated method stub
		return sst.insert("signMapper.signWrite", vo);
	}

	public int insertSignline(SqlSessionTemplate sst, SignLineVo slVo) {
		// TODO Auto-generated method stub
		return sst.insert("signMapper.insertSignLine",slVo);
	}

}
