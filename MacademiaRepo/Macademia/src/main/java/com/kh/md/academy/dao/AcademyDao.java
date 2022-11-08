package com.kh.md.academy.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.academy.vo.CategoryVo;
import com.kh.md.academy.vo.ClassVo;
import com.kh.md.academy.vo.CurriculumVo;
import com.kh.md.academy.vo.StudentVo;
import com.kh.md.common.PageVo;
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

	//수강생리스트 셀렉트
	List<StudentVo> selectStudentList(SqlSessionTemplate sst, PageVo pvo, Map<String, String> map);

	//모든 클래스 리스트 가져오기(그냥)
	List<ClassVo> selectClassList(SqlSessionTemplate sst);

	//모든 클래스 리스트 가져오기(pvo)
	List<ClassVo> selectClassList(SqlSessionTemplate sst, PageVo pvo, Map map);
	
	//학생 한명 조회하기
	StudentVo selectOneStudent(SqlSessionTemplate sst, String no);

	//페이징> 학생 전체 수 조회
	int countTotalStd(SqlSessionTemplate sst, Map<String, String> map);

	//페이징>전체 클래스 리스트 수 조회
	int countTotalClass(SqlSessionTemplate sst, Map map);

	//수강생 정보 수정
	int updateStudent(SqlSessionTemplate sst, StudentVo vo);

	//class하나 조회하기
	ClassVo selectOneClass(SqlSessionTemplate sst, int cno);

	//curriculum 조회하기
	List<CurriculumVo> selectCurriculumList(SqlSessionTemplate sst, int cno);

	//class>수강생 조회하기
	List<StudentVo> selectEnrolledStudents(SqlSessionTemplate sst, int cno);

	//강사의 class조회
	List<ClassVo> selectListByMemNo(SqlSessionTemplate sst, String memberNo);

	//수강생 입실시간 인서트
	int insertTime(SqlSessionTemplate sst, List<Map<String, String>> list);



}
