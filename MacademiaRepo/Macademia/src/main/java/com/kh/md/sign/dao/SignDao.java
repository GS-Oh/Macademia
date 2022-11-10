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

	public SignVo selectSignOne(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.selectOne("signMapper.selectSignOne", no);
	}

	public int selectTotalCnt(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.selectOne("signMapper.selectTotalCnt", no);
	}

	public List<SignLineVo> selectSignLine(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.selectList("signMapper.selectSignLine", no);
	}

	public int updateSign(SqlSessionTemplate sst, Map map) {
		// TODO Auto-generated method stub
		return sst.update("signMapper.updateSign", map);
	}

	public int companionSign(SqlSessionTemplate sst, Map map) {
		// TODO Auto-generated method stub
		return sst.update("signMapper.updateCompanion", map);
	}

	public int companion(SqlSessionTemplate sst, Map map) {
		// TODO Auto-generated method stub
		return sst.update("signMapper.companion", map);
	}

	public List<SignVo> companionList(SqlSessionTemplate sst, SignVo sVo) {
		// TODO Auto-generated method stubs
		return sst.selectList("signMapper.companionList", sVo);
	}

	public int companionTotalCnt(SqlSessionTemplate sst, String memberNo) {
		// TODO Auto-generated method stub
		return sst.selectOne("signMapper.companionTotalCnt", memberNo);
	}

	public List<SignVo> getMySign(SqlSessionTemplate sst, SignVo sVo) {
		// TODO Auto-generated method stub
		return sst.selectList("signMapper.getMySign", sVo);
	}

	public int mySignTotalCnt(SqlSessionTemplate sst, String memberNo) {
		// TODO Auto-generated method stub
		return sst.selectOne("signMapper.mySignTotalCnt", memberNo);
	}

	public int setModify(SqlSessionTemplate sst, SignVo sVo) {
		// TODO Auto-generated method stub
		return sst.update("signMapper.setModify", sVo);
	}

	public int deleteSign(SqlSessionTemplate sst, String no) {
		// TODO Auto-generated method stub
		return sst.delete("signMapper.deleteSign",no);
	}

	public int signMax(SqlSessionTemplate sst, Map map) {
		// TODO Auto-generated method stub
		return sst.selectOne("signMapper.signMax", map);
	}

	public int myLevel(SqlSessionTemplate sst, Map map) {
		// TODO Auto-generated method stub
		return sst.selectOne("signMapper.myLevel", map);
	}

	public int updateSignAll(SqlSessionTemplate sst, Map map) {
		// TODO Auto-generated method stub
		return sst.update("signMapper.updateSignAll", map);
	}

	public int completeTotalCnt(SqlSessionTemplate sst, String memberNo) {
		// TODO Auto-generated method stub
		return sst.selectOne("signMapper.completeTotalCnt", memberNo);
	}

	public List<SignVo> completeList(SqlSessionTemplate sst, SignVo sVo) {
		// TODO Auto-generated method stub
		return sst.selectList("signMapper.completeList", sVo);
	}

	public SignLineVo modifyNot(SqlSessionTemplate sst, SignLineVo lineOne) {
		// TODO Auto-generated method stub
		return sst.selectOne("signMapper.modifyNot", lineOne);
	}

	

	

}
