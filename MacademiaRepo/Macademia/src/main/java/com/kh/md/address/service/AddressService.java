package com.kh.md.address.service;

import java.util.ArrayList;

import com.kh.md.address.vo.PageInfo;
import com.kh.md.member.vo.MemberVo;

public interface AddressService {

	int getListCount();
	
	ArrayList<MemberVo> selectMemebrList(PageInfo pi, String userNo);

	ArrayList<MemberVo> searchMemebrList(PageInfo pi, String input, String field);

	int addAddress(String userNo, String mNo);

	ArrayList<MemberVo> selectMyList(String userNo);

	int minusAddress(String userNo, String mNo);

}
