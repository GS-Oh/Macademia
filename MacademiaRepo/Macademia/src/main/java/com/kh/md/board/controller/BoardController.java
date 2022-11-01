package com.kh.md.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.md.board.dao.BoardDao;
import com.kh.md.board.service.BoardService;
import com.kh.md.board.service.BoardServiceImpl;
import com.kh.md.board.service.Pagination;
import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;
import com.kh.md.member.vo.MemberVo;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("board")
@RequiredArgsConstructor
public class BoardController {
	
private final BoardService service;

	//자유 게시판
	@GetMapping("main")
	public String freeBoard() {
		return "board/freeboard";
	}
	@GetMapping("detail")
	public String boardDetail() {
		return "board/detail";
	}
	@GetMapping("write")
	public String boardWrite() {
		return "board/write";
	}
	
	//게시글 목록 조회 화면
	@GetMapping("main/{pno}")
	public String list(Model model,@PathVariable int pno) {
		
		int totalCount = service.selectCountAll();
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<BoardVo> voList = service.selectList(pv);
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		
		return "board/freeboard";
	}
	//게시글 상세 조회 화면 (그냥 detail은 없어도 무방함)
	
	
	//게시글 작성
	@PostMapping("write")
	public String wirte(BoardVo vo, Model model, HttpSession session) {
		/*
		 * MemberVo loginMember = (MemberVo)session.getAttribute("loginMember"); String
		 * no = loginMember.getNo(); vo.setUserNo(no);
		 */
		
		//비즈니스 로직
		int result = service.insertBoard(vo);
		//화면 선택
		if(result == 1) {
			session.setAttribute("alertMsg", "게시글 작성 성공!");
			return "redirect:/board/data/1";
		}else {
			model.addAttribute("msg", "게시글 작성 실패,,,");
			return "error/errorPage";
		}
	}
	
	//게시글 수정 화면
	@GetMapping("edit/{no}")
	public String edit(@PathVariable String no, Model model) {
		BoardVo vo = service.selectOne(no);
		model.addAttribute("vo", vo);
		return "board/edit";
	}
	//게시글 수정 로직
	@PostMapping("edit/{no}")
	public String edit(@PathVariable String no, BoardVo vo, HttpSession session) {
		//DB
		vo.setUserNo(no);
		int result = service.updateOne(vo);
		//결과
		if(result == 1) {
			session.setAttribute("alertMsg", "게시글 수정 성공!!!");
			return "redirect:/board/detail/" + no;			
		}else {
			session.setAttribute("alertMsg", "게시글 수정 실패...");
			return "redirect:/";
		}
	}
	
	@GetMapping("delete/{no}")
	public String delete(@PathVariable String no, HttpSession session, Model model) {
		int result = service.delete(no);
		if(result == 1 ) {
			//성공 => 알람, 리스트
			session.setAttribute("alertMsg", "게시글 삭제 성공!!!");
			return "redirect:/board/data/1";
		}else {
			//실패 => 메세지, 알람페이지
			model.addAttribute("msg", "게시글 삭제 실패...");
			return "common/errorPage";
		}
	}
	
	//자료공유 게시판
	@GetMapping("data/{pno}")
	public String dataList(Model model,@PathVariable int pno) {
				
		int totalCount = service.selectCountAll();
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<BoardVo> voList = service.selectList(pv);
		model.addAttribute("voList", voList);
		model.addAttribute("pv", pv);
		
		return "board/databoard";
	}
	
	//게시글 상세 조회 화면
	@GetMapping("detail/{no}")
	public String detail(@PathVariable(required = false) String no, Model model) {
		//디비 가서 게시글 1개 조회 (번호로)
		BoardVo vo = service.selectOne(no);
		model.addAttribute("vo", vo);
		return "board/detail";
	}
	
	//게시글 작성
	@PostMapping("data/write")
	public String wirteBoard(BoardVo vo, Model model, HttpSession session) {
			MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
			String no = loginMember.getNo();
			vo.setUserNo(no);
			
			//비즈니스 로직
			int result = service.insertBoard(vo);
			//화면 선택
			if(result == 1) {
				session.setAttribute("alertMsg", "게시글 작성 성공!");
				return "redirect:/board/data/1";
			}else {
				model.addAttribute("msg", "게시글 작성 실패,,,");
				return "error/errorPage";
			}
	}

	//게시글 검색
	@GetMapping("search/{pno}")
	public String searchBoard(@RequestParam(value = "condition")  String condition, @RequestParam(value = "keyword") String keyword, Model model, @PathVariable int pno) {
		
		if(pno == 0) {
			pno = 1;
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int totalCount = service.selectSearchCount(map);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		List<BoardVo> list = service.searchList(pv, map);
		
		return "board/data";
	}
}
