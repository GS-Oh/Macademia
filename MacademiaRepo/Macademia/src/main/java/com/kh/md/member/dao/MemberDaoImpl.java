package com.kh.md.member.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.bank.vo.BankVo;
import com.kh.md.member.vo.MemberVo;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Override
	public MemberVo selectOne(SqlSessionTemplate sst, MemberVo vo) {
		return sst.selectOne("memberMapper.selectOne",vo);
	}
	
	@Override
	public MemberVo selectOneByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("memberMapper.selectOneByNo",no);
	}
	
	@Override
	public int selectCountByEmail(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("memberMapper.selectCountByEmail",map);
	}
	
	@Override
	public int selectCountByPwd(SqlSessionTemplate sst,  MemberVo vo) {
		return sst.selectOne("memberMapper.selectCountByPwd",vo);
	}

	@Override
	public int updatePwd(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.update("memberMapper.updatePwd",map);
	}
	
	@Override
	public int updatePwd(SqlSessionTemplate sst, MemberVo memberVo) {
		return sst.update("memberMapper.updatePwd",memberVo);
	}
	
	@Override
	public List<MemberVo> selectListByDeptNo(SqlSessionTemplate sst, String deptNo) {
		return sst.selectList("memberMapper.selectListByDeptNo",deptNo);
	}

	@Override
	public List<MemberVo> selectListBySearch(SqlSessionTemplate sst, String search) {
		return sst.selectList("memberMapper.selectListBySearch",search);
	}

	@Override
	public List<BankVo> selectBankList(SqlSessionTemplate sst) {
		return sst.selectList("bankMapper.selectList");
	}

	@Override
	public int updateOne(SqlSessionTemplate sst, MemberVo memberVo) {
		return sst.update("memberMapper.updateOne",memberVo);
	}






	
	
}
