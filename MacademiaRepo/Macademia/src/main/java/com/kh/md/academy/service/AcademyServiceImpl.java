package com.kh.md.academy.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.academy.dao.AcademyDao;
import com.kh.md.academy.vo.CategoryVo;
import com.kh.md.academy.vo.ClassVo;
import com.kh.md.academy.vo.CurriculumVo;
import com.kh.md.academy.vo.StudentVo;
import com.kh.md.member.vo.MemberVo;

@Service
public class AcademyServiceImpl implements AcademyService{

	private final AcademyDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public AcademyServiceImpl(AcademyDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//카테고리 보여주기
	@Override
	public List<CategoryVo> showCategory() {
		return dao.selectCategoryList(sst);
	}

	//강사목록 보여주기
	@Override
	public List<MemberVo> showMember() {
		return dao.selectInstructorList(sst);
	}

	//새 강의 정보 인서트
	@Override
	public int insertClass(ClassVo vo) {
		return dao.insertClass(sst, vo);
	}

	//새 강의의 커리큘럼 인서트
	@Override
	public int insertCurriculum(CurriculumVo cvo) {
		return dao.insertCurriculum(sst, cvo);
	}

	//수강생 인서트
	@Override
	public int insertStudent(StudentVo vo) {
		System.out.println("dob:"+vo.getBirth());
		System.out.println("gender:"+vo.getGender());
		return dao.insertStudent(sst, vo);
	}

}
