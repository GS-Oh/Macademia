package com.kh.md.address.controller;

//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;

//@Controller
//@RequestMapping("addr")
//public class AddressController {

//	@GetMapping("list")
//	public String addressList() {
//		return "address/addressList";		
//	}
//	
//	@GetMapping("search")
//	public String addressSearch() {
//		return "address/addressSearch";
//	}
//	
//	@GetMapping("research")
//	public String reSearch() {
//		return "address/addressSerach";
//	}
//	
//	@GetMapping("result")
//	public String addressResult() {
//		return "address/addressResult";
//	}
//	
//	@GetMapping("add")
//	public String addressAdd() {
//		return "address/add";
//	}
//	
//	@GetMapping("delete")
//	public String addressDelete() {
//		return "address/delete";
//	}


import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("addr")
public class AddressController {
	

	@GetMapping("list")
	public String addressListView() {
		return "addr/list";
	}
	
	@RequestMapping("search.addr")
	public ModelAndView addressSearchView(@RequestParam(value="page", required = false)
										  HttpServletRequest request,
										  ModelAndView mv) {
		return mv;
	}
	
	@RequestMapping("research.addr")
	public ModelAndView addressSearch(@RequestParam(value="input", required = false) String input,
									  @RequestParam(value="field", required = false) String field,
									  @RequestParam(value="page", required = false) Integer page,
									  ModelAndView mv) {

		return mv;
	}
	
	@RequestMapping(value="add.addr", method = RequestMethod.POST)
	@ResponseBody
	public String addAddress(@RequestParam(value="mId", required = false)
							 HttpServletRequest request) {
			return "success";
		
	}
	
	@RequestMapping(value="minus.addr", method = RequestMethod.POST)
	@ResponseBody
	public String minusAddress(@RequestParam(value="mId", required = false)
							 HttpServletRequest request) {
		
		
			System.out.println("주소록 삭제");
			return "success";
		}
	
}

