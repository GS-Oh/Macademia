package com.kh.md.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.bank.vo.BankVo;
import com.kh.md.member.vo.MemberVo;

public interface MemberDao {

	MemberVo selectOne(SqlSessionTemplate sst, MemberVo vo);
	
	MemberVo selectOneByNo(SqlSessionTemplate sst, String no);

	int updatePwd(SqlSessionTemplate sst, Map<String, String> map);

	int selectCountByEmail(SqlSessionTemplate sst, Map<String, String> map);
	
	int selectCountByPwd(SqlSessionTemplate sst, MemberVo vo);

	List<MemberVo> selectListByDeptNo(SqlSessionTemplate sst, String deptNo);

	List<MemberVo> selectListBySearch(SqlSessionTemplate sst, String search);

	List<BankVo> selectBankList(SqlSessionTemplate sst);

	int updateOne(SqlSessionTemplate sst, MemberVo memberVo);

	int updatePwd(SqlSessionTemplate sst, MemberVo memberVo);





}
