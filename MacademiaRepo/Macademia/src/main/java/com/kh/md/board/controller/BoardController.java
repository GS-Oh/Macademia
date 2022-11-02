package com.kh.md.board.controller;

import java.lang.reflect.Field;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.md.board.service.BoardService;
import com.kh.md.board.util.Pagination;
import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;
import com.kh.md.board.vo.SearchCriteria;
import com.kh.md.member.vo.MemberVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	
	//자료공유 게시판
	@GetMapping("")
	public String dataList(Model model, SearchCriteria searchCriteria) {
		log.info(searchCriteria.toString());
		List<BoardVo> boardList = service.selectList(searchCriteria);
		int count = service.selectSearchCount(searchCriteria);
		PageVo pageVo = Pagination.calculate(
				searchCriteria.getPage(), 
				searchCriteria.getSize(), 
				(long)count);
		log.info(pageVo.toString());
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("queryString", getQueryString(searchCriteria));
		return "board/databoard";
	}
	
	private String getQueryString(SearchCriteria searchCriteria) {
		StringBuilder sb = new StringBuilder();
		Field[] fields = searchCriteria.getClass().getDeclaredFields();
		for(Field f: fields) {
			f.setAccessible(true);
			try {
				if(f.get(searchCriteria) == null || 
						!(f.get(searchCriteria) instanceof String)) {
					continue;
				} else {
					sb.append(f.getName() + "=" + f.get(searchCriteria))
					.append("&");
				}	
			} catch (Exception ignored) {}
		}
		return sb.toString();
	}
	//게시글 상세 조회 화면
	@GetMapping("detail/{no}")
	public String detail(@PathVariable(required = false) String no, Model model) {
		//디비 가서 게시글 1개 조회 (번호로)
		BoardVo vo = service.selectOne(no);
		model.addAttribute("vo", vo);
		return "board/detail";
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
		public String edit(@PathVariable int no, BoardVo vo, HttpSession session) {
			//DB
			vo.setNo(no);
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
		//게시판 삭제
		
		@GetMapping("delete/{no}")
		public String delete(@PathVariable String no, HttpSession session, Model model) {
			int result = service.delete(no);
			if(result == 1 ) {
				//성공 => 알람, 리스트
				session.setAttribute("alertMsg", "게시글 삭제 성공!!!");
				return "redirect:/board/";
			}else {
				//실패 => 메세지, 알람페이지
				model.addAttribute("msg", "게시글 삭제 실패...");
				return "common/errorPage";
			}
		}
}
