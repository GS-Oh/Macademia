package com.kh.md.member.service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.file.dao.FileDao;
import com.kh.md.member.dao.MemberDao;
import com.kh.md.member.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{
	
	 private final MemberDao memberDao;
	 private final FileDao fileDao;
	 private final SqlSessionTemplate sst;
	 
	 @Autowired
	 public MemberServiceImpl(MemberDao memberDao, FileDao fileDao, SqlSessionTemplate sst) {
			this.memberDao = memberDao;
			this.fileDao = fileDao;
			this.sst = sst;
	 }

	@Override
	public MemberVo login(MemberVo vo) {
		MemberVo loginMember  = memberDao.selectOne(sst,vo);
		return loginMember;
	}
	

	@Override
	public String findPwd(Map<String, String> map) {
		int result1 = memberDao.selectOneByEmails(sst,map);
		
		int result2;
		String newPwd;
		if(result1 == 1) {
			newPwd = UUID.randomUUID().toString().substring(0,8);
			map.put("newPwd",newPwd);
			result2  = memberDao.updatePwd(sst,map);
			if(result2 == 1) return newPwd;
			else return null;
		}else return null;
	}

	@Override
	public List<MemberVo> findListBySearch(String search) {
		List<MemberVo> memberList  = memberDao.selectListBySearch(sst,search);
		return memberList;
	}






	 
	 
	 

}
