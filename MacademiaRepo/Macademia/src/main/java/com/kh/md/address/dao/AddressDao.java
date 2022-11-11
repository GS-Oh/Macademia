package com.kh.md.address.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.address.vo.PageInfo;
import com.kh.md.member.vo.MemberVo;

@Repository("addrDAO")
public class AddressDao {
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("addressMapper.getListCount");
	}
	
	public int getMyListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("addressMapper.getMyListCount");
	}
	
	public ArrayList<MemberVo> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getAddressLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getAddressLimit());
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectMemberList", userNo, rowBounds);
	}

	public ArrayList<MemberVo> searchMemebrList(SqlSessionTemplate sqlSession, PageInfo pi, String input, String field) {
		int offset = (pi.getCurrentPage() - 1) * pi.getAddressLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getAddressLimit());
		
		HashMap<String, String> map = new HashMap<>();
		map.put("input", input);
		map.put("field", field);
		
		return (ArrayList)sqlSession.selectList("addressMapper.searchMemebrList", map, rowBounds);
	}

	public int addAddress(SqlSessionTemplate sqlSession, String userNo, String mNo) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("mNo", mNo);
		
		return sqlSession.insert("addressMapper.addAddress", map);
	}

	public ArrayList<MemberVo> selectMyList(SqlSessionTemplate sqlSession, String userNo) {
		
		return (ArrayList)sqlSession.selectList("addressMapper.selectMyList", userNo);
	}

	public int minusAddress(SqlSessionTemplate sqlSession, String userNo, String mNo) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userNo", userNo);
		map.put("mNo", mNo);
		
		return sqlSession.insert("addressMapper.minusAddress", map);
	}
}
