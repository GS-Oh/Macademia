package com.kh.md.sign.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.kh.md.member.vo.MemberVo;
import com.kh.md.service.SignService;
import com.kh.md.sign.vo.SignLineVo;
import com.kh.md.sign.vo.SignListVo;
import com.kh.md.sign.vo.SignVo;
import com.kh.md.work.common.PageVo;
import com.kh.md.work.common.Pagination;
import com.kh.md.work.vo.WorkVo;

@Controller
@RequestMapping("sign")
public class SignController {
	
	@Autowired
	private SignService service;

	@GetMapping("list/{pno}")
	public String signList(HttpSession session, Model model,@PathVariable int pno) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String no = loginMember.getNo();
		
		  Map map = new HashMap(); map.put("no", no);
		

			int totalCount = service.selectTotalCnt(no);
			
			PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		  
		List<SignListVo> slVo = service.selectSignList(map, pv);
		System.out.println(slVo);
		model.addAttribute("pv", pv);
		model.addAttribute("slVo", slVo);
		
		
		
	
		
		
		return "/sign/signList";
		
	}
	@GetMapping("write")
	public String signWrtie(Model model, HttpSession session) {
		MemberVo loginMember= (MemberVo) session.getAttribute("loginMember");
		model.addAttribute("loginMember", loginMember);
		List<MemberVo> memberList = service.getMemberAll();
		model.addAttribute("memberList", memberList);
		
		return "/sign/write";
	}
	@GetMapping("complateSign/{pno}")
	public String ComplateSign(HttpSession session, Model model, @PathVariable int pno){
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
		SignVo sVo = new SignVo();
		sVo.setENo(memberNo);
		
		int totalCount = service.completeTotalCnt(memberNo);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		List<SignVo> cList = service.completeList(sVo, pv);
		model.addAttribute("pv", pv);
		model.addAttribute("cList",cList);
		
		return "/sign/complateSign";
	}
	@GetMapping("reference/{pno}")
	public String reference(HttpSession session, Model model, @PathVariable int pno) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		
		String memberNo = loginMember.getNo();
		SignVo sVo = new SignVo();
		sVo.setENo(memberNo);
		
		int totalCount = service.companionTotalCnt(memberNo);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		
		List<SignVo> cList = service.companionList(sVo, pv);
		model.addAttribute("pv", pv);
		model.addAttribute("cList",cList);
		
		
		
		return "/sign/reference";
	}
	@GetMapping("deptList")
	@ResponseBody
	public List<MemberVo> deptList(HttpServletRequest req ) {
		String dept = req.getParameter("dept");
		List<MemberVo> list = service.getDeptMember(dept);
		
		return list;
		
	}
	@PostMapping("signWrite")
	@ResponseBody
	public int signWrite(HttpServletRequest req,HttpSession session,String line) {
		String  title= req.getParameter("title");
		String  type= req.getParameter("type");
		String  content= req.getParameter("content");
		String  sTypeNo= req.getParameter("sTypeNo");
		MemberVo loginMember= (MemberVo) session.getAttribute("loginMember");
		String loginMemberNo = loginMember.getNo();
		ArrayList<String> al = new ArrayList<String>();
		al.add(loginMemberNo);
		
		Gson gson = new Gson();
		ArrayList<String> a2 = gson.fromJson(line, ArrayList.class);
		/* String[] line = req.getParameterValues("line"); */
		String no = loginMember.getNo();
		
		SignVo vo = new SignVo();
		vo.setSTitle(title);
		vo.setSTypeNo(type);
		vo.setSContent(content);
		vo.setENo(no);
		al.addAll(a2);
		int result = service.signWrite(vo, al);
		SignVo sVo = new SignVo();
		String sNo = sVo.getSign();
		SignLineVo slVo = new SignLineVo();
		slVo.setSNo(sNo);
		int result2 = service.signFirst(loginMemberNo);
		
		return 1;
		
	}
	
	@GetMapping("signDetail/{no}")
	public String signDetail(@PathVariable String no, Model model, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		SignVo signOne = service.selectSignOne(no);
		List<SignLineVo> signLine = service.selectSignLine(no);
		System.out.println(signOne);
		model.addAttribute("signOne",signOne);
		model.addAttribute("signLine" ,signLine);
		model.addAttribute("loginMember", loginMember);
		
		return "/sign/signDetail";
	}
	@GetMapping("completeDetail/{no}")
	public String completeDetail(@PathVariable String no, Model model, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		SignVo signOne = service.selectSignOne(no);
		List<SignLineVo> signLine = service.selectSignLine(no);
		System.out.println(signOne);
		model.addAttribute("signOne",signOne);
		model.addAttribute("signLine" ,signLine);
		model.addAttribute("loginMember", loginMember);
		
		return "/sign/completeDetail";
	}
	@GetMapping("companionDetail/{no}")
	public String companionDetail(@PathVariable String no, Model model, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		SignVo signOne = service.selectSignOne(no);
		List<SignLineVo> signLine = service.selectSignLine(no);
		System.out.println(signOne);
		model.addAttribute("signOne",signOne);
		model.addAttribute("signLine" ,signLine);
		model.addAttribute("loginMember", loginMember);
		
		return "/sign/companionDetail";
	}
	
	
	@PostMapping("updateSign")
	@ResponseBody
	public int updateSign(String signNo, String loginNo) {
		int result;
		System.out.println(signNo);
		System.out.println(loginNo);
		 Map map = new HashMap();
		 map.put("signNo", signNo);
		 map.put("loginNo", loginNo);
		 
		 result = service.updateSign(map);
		 
		 int signMax = service.signMax(map);
		 int myLevel = service.myLevel(map);
		 
		 if(signMax==myLevel) {
			 result = service.updateSignAll(map);
		 }
		
		
		return result;
		
	}
	@PostMapping("companionSign")
	@ResponseBody
	public int companionSign(String signNo,String loginNo) {
		Map map = new HashMap();
		map.put("signNo", signNo);
		map.put("loginNo", loginNo);
		int result = service.companionSign(map);
		int result2 = service.companion(map);
		
		return result;
			
	}
	
	@GetMapping("mySign/{pno}")
	public String mySign(HttpSession session, Model model, @PathVariable int pno) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
		
		int totalCount = service.mySignTotalCnt(memberNo);
		
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 10);
		SignVo sVo = new SignVo();
		sVo.setENo(memberNo);
		List<SignVo> mySign = service.getMySign(sVo, pv);
		model.addAttribute("mySign", mySign);
		model.addAttribute("pv", pv);
		
		return "/sign/mySign";
	}
	
	@GetMapping("mySignDetail/{no}")
	public String mySignDetail(@PathVariable String no, HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		SignVo signOne = service.selectSignOne(no);
		List<SignLineVo> signLine = service.selectSignLine(no);
		SignLineVo  lineOne = new SignLineVo();
		lineOne.setSNo(no);
		SignLineVo signLineOne = service.modifyNot(lineOne);
		
		System.out.println(signOne);
		model.addAttribute("signOne",signOne);
		model.addAttribute("signLine" ,signLine);
		model.addAttribute("loginMember", loginMember);
		model.addAttribute("signLineOne", signLineOne);
		
		return "/sign/mySignDetail";
	}
	@GetMapping("signModify/{no}")
	public String signModify(@PathVariable String no,HttpSession session, Model model) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		SignVo signOne = service.selectSignOne(no);
		List<SignLineVo> signLine = service.selectSignLine(no);
		System.out.println(signOne);
		model.addAttribute("signOne",signOne);
		model.addAttribute("signLine" ,signLine);
		model.addAttribute("loginMember", loginMember);
		
		return "/sign/signModify";
		
	}
	
	
	@PostMapping("setModify/{no}")
	@ResponseBody
	public int setModify(@PathVariable String no, String title, String type, String content, HttpSession session) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
		SignVo sVo = new SignVo();
		sVo.setSNo(no);
		sVo.setENo(memberNo);
		sVo.setSTitle(title);
		sVo.setSTypeNo(type);
		sVo.setSContent(content);
		System.out.println(sVo);
		int result = service.setModify(sVo);
		
		return result;
	}
	@PostMapping("deleteSign/{no}")
	@ResponseBody
	public int deleteSign(@PathVariable String no) {
		int result = service.deleteSign(no);
				return result;
	}
//	@PostMapping("signLine")
//	@ResponseBody
//	public String signLine(HttpServletRequest req, String line,HttpSession session){
//		//String[] line = req.getParameterValues("line");
//		MemberVo loginMember=(MemberVo) session.getAttribute("loginMember");
//		SignLineVo slVo = new SignLineVo();
//		
//		String memberNo = loginMember.getNo();
//		String signFirst = "1";
//		
//		slVo.setENo(memberNo);
//		slVo.setSLevel(signFirst);
//		
//		
//		int result =service.insertSignline(slVo);
//		System.out.println();
//		
//		System.out.println("이것은signLine"+line);
//		Gson gson = new Gson();
//		ArrayList al = gson.fromJson(line, ArrayList.class);
//		System.out.println(al); 
//		
//			for (int i = 0; i < al.size(); i++) {
//		 		
//				System.out.println(al.get(i));
//			}
//		
//		
//				
//				return "" ;
//		
//		
//		
//	}
	
}
