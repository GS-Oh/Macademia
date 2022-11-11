package com.kh.md.address.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.address.dao.AddressDao;
import com.kh.md.address.vo.PageInfo;
import com.kh.md.member.vo.MemberVo;

@Service("addrService")
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressDao addrDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return addrDAO.getListCount(sqlSession);
	}
	
	@Override
	public ArrayList<MemberVo> selectMemebrList(PageInfo pi, String userNo) {
		return addrDAO.selectMemberList(sqlSession, pi, userNo);
	}

	@Override
	public ArrayList<MemberVo> searchMemebrList(PageInfo pi, String input, String field) {
		return addrDAO.searchMemebrList(sqlSession, pi, input, field);
	}

	@Override
	public int addAddress(String userNo, String mNo) {
		return addrDAO.addAddress(sqlSession, userNo, mNo);
	}

	@Override
	public ArrayList<MemberVo> selectMyList(String userNo) {
		return addrDAO.selectMyList(sqlSession, userNo);
	}

	@Override
	public int minusAddress(String userNo, String mNo) {
		return addrDAO.minusAddress(sqlSession, userNo, mNo);
	}

}
