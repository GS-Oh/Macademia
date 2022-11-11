package com.kh.md.address.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.md.address.common.Pagination;
import com.kh.md.address.exception.AddressException;
import com.kh.md.address.service.AddressService;
import com.kh.md.address.vo.Address;
import com.kh.md.address.vo.PageInfo;
import com.kh.md.member.vo.MemberVo;

@Controller
public class AddressController {
	
	@Autowired
	private AddressService addrService;
	
	@RequestMapping("list.addr")
	public ModelAndView addressListView(@RequestParam(value="page", required = false) Integer page,
										HttpServletRequest request,
										ModelAndView mv) {
		
		String userNo = ((MemberVo)request.getSession().getAttribute("loginUser")).getNo();
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		ArrayList<MemberVo> list = addrService.selectMyList(userNo);
		
		if(list != null) {
			mv.addObject("list", list);
			mv.setViewName("addressListView");
			
		} else {
			throw new AddressException("내 주소록 조회에 실패했습니다.");
		}
		
		return mv;
	}
	
	@RequestMapping("search.addr")
	public ModelAndView addressSearchView(@RequestParam(value="page", required = false) Integer page,
										  HttpServletRequest request,
										  ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = addrService.getListCount();
		
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount);
		
		String userNo = ((MemberVo)request.getSession().getAttribute("loginUser")).getNo();
		
		ArrayList<MemberVo> list = addrService.selectMemebrList(pi, userNo);
		
		if(list != null) {
			mv.addObject("pi", pi);
			mv.addObject("list", list);
			mv.setViewName("addressSearchView");
			
		} else {
			throw new AddressException("주소록 조회에 실패했습니다.");
		}
		
		//return "boardListView";
		return mv;
	}
	
	@RequestMapping("research.addr")
	public ModelAndView addressSearch(@RequestParam(value="input", required = false) String input,
									  @RequestParam(value="field", required = false) String field,
									  @RequestParam(value="page", required = false) Integer page,
									  ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		System.out.println(input);
		System.out.println(field);

		int listCount = addrService.getListCount();
		
		PageInfo pi =  Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<MemberVo> list = addrService.searchMemebrList(pi, input, field);
		
		if(list != null) {
			mv.addObject("pi", pi);
			mv.addObject("list", list);
			mv.setViewName("searchResultView");
			
		} else {
			throw new AddressException("주소록 검색에 실패했습니다.");
		}
		return mv;
	}
	
	@RequestMapping(value="add.addr", method = RequestMethod.POST)
	@ResponseBody
	public String addAddress(@ModelAttribute Address addr,
							 @RequestParam(value="mNo", required = false) String mNo,
							 HttpServletRequest request) {
		
		String userNo = ((MemberVo)request.getSession().getAttribute("loginUser")).getNo();
		addr.setMyMNo(userNo);
		
		System.out.println(userNo);
		System.out.println(mNo);
		
		int result = addrService.addAddress(userNo, mNo);
		
		if(result > 0) {
			System.out.println("주소록 추가");
			return "success";
		} else {
			throw new AddressException("주소록 추가에 실패했습니다.");
		}
	}
	
	@RequestMapping(value="minus.addr", method = RequestMethod.POST)
	@ResponseBody
	public String minusAddress(@ModelAttribute Address addr,
							 @RequestParam(value="mNo", required = false) String mNo,
							 HttpServletRequest request) {
		
		String userNo = ((MemberVo)request.getSession().getAttribute("loginUser")).getNo();
		addr.setMyMNo(userNo);
		
		System.out.println(userNo);
		System.out.println(mNo);
		
		int result = addrService.minusAddress(userNo, mNo);
		
		if(result > 0) {
			System.out.println("주소록 삭제");
			return "success";
		} else {
			throw new AddressException("주소록 삭제에 실패했습니다.");
		}
	}
}

