package com.kh.md.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.sign.dao.SignDao;
import com.kh.md.sign.vo.SignLineVo;
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


//tqanjdla뭐임ㅅㅂㅈㄴ어이없 아아...!!!!
	
	public int signWrite(SignVo vo, String[] line) {
		//문서 작성함
		int result = dao.signWrite(sst,vo);
		System.out.println(vo.getSNo());
		
		List<SignLineVo> lineList = new ArrayList<SignLineVo>();
		
		if(line != null) {
			for(int i=0; i<line.length; i++) {
				SignLineVo slVo = new SignLineVo();
				slVo.setSNo(vo.getSNo());
				slVo.setENo(line[i]);
				slVo.setSLevel("1");
				
				lineList.add(slVo);
			}
			System.out.println(lineList);
			int slNo = dao.insertSignline(sst, lineList);
		}
//		System.out.println(slVo.getSNo()); 
//		System.out.println(slNo);
		return 1; 
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
