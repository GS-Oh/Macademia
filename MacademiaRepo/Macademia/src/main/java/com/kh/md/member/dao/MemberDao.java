package com.kh.md.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.member.vo.MemberVo;

public interface MemberDao {

	MemberVo selectOne(SqlSessionTemplate sst, MemberVo vo);

	int updatePwd(SqlSessionTemplate sst, Map<String, String> map);

	int selectOneByEmails(SqlSessionTemplate sst, Map<String, String> map);

	List<MemberVo> selectListByDeptNo(SqlSessionTemplate sst, String deptNo);

	List<MemberVo> selectListBySearch(SqlSessionTemplate sst, String search);

}
