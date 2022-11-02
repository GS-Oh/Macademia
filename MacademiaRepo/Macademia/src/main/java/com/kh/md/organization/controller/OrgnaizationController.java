package com.kh.md.organization.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.md.member.service.MemberService;
import com.kh.md.member.vo.MemberVo;
import com.kh.md.organization.service.OrganizationService;
import com.kh.md.organization.vo.OrganizationVo;
import com.kh.md.organization.vo.TreeVo;

@Controller
@RequestMapping("/organization")
public class OrgnaizationController {
	
	private final OrganizationService orgService;
	private final MemberService memberService;
	
	@Autowired
	public OrgnaizationController(OrganizationService orgService,MemberService memberService) {
		this.orgService = orgService;
		this.memberService = memberService;
	}


	@GetMapping("/tree")
	public String tree(Model model) {
		List<OrganizationVo> list = orgService.getTree();
		Gson gson = new Gson();
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
	
	@GetMapping("/tree/{deptNo}")
	public String treeDetail(@PathVariable String deptNo, Model model) {
		List<MemberVo> memberList = orgService.getTreeDetail(deptNo);
		System.out.println(memberList);
		model.addAttribute("memberList" , memberList);
		return "organization/tree-detail";
	}
	
	@GetMapping("/search/auto")
	@ResponseBody
	public String autoComplete(String search) {
		List<MemberVo> memberList = memberService.findListBySearch(search);
		Gson gson = new Gson();
		return gson.toJson(memberList);
	}
	
	@GetMapping("/search")
	public String search(String search, Model model) {
		List<MemberVo> memberList = memberService.findListBySearch(search);
		model.addAttribute("memberList",memberList);
		return "organization/member-detail";
	}
	
}
