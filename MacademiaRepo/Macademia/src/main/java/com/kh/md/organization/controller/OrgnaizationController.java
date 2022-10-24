package com.kh.md.organization.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.kh.md.organization.service.OrganizationService;
import com.kh.md.organization.vo.OrganizationVo;

@Controller
@RequestMapping("/organization")
public class OrgnaizationController {
	
	private final OrganizationService orgService;
	
	@Autowired
	public OrgnaizationController(OrganizationService orgService) {
		this.orgService = orgService;
	}


	@GetMapping("/tree")
	public String tree(Model model) {
		List<OrganizationVo> list = orgService.getTree();
		Gson gson = new Gson();
		String tree = gson.toJson(list);
		model.addAttribute("tree",tree);
		System.out.println(tree);
		return "organization/tree";
	}
	
}
