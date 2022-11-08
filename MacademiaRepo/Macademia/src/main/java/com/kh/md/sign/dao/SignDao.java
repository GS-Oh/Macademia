package com.kh.md.sign.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.sign.vo.SignLineVo;
import com.kh.md.sign.vo.SignListVo;
import com.kh.md.sign.vo.SignVo;

@Repository
public class SignDao {
	

	public List<MemberVo> getMemberAll(SqlSessionTemplate sst) {
		// TODO Auto-generated method stub
		return sst.selectList("signMapper.getListAll");
	}

	public List<MemberVo> getDeptMember(SqlSessionTemplate sst, String deptCode) {
		// TODO Auto-generated method stub
		return sst.selectList("signMapper.getListDept", deptCode);
	}

	public int signWrite(SqlSessionTemplate sst, SignVo vo) {
		// TODO Auto-generated method stub 임자 일단 시간
		return sst.insert("signMapper.signWrite", vo);
	}

	public int insertSignline(SqlSessionTemplate sst, List<SignLineVo> lineList) {
		// TODO Auto-generated method stub
		return sst.insert("signMapper.insertSignLine",lineList);
	}

	public int signFirst(SqlSessionTemplate sst, String loginMemberNo) {
		// TODO Auto-generated method stub
		return sst.update("signMapper.signFirst", loginMemberNo);
	}

	public List<SignListVo> selectSignList(SqlSessionTemplate sst,Map map) {
		return sst.selectList("signMapper.selectSignList", map);
	}

	public SignListVo selectSignOne(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.selectOne("signMapper.selectSignOne", no);
	}

	public int selectTotalCnt(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.selectOne("signMapper.selectTotalCnt", no);
	}

	

}
