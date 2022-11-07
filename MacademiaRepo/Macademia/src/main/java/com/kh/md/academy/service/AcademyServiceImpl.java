package com.kh.md.academy.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.academy.dao.AcademyDao;
import com.kh.md.academy.vo.CategoryVo;
import com.kh.md.academy.vo.ClassVo;
import com.kh.md.academy.vo.CurriculumVo;
import com.kh.md.academy.vo.StudentVo;
import com.kh.md.common.PageVo;
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
		return dao.insertStudent(sst, vo);
	}

	//수강생 리스트 셀렉트
	@Override
	public List<StudentVo> showStudentList(PageVo pvo, Map<String, String> map) {
		return dao.selectStudentList(sst, pvo, map);
	}

	//모든 클래스 리스트 가져오기(그냥)
	@Override
	public List<ClassVo> selectClassList() {
		return dao.selectClassList(sst);
	}

	//모든 클래스 리스트 보여주기
	@Override
	public List<ClassVo> selectClassList(PageVo pvo, Map map) {
		return dao.selectClassList(sst, pvo, map);
	}
	
	//수강생 한명 조회해오기
	@Override
	public StudentVo selectOneStudent(String no) {
		return dao.selectOneStudent(sst, no);
	}

	//페이징>전체 수강생리스트 수 조회
	@Override
	public int countTotalStd(Map<String, String> map) {
		return dao.countTotalStd(sst, map);
	}

	//페이징>전체 클래스 리스트 수 조회
	@Override
	public int countTotalClass(Map map) {
		return dao.countTotalClass(sst, map);
	}

	//수강생 정보 수정
	@Override
	public int updateStudent(StudentVo vo) {
		return dao.updateStudent(sst, vo);
	}

	//class하나 조회하기
	@Override
	public ClassVo selectOneClass(int cno) {
		return dao.selectOneClass(sst, cno);
	}

	//curriculum 조회하기
	@Override
	public List<CurriculumVo> selectCurriculumList(int cno) {
		return dao.selectCurriculumList(sst, cno);
	}

	//class>수강생 조회하기
	@Override
	public List<StudentVo> selectEnrolledStudent(int cno) {
		return dao.selectEnrolledStudents(sst, cno);
	}

	//강사의 class조회
	@Override
	public List<ClassVo> selectClassByInstructor(String memberNo) {
		return dao.selectListByMemNo(sst, memberNo);
	}

	//수강생 입실시간 인서트
	@Override
	public int insertTime(Map<String[], String> inputMap) {
		return dao.insertTime(sst, inputMap);
	}



	
}
