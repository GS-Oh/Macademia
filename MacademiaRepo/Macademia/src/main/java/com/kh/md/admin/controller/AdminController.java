package com.kh.md.admin.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.kh.md.admin.common.Pagination;
import com.kh.md.admin.exception.AdminException;
import com.kh.md.admin.service.AdminService;
import com.kh.md.admin.vo.Dept;
import com.kh.md.admin.vo.PageInfo;
import com.kh.md.admin.vo.Report;
import com.kh.md.admin.vo.Position;
import com.kh.md.member.vo.MemberVo;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	@GetMapping("admin/main")
	public String adminPage(){
		return "admin/memberList";
	}
	
    /**
     * 사원 목록 조회
     */
	@RequestMapping("admin/mlist.ad")
	public ModelAndView selectMemberList(@RequestParam(value="page", required=false) Integer page, 
										@RequestParam(value="message", required=false) String message, ModelAndView mv) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
		
		ArrayList<Integer> memberCount = aService.getMemberCount();
		ArrayList<MemberVo> mList = aService.selectMemberList(pi);
		ArrayList<MemberVo> mList2 = aService.selectMemberList(null); // 사원 이름 검색시 자동완성 기능 제공하기 위한 memberList
		ArrayList<Dept> dList = aService.selectDeptList();
		ArrayList<Position> pList = aService.selectPosiList();
		
		if(memberCount != null && mList != null && mList2 != null && dList != null && pList != null) {
			mv.addObject("memberCount", memberCount);
			mv.addObject("pi", pi);
			mv.addObject("mList", mList);
			mv.addObject("mList2", mList2);
			mv.addObject("dList", dList);
			mv.addObject("pList", pList);
			mv.addObject("message", message);
			mv.setViewName("admin/memberList");
		} else {
			throw new AdminException("멤버 리스트 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
    /**
     * 사원 검색
     */	
	@RequestMapping("admin/msearch.ad")
	public ModelAndView selectSearchMemberList(@RequestParam(value="page", required=false) Integer page, 
										 @RequestParam(value="selectDept", required=false) String selectDept,
										 @RequestParam(value="selectPosi",  required=false) String selectPosi,
										 @RequestParam(value="searchValue", required=false) String searchValue, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap();
		map.put("selectDept", selectDept);
		map.put("selectPosi", selectPosi);
		map.put("searchValue", searchValue.trim());

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getSearchListCount(map);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);

		ArrayList<Integer> memberCount = aService.getMemberCount();
		ArrayList<MemberVo> mList = aService.selectSearchMemberList(pi, map);
		ArrayList<MemberVo> mList2 = aService.selectMemberList(null);
		ArrayList<Dept> dList = aService.selectDeptList();
		ArrayList<Position> pList = aService.selectPosiList();
	
		if(memberCount != null && mList != null && mList2 != null && dList != null && pList != null) {
			mv.addObject("memberCount", memberCount);
			mv.addObject("pi", pi);
			mv.addObject("mList", mList);
			mv.addObject("mList2", mList2);
			mv.addObject("dList", dList);
			mv.addObject("pList", pList);
			mv.addObject("selectDept", selectDept);
			mv.addObject("selectPosi", selectPosi);
			mv.addObject("searchValue", searchValue);
			mv.setViewName("admin/memberList");
		} else {
			throw new AdminException("멤버 검색 결과 조회에 실패하였습니다.");
		}
		return mv;
	}
	
    /**
     * 사원 정보 수정(여러 명)
     */
	@RequestMapping("admin/mupdatemulti.ad")
	public String updateMultiMember(@RequestParam("no") String[] noArr, 
									@RequestParam("quitYn") String quitYn, 
									HttpSession session) {
		
		int result = aService.updateMultiMember(noArr, quitYn);
		
		if (result == 1) {
			MemberVo loginUser = (MemberVo)session.getAttribute("loginMember");
			String loginUserNo = loginUser.getNo();
			
			for (String no : noArr) {
				if (loginUserNo.equals(no)) {
					session.invalidate();
					return "redirect:/";
				}
			}
		}
		
		if (result != noArr.length) {
			throw new AdminException("멤버 정보 수정에 실패하였습니다.");
		}
		
		return "redirect:/admin/mlist.ad?message=u";
	}
	
	/**
     * 사원 삭제
     */
	@RequestMapping("admin/mdelete.ad")
	public String deleteMember(@RequestParam("no") String[] noArr, HttpSession session) {
		
		int result = aService.deleteMember(noArr);
		
		MemberVo loginUser = (MemberVo)session.getAttribute("loginMember");
		String loginUserNo = loginUser.getNo();
		
		for (String no : noArr) {
			if (loginUserNo.equals(no)) {
				session.invalidate();
				return "redirect:/";
			}
		}
		
		if (result != noArr.length) {
			throw new AdminException("멤버 삭제에 실패하였습니다.");
		}
		
		return "redirect:/admin/mlist.ad?message=d";
	}	
	
    /**
     * 사원 상새
     */
	@RequestMapping("admin/mdetail.ad")
	public ModelAndView memberDetail(@RequestParam("no") String no, @RequestParam("page") int page, 
									 @RequestParam(value="selectDept", required=false) String selectDept,
									 @RequestParam(value="selectPosi",  required=false) String selectPosi,
									 @RequestParam(value="searchValue", required=false) String searchValue, 
									 @RequestParam(value="message", required=false) String message, ModelAndView mv) {
		MemberVo member = aService.selectMember(no);
		ArrayList<Dept> dList = aService.selectDeptList();
		ArrayList<Position> pList = aService.selectPosiList();
		
		if (member != null && dList != null && pList != null) {
			mv.addObject("member", member);
			mv.addObject("dList", dList);
			mv.addObject("pList", pList);
			mv.addObject("page", page);
			mv.addObject("selectDept", selectDept);
			mv.addObject("selectPosi", selectPosi);
			mv.addObject("searchValue", searchValue);
			mv.addObject("message", message);
			mv.setViewName("admin/memberDetail");
		} else {
			throw new AdminException("멤버 상세 조회에 실패하였습니다.");
		}
		
		return mv;
	}
	
    /**
     * 사원 정보 수정(1명)
     */
	@RequestMapping("admin/mupdate.ad")
	public String updateMember(@ModelAttribute MemberVo m, @RequestParam("inputStartDate") String inputStartDate, 
							   @RequestParam("inputEndDate") String inputQuitDate, @RequestParam("page") int page,
							   @RequestParam(value="selectDept", required=false) String selectDept,
							   @RequestParam(value="selectPosi",  required=false) String selectPosi,
							   @RequestParam(value="searchValue", required=false) String searchValue, Model model, HttpSession session) {
		if (!inputStartDate.equals("")) {
			String[] hSplit = inputStartDate.split("-");
			int sYear = Integer.parseInt(hSplit[0]);
			int sMonth = Integer.parseInt(hSplit[1]) - 1;
			int sDate = Integer.parseInt(hSplit[2]);
			Date startDate = new Date(new GregorianCalendar(sYear, sMonth, sDate).getTimeInMillis());
//			m.setStartDate(startDate);
		}
		
		if(!inputQuitDate.equals("")) {
			String[] eSplit = inputQuitDate.split("-");
			int eYear = Integer.parseInt(eSplit[0]);
			int eMonth = Integer.parseInt(eSplit[1]) - 1;
			int eDate = Integer.parseInt(eSplit[2]);
			Date QuitDate = new Date(new GregorianCalendar(eYear, eMonth, eDate).getTimeInMillis());	
//			m.setQuitDate(QuitDate);
		}
		
		if (m.getGrade() == null) {
			m.setGrade("N");
		}
		
		int result = aService.updateMember(m);
		
		if (result <= 0) {
			throw new AdminException("멤버 정보 수정에 실패하였습니다.");
		}
		
		MemberVo loginUser = (MemberVo)session.getAttribute("loginMember");
		String loginUserNo = loginUser.getNo();
			
		if (loginUserNo.equals(m.getNo())) {
			MemberVo loginMember = aService.selectMember(m.getNo());
			session.setAttribute("loginUser", loginMember);
		}
		

		model.addAttribute("no", m.getNo()).addAttribute("message", "success").addAttribute("page", page);
		model.addAttribute("selectDept", selectDept).addAttribute("selectPosi", selectPosi).addAttribute("searchValue", searchValue);
		
		return "redirect:/admin/mdetail.ad";
	}
	
    /**
     * 직위 목록
     */
	@RequestMapping("admin/posilist.ad")
	public String selectPosiList(Model model) {
		
		ArrayList<Position> pList = aService.selectPosiList();
		
		if(pList != null) {
			model.addAttribute("pList", pList);
		} else {
			throw new AdminException("직위 목록 조회에 실패하였습니다.");
		}
		
		return "admin/posiList";
	}
	
    /**
     * 직위 삭제
     */
	@RequestMapping("admin/pdelete.ad")
	public void deletePosi(@RequestParam("noArr") String[] positionNoArr, HttpServletResponse response) {
		
		int result = aService.deletePosi(positionNoArr);
		
		if (result != positionNoArr.length) {
			throw new AdminException("직위 삭제에 실패하였습니다.");
		}
		
		ArrayList<Position> pList = aService.selectPosiList();
		if(pList == null) {
			throw new AdminException("직위 목록을 불러오는데 실패하였습니다.");
		} 
		
		Gson gson = new Gson();
		try {
			gson.toJson(pList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}	
	
    /**
     * 직위 등록
     */
	@RequestMapping("admin/pinsert.ad")
	public void insertPosi(@ModelAttribute Position position, HttpServletResponse response) {
		
		int result = aService.insertPosi(position);
		
		if (result <= 0) {
			throw new AdminException("직위 등록에 실패하였습니다.");
		}
		
		ArrayList<Position> pList = aService.selectPosiList();
		if(pList == null) {
			throw new AdminException("직위 목록을 불러오는데 실패하였습니다.");
		} 
		
		Gson gson = new Gson();
		try {
			gson.toJson(pList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
    /**
     * 직위 수정
     */
	@RequestMapping("admin/pupdate.ad")
	public void updatePosi(@ModelAttribute Position position, HttpServletResponse response) {
		
		int result = aService.updatePosi(position);
		
		if (result <= 0) {
			throw new AdminException("직위 수정에 실패하였습니다.");
		}
		
		ArrayList<Position> pList = aService.selectPosiList();
		if(pList == null) {
			throw new AdminException("직위 목록을 불러오는데 실패하였습니다.");
		} 
		
		Gson gson = new Gson();
		try {
			gson.toJson(pList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
	}
	
    /**
     * 부서 목록 조회
     */
	@RequestMapping("admin/deptlist.ad")
	public String selectDeptList(Model model, @RequestParam(value="message", required=false) String message) {
		
		ArrayList<Dept> dList = aService.selectDeptList();
		ArrayList<MemberVo> mList = aService.selectDeptMemberList(null);
		
		if(dList != null && mList != null) {
			model.addAttribute("dList", dList);
			model.addAttribute("mList", mList);
			model.addAttribute("message", message);
		} else {
			throw new AdminException("직위 목록 조회에 실패하였습니다.");
		}
		
		return "admin/deptList";		
	}	
	
    /**
     * 하위 부서 및 부서원 목록 조회
     */
	@RequestMapping("admin/subDeptList.ad")
	@ResponseBody
	public String getSubDeptList(@RequestParam("upperDept") Integer upperDept) {
		
		ArrayList<Dept> subDeptList = aService.getSubDeptList(upperDept);
		ArrayList<MemberVo> deptMemberList = aService.selectDeptMemberList(upperDept);
		
		if(subDeptList == null || deptMemberList == null) {
			throw new AdminException("하위 부서 목록 불러오기에 실패하였습니다.");
		}
		
		// 해당 부서의 하위 부서 목록과 부서원 목록을 한 JSONArry에 담아서 view로 전송
		JSONArray jArr = new JSONArray();
		JSONObject Posij = null;
		for (MemberVo m : deptMemberList) {
			Posij = new JSONObject();
			Posij.put("nodeId", m.getNo());
			Posij.put("nodeType", "member");
			Posij.put("nodeName", m.getDeptName());
//			Posij.put("hasChildren", null);
			Posij.put("PositionName", m.getPositionName());
			
			jArr.add(Posij);
		}
		
		for (Dept d : subDeptList) {
			Posij = new JSONObject();
			Posij.put("nodeId", d.getDeptNo());
			Posij.put("nodeType", "dept");
			Posij.put("nodeName", d.getDeptName());
//			Posij.put("hasChildren", d.getHasChildren());
			Posij.put("PositionName", null);
			
			jArr.add(Posij);
		}
		
		return jArr.toJSONString();
	}
	
    /**
     * 부서 등록
     */
	@RequestMapping("admin/dinsert.ad")
	public void insertDept(@ModelAttribute Dept dept, HttpServletResponse response) {
		
		if (dept.getUpperDept() != null) {
			ArrayList<Dept> subDeptList = aService.getSubDeptList(dept.getUpperDept());
//			dept.setDeptOrder(subDeptList.size() + 1); // 같은 상위부서를 가지고 있는 하위부서 목록에서 정렬순서가 마지막이 되도록 설정
//		} else {
//			dept.setDeptOrder(1);
		}
		
		Dept d = aService.insertDept(dept);
		if (d == null) {
			throw new AdminException("부서 등록에 실패하였습니다.");
		}
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		try {
			gson.toJson(d, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
    /**
     * 부서 삭제
     */
	@RequestMapping("admin/ddelete.ad")
	public String deleteDept(@RequestParam("deptNo") int deptNo, @RequestParam("upperDeptNo") int upperDeptNo) {
		
		// 부서  삭제시 기존에 같은 상위부서를 가지고 있던 부서 그룹 정렬 새로 하기, 1부터 차례대로 값이 들어가게 정렬 
//		int result1 = sortDept(deptNo, upperDeptNo);
		
		// 정렬순서 업데이트 성공시 부서 삭제
		int result2 = 0;
//		if (result1 == 1) {
			result2 = aService.deleteDept(deptNo, upperDeptNo);
//		}
		
		if (result2 <= 0) {
			throw new AdminException("부서 삭제에 실패하였습니다.");
		} else {
			return "redirect:/admin/deptlist.ad?message=d";
		}
	}
	
    /**
     * 부서 수정
     */
	@RequestMapping("admin/dupdate.ad")
	@ResponseBody
	public String updateDept(@ModelAttribute Dept dept) {
		
		int result = aService.updateDept(dept);
		
		if (result <= 0) {
			throw new AdminException("부서 수정에 실패하였습니다.");
		} else {
			return "success";
		}
	}	
	
    /**
     * 조직도 내 부서 위치 이동
	 * @RequestParam("moveDeptNo") 이동하는 부서 번호
	 * @RequestParam("upperDeptNo") 이동 목적지인 상위부서의 번호
	 * @RequestParam("upperDeptLevel") 이동 목적지인 상위부서의 레벨
	 * @RequestParam("originUpperDept") 이동하는 부서의 기존 상위부서 번호
	 */
	@RequestMapping("admin/dmove.ad")
	@ResponseBody
	public String moveDept(@RequestParam("moveDeptNo") int moveDeptNo, 
						   @RequestParam("upperDeptNo") int upperDeptNo, 
						   @RequestParam("upperDeptLevel") int upperDeptLevel, 
						   @RequestParam("originUpperDept") int originUpperDept,
						   HttpServletResponse response) {
		
		int deptLevel = upperDeptLevel + 1; // 이동하려는 상위부서의 부서level + 1
		
		ArrayList<Dept> subDeptList = aService.getSubDeptList(upperDeptNo);
//		int deptOrder = subDeptList.size() + 1; // 같은 그룹내 가장 마지막 순서로 이동되게 정렬순서 세팅
		
		// 부서 이동시 기존에 같은 상위부서를 가지고 있던 부서 그룹 정렬 새로 하기, 1부터 차례대로 값이 들어가게 정렬 
//		int result1 = sortDept(moveDeptNo, originUpperDept);
		
		// 정렬순서 업데이트 성공시 부서 위치 이동
		int result2 = 0;
		if (result2 == 1) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("moveDeptNo", moveDeptNo);
			map.put("upperDeptNo", upperDeptNo);
			map.put("deptLevel", deptLevel);
//			map.put("deptOrder", deptOrder);
			result2 = aService.moveDept(map);
		}
		
		if (result2 <= 0 ) {
			throw new AdminException("부서 위치 이동에 실패하였습니다.");
		} else {
			return "success";
		}
	}
	
//	public int sortDept(int deptNo, int originUpperDept) {
//		
//		// 부서 이동 또는 삭제시 기존에 같은 상위부서를 가지고 있던 부서 그룹 정렬 새로 하기, 1부터 차례대로 값이 들어가게 정렬 
//		ArrayList<Dept> sortDeptList = aService.getSubDeptList(originUpperDept);
//		int result = 0;
//		if (sortDeptList.size() >= 2) {
//			int i = 1;
//			for (Dept d : sortDeptList) {
//				if (d.getNo() != deptNo) {
//					d.setDeptOrder(i);
//					i++;
//				}
//			}
//			
//			result = aService.sortDeptOrder(sortDeptList) >= sortDeptList.size() ? 1 : 0;
//			
//		} else {
//			result = 1;
//		}
//		
//		return result;
//	}
	
	
	
	
	
    /**
     * 신고글 목록 조회
     */	
	@RequestMapping("admin/reportList.ad")
	public ModelAndView reportList(@RequestParam(value="page", required=false) Integer page, 
								   @RequestParam(value="message", required=false) String message, ModelAndView mv) {

		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = aService.getReportListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
		ArrayList<Report> boardReportList = aService.selectBoardReportList(pi);
		ArrayList<Report> replyReportList = aService.selectReplyReportList(pi);
		
		if (boardReportList != null && replyReportList != null) {
			mv.addObject("boardReportList", boardReportList);
			mv.addObject("replyReportList", replyReportList);
			mv.addObject("pi", pi);
			mv.addObject("message", message);
			mv.setViewName("admin/reportList");
		} else {
			throw new AdminException("신고글 목록 조회에 실패하였습니다.");
		}
			
		return mv;
	}
	
    /**
     * 신고된 게시글 관리
     */	
	@RequestMapping("admin/handingBoardReport.ad")
	public String handingBoardReport(@ModelAttribute Report report, 
						@RequestParam(value="page", required=false) Integer page, Model model) {
		
		int result = aService.handingBoardReport(report);
		
		String message = "";
		if (report.getReportStatus() == 1) {
			message = "d";
		} else {
			message = "c";
		}
		
		if (result > 0) {
			model.addAttribute("page", page);
			model.addAttribute("message", message);
		} else {
			throw new AdminException("신고글 처리에 실패하였습니다.");
		}
			
		return "redirect:/admin/reportList.ad";
	}
	
    /**
     * 신고된 댓글 관리
     */	
	@RequestMapping("admin/handingReplyReport.ad")
	public String handingReplyReport(@ModelAttribute Report report, 
						@RequestParam(value="page", required=false) Integer page, Model model) {
		
		int result = aService.handingReplyReport(report);
		
		String message = "";
		if (report.getReportStatus() == 1) {
			message = "d";
		} else {
			message = "c";
		}
		
		if (result > 0) {
			model.addAttribute("page", page);
			model.addAttribute("message", message);
		} else {
			throw new AdminException("신고글 처리에 실패하였습니다.");
		}
			
		return "redirect:/admin/reportList.ad";
	}
	
}