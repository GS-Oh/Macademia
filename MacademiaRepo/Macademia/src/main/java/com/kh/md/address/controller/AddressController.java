package com.kh.md.address.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("address")
public class AddressController {

	@GetMapping("main")
	public String addressHome() {
		return"address/address";
	}
}
