package com.kh.md.organization.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.md.organization.service.OrganizationService;
import com.kh.md.organization.vo.OrganizationVo;
import com.kh.md.organization.vo.TreeVo;

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
		System.out.println(list);
		List<TreeVo> newList = new ArrayList<>();
		for(OrganizationVo org : list) {
			TreeVo vo = new TreeVo();
			vo.setId(org.getNo());
			vo.setParent(org.getUpperDept());
			vo.setText(org.getName());
			newList.add(vo);
		}
		
		String tree = gson.toJson(newList);
		
		model.addAttribute("tree",tree);
		return "organization/tree";
	}
	@PostMapping(value="/tree/{num}",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String treeDetail(@PathVariable String num) {
		
		return "부서번호 : "+num;
	}
	
}
