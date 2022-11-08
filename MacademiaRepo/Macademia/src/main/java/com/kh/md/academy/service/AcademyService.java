package com.kh.md.academy.service;

import java.util.List;
import java.util.Map;

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
	List<StudentVo> showStudentList(PageVo pvo, Map<String, String> map);

	//모든 클래스 리스트 가져오기(그냥)
	List<ClassVo> selectClassList();

	//모든 클래스 리스트 가져오기(pvo)
	List<ClassVo> selectClassList(PageVo pvo, Map map);
	
	//수강생 한명 조회
	StudentVo selectOneStudent(String no);

	//페이징>전체 학생 리스트 수 조회
	int countTotalStd(Map<String, String> map);

	//페이징>전체 클래스 리스트 수 조회
	int countTotalClass(Map map);

	//수강생 정보 수정
	int updateStudent(StudentVo vo);

	//class하나 조회하기
	ClassVo selectOneClass(int cno);

	//curriculum 조회하기
	List<CurriculumVo> selectCurriculumList(int cno);

	//class>수강생 조회하기
	List<StudentVo> selectEnrolledStudent(int cno);

	//강사의 class조회
	List<ClassVo> selectClassByInstructor(String memberNo);

	//수강생 입실시간 인서트
	int insertTime(List<Map<String, String>> list);



	

	
	
}
