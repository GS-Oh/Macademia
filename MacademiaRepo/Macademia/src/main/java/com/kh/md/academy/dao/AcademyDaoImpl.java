package com.kh.md.academy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.academy.vo.CategoryVo;
import com.kh.md.academy.vo.ClassVo;
import com.kh.md.academy.vo.CurriculumVo;
import com.kh.md.academy.vo.StudentVo;
import com.kh.md.member.vo.MemberVo;

@Repository
public class AcademyDaoImpl implements AcademyDao{

	//카테고리 보여주기
	@Override
	public List<CategoryVo> selectCategoryList(SqlSessionTemplate sst) {
		return sst.selectList("academyMapper.selectCategory", null);
	}

	@Override
	public List<MemberVo> selectInstructorList(SqlSessionTemplate sst) {
		return sst.selectList("academyMapper.selectInstructor", null);
	}

	//강의 인서트
	@Override
	public int insertClass(SqlSessionTemplate sst, ClassVo vo) {
		return sst.insert("academyMapper.insertClass", vo);
	}

	//커리큘럼 인서트
	@Override
	public int insertCurriculum(SqlSessionTemplate sst, CurriculumVo cvo) {
		return sst.insert("academyMapper.insertCurriculum", cvo);
	}
	
	//수강생 인서트
	@Override
	public int insertStudent(SqlSessionTemplate sst, StudentVo vo) {
		return sst.insert("academyMapper.insertStudent", vo);
	}

	
	
}
