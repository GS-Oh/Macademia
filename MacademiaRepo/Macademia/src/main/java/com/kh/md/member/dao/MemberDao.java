package com.kh.md.member.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.member.vo.MemberVo;

public interface MemberDao {

	MemberVo selectOne(SqlSessionTemplate sst, MemberVo vo);

}
