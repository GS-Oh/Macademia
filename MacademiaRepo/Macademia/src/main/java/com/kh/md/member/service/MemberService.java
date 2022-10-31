package com.kh.md.member.service;

import java.util.List;
import java.util.Map;

import com.kh.md.file.vo.FileVo;
import com.kh.md.member.vo.MemberVo;

public interface MemberService {

	MemberVo login(MemberVo vo);
	
	List<FileVo> getPrivatefileList(String memberNo);

	List<FileVo> getFileListBySearchName(String no, String searchName);

	String findPwd(Map<String, String> map);


}
