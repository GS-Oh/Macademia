package com.kh.md.academy.service;

import java.util.List;

import com.kh.md.academy.vo.CategoryVo;
import com.kh.md.academy.vo.ClassVo;
import com.kh.md.academy.vo.CurriculumVo;
import com.kh.md.academy.vo.StudentVo;
import com.kh.md.member.vo.MemberVo;

public interface AcademyService {

	//카테고리 보여주기
	List<CategoryVo> showCategory();

	//강사목록 보여주기
	List<MemberVo> showMember();

	//강의 인서트
	int insertClass(ClassVo vo);

	//강의에 대한 커리큘럼 인서트
	int insertCurriculum(CurriculumVo cvo);

	int insertStudent(StudentVo vo);
	
}
