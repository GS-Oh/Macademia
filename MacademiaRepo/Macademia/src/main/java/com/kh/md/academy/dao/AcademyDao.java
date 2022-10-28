package com.kh.md.academy.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.academy.vo.CategoryVo;
import com.kh.md.academy.vo.ClassVo;
import com.kh.md.academy.vo.CurriculumVo;
import com.kh.md.academy.vo.StudentVo;
import com.kh.md.member.vo.MemberVo;

public interface AcademyDao {

	//강의카테고리목록 보여주기
	List<CategoryVo> selectCategoryList(SqlSessionTemplate sst);

	//강사목록 보여주기
	List<MemberVo> selectInstructorList(SqlSessionTemplate sst);

	//강의 인서트하기
	int insertClass(SqlSessionTemplate sst, ClassVo vo);

	//커리큘럼 인서트하기
	int insertCurriculum(SqlSessionTemplate sst, CurriculumVo cvo);

	//수강생 인서트
	int insertStudent(SqlSessionTemplate sst, StudentVo vo);
	
}
