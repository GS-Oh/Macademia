package com.kh.md.work.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.work.common.PageVo;
import com.kh.md.work.common.Pagination;
import com.kh.md.work.service.WorkService;
import com.kh.md.work.vo.WorkVo;

import lombok.Data;

@Controller
@RequestMapping("work")
public class WorkController {
	
	@Autowired
	private WorkService service;
	
	@GetMapping("list/{pno}")
	public String workListTest(Model model, HttpSession session, @PathVariable int pno) {
		
		MemberVo loginMember =(MemberVo) session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
		System.out.println("로그인 한 멤버 의" + memberNo);
		WorkVo workVo = new WorkVo();
		workVo.setWSlaveNo(memberNo);
		String slaveNo = workVo.getWSlaveNo();
		
		int totalCount = service.selectTotalCnt(slaveNo);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		
		
		
		
		List<WorkVo> wList = service.getSlaveList(workVo, pv);
		model.addAttribute("pv", pv);
		model.addAttribute("wList", wList);
		
		
		return "/work/workList";
	}
	
	@GetMapping("bossList/{pno}")
	public String workBossList(HttpSession session, Model model,@PathVariable int pno) {
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
		WorkVo workVo = new WorkVo();
		workVo.setMemberNo(memberNo);
		
		int totalCount = service.selectBossTotalCnt(memberNo);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		List<WorkVo> wList = service.getBossList(workVo, pv);
		model.addAttribute("pv", pv);
		model.addAttribute("wList",wList);
	
		return "/work/workBossList";
		
		
	}
	
	@GetMapping("write")
	public String workWrite(HttpSession session, Model model) {
		
		MemberVo loginMember= (MemberVo) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		System.out.println("로그인한" +loginMember);
		List<MemberVo> memberList = service.getMemberAll();
		System.out.println(memberList);
		model.addAttribute("memberList", memberList);
		
		return "/work/workWrite";
	}
	
	@GetMapping("complate/{pno}")
	public String workComplate(HttpSession session,Model model,@PathVariable int pno) {
		MemberVo loginMember =(MemberVo)session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
		WorkVo workVo = new WorkVo();
		
		workVo.setWSlaveNo(memberNo);
		String slaveNo = workVo.getWSlaveNo();
		
		int totalCount = service.selectCompleteTotalCnt(slaveNo);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		
		
		List<WorkVo> wList = service.getCompleteList(workVo, pv);
		model.addAttribute("pv", pv);
		model.addAttribute("wList",wList);
	
		
		return "/work/workComplate";
	}
	@GetMapping("slaveDetail/{no}")
	public String workDetail(@PathVariable String no,Model model,HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		WorkVo vo = service.slaveOne(no);
		model.addAttribute("vo", vo);
		
		return "/work/workDetail";
	}
	@GetMapping("completeDatail/{no}")
	public String completeDatail(@PathVariable String no,Model model,HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		WorkVo vo = service.slaveOne(no);
		model.addAttribute("vo", vo);
		
		return "/work/workCompleteDetail";
	}
	
	
	@GetMapping("bossDetail/{no}")
	public String workbossDetail(@PathVariable String no,Model model,HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		WorkVo vo = service.BossOne(no);
		model.addAttribute("vo", vo);
		
		return "/work/workBossDetail";
	}
	

	
	@GetMapping("deptList")
	@ResponseBody
	public List<MemberVo> deptList(HttpServletRequest req ) {
		String dept = req.getParameter("dept");
	
		List<MemberVo> list = service.getDeptMember(dept);
		System.out.println(list);
		
		return list;
		
	}
	@PostMapping("workWrite")
	@ResponseBody
	public int workWrite(HttpServletRequest req, HttpSession session) {
		String wNo =req.getParameter("wNo");
		String selectWork =req.getParameter("select");
		String title =req.getParameter("title");
		String content =req.getParameter("content");
		String deadLine =req.getParameter("deadLine");
		
		System.out.println(wNo);
		System.out.println(selectWork);
		System.out.println(title);
		System.out.println(content);
		System.out.println(deadLine);
		
		
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String mNo = loginMember.getNo();
		WorkVo vo = new WorkVo();
		vo.setWSlaveNo(wNo);
		vo.setWBossNo(mNo);
		vo.setWContent(content);
		vo.setWType(selectWork);
		vo.setWTitle(title);
		vo.setWDeadLine(deadLine);
		System.out.println(vo);
		int result = service.workWrite(vo);
		
		
		return result;
		
		
	}
	@PostMapping("workComplete/{no}")
	@ResponseBody
	public int workComplete(@PathVariable String no) {
		int result = service.workComplete(no);
		return result;
		
		
	}
	@GetMapping("workModify/{no}")
	public String workGetModify(@PathVariable String no, Model model) {
		WorkVo vo  = service.getModify(no);
		model.addAttribute("vo", vo);
		
		return "/work/workModify";
		
	}
	
	@PostMapping("workModify/{no}")
	@ResponseBody
	public int workModify(@PathVariable String no, String select, String title, String deadLine, String content){
		WorkVo vo = new WorkVo();
		vo.setWTitle(title);
		vo.setWDeadLine(deadLine);
		vo.setWType(select);
		vo.setWContent(content);
		vo.setWNo(no);
		int result = service.setModify(vo);
		
		
		
		/* int result = service.workModify(no); */
		return 1;
	}
	
	@PostMapping("workDelete/{no}")
	@ResponseBody
	public int workDelete(@PathVariable String no) {
		int result = service.workDelete(no);
		return result;
	}
	
	
	
	
	
}
