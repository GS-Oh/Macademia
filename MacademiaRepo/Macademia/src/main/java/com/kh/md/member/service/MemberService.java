package com.kh.md.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kh.md.bank.vo.BankVo;
import com.kh.md.member.vo.MemberVo;

public interface MemberService {

	MemberVo login(MemberVo vo);
	
	MemberVo findOneByNo(String no);

	String findPwd(Map<String, String> map);

	List<MemberVo> findListBySearch(String search);

	List<BankVo> getBankList();

	int editOne(MemberVo memberVo, HttpServletRequest req);

	int checkPwd(MemberVo memberVo);

	int changePwd(MemberVo memberVo);



}
