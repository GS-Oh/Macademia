package com.kh.md.member.service;

import java.util.List;
import java.util.Map;

import com.kh.md.file.vo.FileVo;
import com.kh.md.member.vo.MemberVo;

public interface MemberService {

	MemberVo login(MemberVo vo);

	String findPwd(Map<String, String> map);

	List<MemberVo> findListBySearch(String search);


}
