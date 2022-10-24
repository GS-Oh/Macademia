package com.kh.md.address.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("addr")
public class AddressController {

	@GetMapping("list")
	public String addressList() {
		return "address/addressList";		
	}
	
	@GetMapping("search")
	public String addressSearch() {
		return "address/addressSearch";
	}
	
	@GetMapping("research")
	public String reSearch() {
		return "address/addressSerach";
	}
	
	@GetMapping("result")
	public String addressResult() {
		return "address/addressResult";
	}
	
	@GetMapping("add")
	public String addressAdd() {
		return "address/add";
	}
	
	@GetMapping("delete")
	public String addressDelete() {
		return "address/delete";
	}
	
}
