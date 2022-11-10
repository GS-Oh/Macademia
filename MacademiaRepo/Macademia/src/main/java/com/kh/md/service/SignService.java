package com.kh.md.service;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.sign.dao.SignDao;
import com.kh.md.sign.vo.SignLineVo;
import com.kh.md.sign.vo.SignListVo;
import com.kh.md.sign.vo.SignVo;

@Service
public class SignService {
	@Autowired
	private SignDao dao;
	
	@Autowired
	private SqlSessionTemplate sst;
	
	
	public List<MemberVo> getMemberAll() {
		
		return dao.getMemberAll(sst);
	}


	public List<MemberVo> getDeptMember(String deptCode) {
		// TODO Auto-generated method stub
		return dao.getDeptMember(sst,deptCode);
	}



	
	public int signWrite(SignVo vo, ArrayList al) {
		//문서 작성함
		int slNo = 0;
		int result = dao.signWrite(sst,vo);
		int level = 1;
		System.out.println(vo.getSNo());
		
		List<SignLineVo> lineList = new ArrayList<SignLineVo>();
		if(al != null) {
			for(int i=0; i<al.size(); i++) {
				
				SignLineVo slVo = new SignLineVo();
				slVo.setSNo(vo.getSNo());
				slVo.setENo((String) al.get(i));
				slVo.setSLevel(level);
				level+=1;
				
				lineList.add(slVo);
			}
			System.out.println(lineList);
		 slNo = dao.insertSignline(sst, lineList);
		 
		}
//		System.out.println(slVo.getSNo()); 
//		System.out.println(slNo);
		return 1; 
	}


	public int signFirst(String loginMemberNo) {
		// TODO Auto-generated method stub
		return dao.signFirst(sst,loginMemberNo);
	}


	public List<SignListVo> selectSignList(Map map) {
		return dao.selectSignList(sst ,map);
	}


	public SignVo selectSignOne(String no) {
		// TODO Auto-generated method stub
		return dao.selectSignOne(sst, no);
	}


	public int selectTotalCnt(String no) {
		// TODO Auto-generated method stub
		return dao.selectTotalCnt(sst, no);
	}


	public List<SignLineVo> selectSignLine(String no) {
		// TODO Auto-generated method stub
		return dao.selectSignLine(sst, no);
	}


	public int updateSign(Map map) {
		// TODO Auto-generated method stub
		return dao.updateSign(sst, map);
	}


	public int companionSign(Map map) {
		// TODO Auto-generated method stub
		return dao.companionSign(sst, map);
	}


	public int companion(Map map) {
		// TODO Auto-generated method stub
		return dao.companion(sst, map);
	}


	public List<SignVo> companionList(SignVo sVo) {
		// TODO Auto-generated method stub
		return dao.companionList(sst, sVo);
	}


	public int companionTotalCnt(String memberNo) {
		// TODO Auto-generated method stub
		return dao.companionTotalCnt(sst, memberNo);
	}


	public List<SignVo> getMySign(SignVo sVo) {
		// TODO Auto-generated method stub
		return dao.getMySign(sst, sVo);
	}


	public int mySignTotalCnt(String memberNo) {
		// TODO Auto-generated method stub
		return dao.mySignTotalCnt(sst, memberNo);
	}


	public int setModify(SignVo sVo) {
		// TODO Auto-generated method stub
		return dao.setModify(sst, sVo);
	}


	public int deleteSign(String no) {
		// TODO Auto-generated method stub
		return dao.deleteSign(sst, no);
	}


	public int signMax(Map map) {
		// TODO Auto-generated method stub
		return dao.signMax(sst, map);
	}


	public int myLevel(Map map) {
		// TODO Auto-generated method stub
		return dao.myLevel(sst, map);
	}


	public int updateSignAll(Map map) {
		// TODO Auto-generated method stub
		return dao.updateSignAll(sst, map);
	}


	public int completeTotalCnt(String memberNo) {
		// TODO Auto-generated method stub
		return dao.completeTotalCnt(sst, memberNo);
	}


	public List<SignVo> completeList(SignVo sVo) {
		// TODO Auto-generated method stub
		return dao.completeList(sst, sVo);
	}


	public SignLineVo modifyNot(SignLineVo lineOne) {
		// TODO Auto-generated method stub
		return dao.modifyNot(sst, lineOne);
	}


	


//	public int insertSignline(SignLineVo slVo) {
//		
//		int slNo = dao.insertSignline(sst, slVo);
//		System.out.println(slVo.getSNo()); 
//		System.out.println(slNo);
//		return slNo;
//		
//	}

}
