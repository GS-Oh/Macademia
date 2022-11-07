package com.kh.md.academy.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.academy.vo.CategoryVo;
import com.kh.md.academy.vo.ClassVo;
import com.kh.md.academy.vo.CurriculumVo;
import com.kh.md.academy.vo.StudentVo;
import com.kh.md.common.PageVo;
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

	//수강생 리스트 셀렉트
	@Override
	public List<StudentVo> selectStudentList(SqlSessionTemplate sst, PageVo pvo, Map<String, String> map) {
		
		int offset = (pvo.getCurrentPage() - 1) * pvo.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pvo.getBoardLimit());
		
		return sst.selectList("academyMapper.selectStdList", map, rb);
	}

	//모든 클래스 리스트 가져오기
	@Override
	public List<ClassVo> selectClassList(SqlSessionTemplate sst) {
		return sst.selectList("academyMapper.selectClassList", null);
	}

	//모든 클래스 리스트 가져오기(pvo)
	@Override
	public List<ClassVo> selectClassList(SqlSessionTemplate sst, PageVo pvo, Map map) {

		int offset = (pvo.getCurrentPage() - 1) * pvo.getBoardLimit();
		
		RowBounds rb = new RowBounds(offset, pvo.getBoardLimit());
		
//		System.out.println("======================");
//		System.out.println(map);
		
		return sst.selectList("academyMapper.selectClassList", map, rb);
	}

	//학생 한 명 조회
	@Override
	public StudentVo selectOneStudent(SqlSessionTemplate sst, String no) {
		return sst.selectOne("academyMapper.selectOneStudent", no);
	}

	//페이징>학생 전체 리스트 수 조회
	@Override
	public int countTotalStd(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectOne("academyMapper.selectTotalCount", map);
	}

	//페이징>전체 클래스 리스트 수 조회
	@Override
	public int countTotalClass(SqlSessionTemplate sst, Map map) {
//		System.out.println("==============");
//		System.out.println("DAO에서 map : " + map);
		int result = sst.selectOne("academyMapper.selectTotalClassCount" , map);
//		System.out.println(result);
		return result;
	}

	//수강생 정보 수정
	@Override
	public int updateStudent(SqlSessionTemplate sst, StudentVo vo) {
		System.out.println(vo);
		return sst.update("academyMapper.updateOne", vo);
	}

	//class하나 조회하기
	@Override
	public ClassVo selectOneClass(SqlSessionTemplate sst, int cno) {
		return sst.selectOne("academyMapper.selectOneClass", cno);
	}

	//curriculum 조회하기
	@Override
	public List<CurriculumVo> selectCurriculumList(SqlSessionTemplate sst, int cno) {
//		System.out.println("dao넘어온 cno : " + cno);
		return sst.selectList("academyMapper.selectCurriculumList", cno);
	}

	//class>수강생 조회하기
	@Override
	public List<StudentVo> selectEnrolledStudents(SqlSessionTemplate sst, int cno) {
		return sst.selectList("academyMapper.selectEnrolledStudents", cno);
	}

	//강사의 class조회
	@Override
	public List<ClassVo> selectListByMemNo(SqlSessionTemplate sst, String memberNo) {
		return sst.selectList("academyMapper.selectListByMemNo", memberNo);
	}



	
	
}
