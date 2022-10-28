package com.kh.md.member.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.file.dao.FileDao;
import com.kh.md.file.vo.FileVo;
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
	public List<FileVo> getPrivatefileList(String memberNo) {
		List<FileVo> fileList = fileDao.selectPrivatefileList(sst,memberNo);
		return fileList;
	}




	 
	 
	 

}
