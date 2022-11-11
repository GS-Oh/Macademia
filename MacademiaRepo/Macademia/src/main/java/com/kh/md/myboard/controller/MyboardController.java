package com.kh.md.myboard.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.md.common.PageVo;
import com.kh.md.common.Pagination;
import com.kh.md.member.vo.MemberVo;
import com.kh.md.myboard.service.MyboardService;
import com.kh.md.myboard.vo.MyboardVo;
import com.kh.md.myboard.vo.SearchVo;

@Controller
@RequestMapping("/myboard")
public class MyboardController {
	
	private final MyboardService myboardService;
	
	@Autowired
	public MyboardController(MyboardService myboardService) {
		this.myboardService = myboardService;
	}

	@GetMapping("/list/{pno}")
	public String getList(@PathVariable int pno, Model model, HttpSession session, SearchVo searchVo) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		searchVo.setMemberNo(loginMember.getNo());

		int totalCount = myboardService.getTotalCount(searchVo);
		PageVo pageVo = Pagination.getPageVo(totalCount, pno, 5, 10);
		List<MyboardVo> boardList = myboardService.getList(searchVo, pageVo);
		if(pageVo.getEndPage()==0) pageVo.setEndPage(1);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("searchVo", searchVo);
		return "myboard/list";
	}
}
