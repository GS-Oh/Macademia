package com.kh.md.academy.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.md.academy.service.AcademyService;
import com.kh.md.academy.vo.CategoryVo;
import com.kh.md.academy.vo.ClassVo;
import com.kh.md.academy.vo.CurriculumVo;
import com.kh.md.academy.vo.StudentVo;
import com.kh.md.common.FileUploader;
import com.kh.md.common.PageVo;
import com.kh.md.common.Pagination;
import com.kh.md.member.vo.MemberVo;

@Controller
@RequestMapping("academy")
public class AcademyController {
	
	private final AcademyService service;
	
	@Autowired
	public AcademyController(AcademyService service) {
		this.service = service;
	}

//화면 보여주기-----------------------------------------
	@GetMapping("roll")
	public String roll() {
		return "academy/roll";
	}
	
	@GetMapping("roll/detail")
	public String rollDetail() {
		return "academy/roll-detail";
	}
	
	@GetMapping("roll/detail/edit")
	public String rollDetailEdit() {
		return "academy/roll-detail-edit";
	}
	
	@GetMapping("search/{pno}")
	public String search(Model model, @PathVariable int pno) {
		
		int totalCount = service.countTotalStd();
		
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<StudentVo> stdList = service.showStudentList(pvo);
		
		model.addAttribute("stdList", stdList);
		model.addAttribute("pvo", pvo);
		return "academy/search";
	}
	
	@GetMapping("search/detail/{no}")
	public String searchDetail(@PathVariable String no, Model model) {
		//디비가서 수강생 한명 조회(no)
		StudentVo svo = service.selectOneStudent(no);
		
		model.addAttribute("svo", svo);
		return "academy/search-detail";
	}
	
	@GetMapping("search/detail/edit/{no}")
	public String searchDetailEdit(@PathVariable String no, Model model) {
		//디비가서 수강생 한명 조회(no)
		StudentVo svo = service.selectOneStudent(no);
		
		model.addAttribute("svo", svo);
		return "academy/search-detail-edit";
	}
	
	@GetMapping("addStd")
	public String addStudent(Model model) {
 		//모달창에 넘겨줄 모든 클래스 리스트 가져오기
// 		List<ClassVo> classList = service.selectClassList();
// 		model.addAttribute("classList", classList);
		return "academy/add-student";
	}
	
	//커리큘럼 조회(전체 클래스 리스트) 페이지 보여주기
	@GetMapping("curriculum/{pno}")
	public String curriculum(Model model, @PathVariable int pno) {
		//검색창의 카테고리 조회해오기
		List<CategoryVo> categoryList = service.showCategory();

//		Map map = new HashMap<Integer, String>();
//		map.put("no", cNo);
//		map.put("keyword", keyword);
		
		//# of total class
		int totalCount = service.countTotalClass();
		
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<ClassVo> classList = service.selectClassList(pvo);
		
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("classList", classList);
		model.addAttribute("pvo", pvo);
		
		return "academy/curriculum";
	}
	
	//커리큘럼>검색
	@PostMapping("curriculum/{pno}")
	public String searchCurriculum(@PathVariable int pno, @RequestParam("search") int cNo, @RequestParam("keyword") String keyword) {
		
		Map map = new HashMap<Integer, String>();
		map.put("no", cNo);
		map.put("keyword", keyword);
		
		int totalCount = service.countTotalClass(map);
		System.out.println("결과수 :" + totalCount);
		
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<ClassVo> classList = service.selectClassList(pvo);
		
		return "academy/curriculum";
	}
	
	//ajax로 전체 클래스 리스트 보여주기
	@GetMapping("classList/{pno}")
	@ResponseBody
	public Map showClasList(@PathVariable int pno) {
		int totalCount = service.countTotalClass();
		
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<ClassVo> classList = service.selectClassList(pvo);
		
		Map map = new HashMap<List<ClassVo>, PageVo>();
		map.put("classList", classList);
		map.put("pvo", pvo);
		
		return map;
	}
	
	@GetMapping("addCurr")
	public String addCurriculum(Model model) {
		//카테고리 목록 넘겨주면서 화면 보여주기
		List<CategoryVo> category = service.showCategory();
		List<MemberVo> member = service.showMember();
		
		model.addAttribute("category", category);
		model.addAttribute("member", member);
		return "academy/add-curriculum";
	} 	
//--------------------------------------------------
	
	//수강생 추가(인서트) 하기
 	@PostMapping("addStd")
 	public String addStudent(Model model, StudentVo vo, ClassVo cvo, HttpServletRequest req) {
 		
 		if(vo.getF() != null && !vo.getF().isEmpty()) {
 			String savePath = req.getServletContext().getRealPath("/resources/upload/profile/studentProfile/");
 	 		String changeName = FileUploader.uploadFile(vo.getF(),savePath);
 	 		vo.setProfile(changeName);
 		}

 		
 		int result = service.insertStudent(vo);
 		if(result == 1) {
 			model.addAttribute("msg", "수강생 정보가 입력되었습니다.");
 			return"academy/search";
 		}else {
 			return"error/errorPage";
 		}
 		
 	}
	
	//커리큘럼 추가(인서트) 하기
	@PostMapping("addCurr")
	public String addCurriculum(Model model, ClassVo vo, CurriculumVo cvo) {
		
		int classInsert = service.insertClass(vo);
 		
		cvo.convertToList();
		int curInsert = service.insertCurriculum(cvo);
		
		System.out.println("클래스 인서트 결과:"+classInsert);
		System.out.println("커리큘럼 인서트 결과:"+curInsert);
		
		if(classInsert * curInsert == -1) {
			model.addAttribute("msg", "새로운 커리큘럼이 생성되었습니다.");
			return "academy/curriculum";
		}else {
			return "error/errorPage";
		}
		
	}
	
	//수강생 정보 수정
	@PostMapping("search/detail/edit/{no}")
	public String searchDetailEdit(StudentVo vo) {
		
		int result = service.updateStudent(vo);
		
		return "search/detail";
	}
	
	
}//class
