package com.kh.md.academy.service;

import java.util.List;

import com.kh.md.academy.vo.CategoryVo;
import com.kh.md.academy.vo.ClassVo;
import com.kh.md.academy.vo.CurriculumVo;
import com.kh.md.academy.vo.StudentVo;
import com.kh.md.common.PageVo;
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

	//수강생 인서트
	int insertStudent(StudentVo vo);

	//전체 수강생 리스트 보여주기
	List<StudentVo> showStudentList(PageVo pvo);

	//모든 클래스 리스트 가져오기(그냥)
	List<ClassVo> selectClassList();

	//모든 클래스 리스트 가져오기(pvo)
	List<ClassVo> selectClassList(PageVo pvo);
	
	//수강생 한명 조회
	StudentVo selectOneStudent(String no);

	//페이징>전체 학생 리스트 수 조회
	int countTotalStd();

	//페이징>전체 클래스 리스트 수 조회
	int countTotalClass();


	
	
}
