package com.kh.md.member.dao;

import java.util.List;
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
	@Override
	public List<MemberVo> selectListByDeptNo(SqlSessionTemplate sst, String deptNo) {
		List<MemberVo> list = sst.selectList("memberMapper.selectListByDeptNo",deptNo);
		System.out.println("dao : " + list);
		return list;
				
	}


	
	
}
