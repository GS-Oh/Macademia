package com.kh.md.member.dao;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.member.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Override
	public MemberVo selectOne(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("memberMapper.selectOne",vo);
	}
	
	@Override
	public int selectOneByEmails(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("memberMapper.selectOneByEmails",map);
	}

	@Override
	public int updatePwd(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("memberMapper.updatePwd",map);
	}


	
	
}
