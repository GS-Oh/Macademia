package com.kh.md.myboard.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.md.board.util.Pagination;
import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;
import com.kh.md.member.vo.MyboardSearchVo;

@Controller
@RequestMapping("/myboard")
public class MyboardController {
	
	@GetMapping("/list")
	public String dataList(Model model, Integer boardCategory, MyboardSearchVo myboardSearchVo) {
		System.out.println(boardCategory);
		System.out.println(myboardSearchVo);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 40);
		List<BoardVo> boardList = null;
		int count = 0 ;
		if(boardCategory==null || boardCategory==1) {
			System.out.println("자유게시판 검색 진입");
			boardList = boardService.selectListFreeBoard(searchCriteria);
			count = boardService.selectSearchCountFreeBoard(searchCriteria);
		}else if(boardCategory==2) {
			System.out.println("자료공유게시판 검색 진입");
			boardList = boardService.selectList(searchCriteria);
			count = boardService.selectSearchCount(searchCriteria);
		}
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("searchCriteria", searchCriteria);
		return "member/myboard";
	}
}
