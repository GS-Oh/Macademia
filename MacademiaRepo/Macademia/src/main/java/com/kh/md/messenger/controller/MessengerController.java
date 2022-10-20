package com.kh.md.messenger.controller;

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

import com.kh.md.messenger.common.FileUploader;
import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.common.Pagination;
import com.kh.md.messenger.service.MessengerService;
import com.kh.md.messenger.vo.MessengerVo;
import com.kh.md.messenger.vo.MsgNoticeVo;
import com.kh.md.messenger.vo.MsgRepleVo;

@Controller
@RequestMapping("messenger")
public class MessengerController {

	private final MessengerService ms;

	@Autowired
	public MessengerController(MessengerService ms) {
		this.ms = ms;
	}
	
	
	@GetMapping("main")
	public String main(HttpSession session) {
		
		//TODO 세션에서 멤버넘버 가져오기
		String memberNo = "5";
		
		//메신저 등록되어있는지 체크
		MessengerVo msgVo = ms.selectCheckEnroll(memberNo);
		
		if(msgVo != null) {
			session.setAttribute("msgVo", msgVo);
			return "messenger/main";
		}else {
			return "messenger/enroll";
		}
		
	}
	
	@PostMapping("enroll")
	public String enroll(MessengerVo msgVo, HttpSession session, HttpServletRequest req) {
		
		//TODO 세션에서 멤버넘버 가져오기
		String memberNo = "5";
		msgVo.setNo(memberNo);
		
		if(msgVo.getProfile() != null && !msgVo.getProfile().isEmpty()) {
			String savePath = req.getServletContext().getRealPath("resources/upload/messenger/");
			String changeName = FileUploader.fileUpload(msgVo.getProfile(), savePath);
			msgVo.setFileName(changeName);
		}
		
		int result = ms.insertMessenger(msgVo);
		
		if(result == 1) {
			return "redirect:/messenger/main";
			
		}else {
			return "";
		}
		
		
	}
	
	
	@GetMapping("profile")
	public String profile() {
		return "messenger/profile";
	}
	
	@GetMapping("profile/edit")
	public String profileEdit() {
		return "messenger/profileEdit";
	}
	
	@GetMapping("note")
	public String note() {
		return "messenger/note";
	}
	
	@GetMapping("note/write")
	public String noteWrite() {
		return "messenger/noteWrite";
	}
	
	@GetMapping("note/reply")
	public String noteReply() {
		return "messenger/noteReply";
	}
	
	@GetMapping("note/recipient")
	public String noteRecipient() {
		return "messenger/noteRecipient";
	} 
	
	@GetMapping("fileBox")
	public String fileBox() {
		return "messenger/fileBox";
	}
	
	@GetMapping("fileBox/etc")
	public String fileBoxEtc() {
		return "messenger/fileBoxEtc";
	} 
	
	
	//공지 게시글 ( 메인 화면 )
	@GetMapping("notice/{pno}")
	public String notice(@PathVariable int pno, Model model) {
		
		//페이징 처리
		int totalCount = ms.selectTotalCnt(); //전체게시글 수 구하기
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 5, 10);
		
		
		List<MsgNoticeVo> noticeVoList = ms.selectNoticeAll(pvo);
		
		model.addAttribute("noticeVoList", noticeVoList);
		model.addAttribute("pvo", pvo);
		
		return "messenger/notice";
	}

	
	@GetMapping("notice/write")
	public String noticeWrite() {
		return "messenger/noticeWrite";
	}
	
	//공지 게시글 ( 입력 처리 )
	@PostMapping("notice/write")
	public String noticeWrite(MsgNoticeVo noticeVo) {
		
		//TODO 세션이나 다른곳 저장되어있는 MsgNo로 바꾸기
		noticeVo.setMsgNo("1");
		
		int result = ms.insertNotice(noticeVo);
		
		if( result == 1) {
			return "redirect:/messenger/notice/1";
		}else {
			return "redirect:/";
			
		}
		
	}
	
	//공지 게시글 ( 상세 페이지 화면 )
	@GetMapping("notice/detail/{no}")
	public String noticeDetail(@PathVariable String no, Model model) {
		
		//상세페이지 글
		MsgNoticeVo noticeVo = ms.selectOneByNo(no);
		
		//댓글 리스트
		List<MsgRepleVo> repleVoList = ms.selectRepleList(no);
		
		model.addAttribute("noticeVo" ,noticeVo);
		model.addAttribute("repleVoList", repleVoList);
		
		return "messenger/noticeDetail";
	}
	
	
	//공지 게시글 ( 수정 페이지 화면 )
	@GetMapping("notice/edit/{no}")
	public String noticeEdit(@PathVariable String no, Model model) {
		
		MsgNoticeVo noticeVo = ms.selectEditByNo(no);
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "messenger/noticeEdit";
	}
	
	
	//공지 게시글 ( 수정 처리 )
	@PostMapping("notice/edit/{no}")
	public String noticeEdit(@PathVariable String no, MsgNoticeVo noticeVo) {
		
		noticeVo.setNoticeNo(no);
		
		int result = ms.updateEdit(noticeVo);
		
		if(result == 1) {
			return "redirect:/messenger/notice/detail/"+ no;
		}else {
			return "redirect:/messenger/notice";
		}
	}

	//공지 게시글 ( 삭제 처리 )
	@GetMapping("notice/delete/{no}")
	public String noticeDelete(@PathVariable String no) {
		
		int result = ms.updateDelete(no);
		if(result == 1) {
			return "redirect:/messenger/notice/1";
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	//공지 게시글 ( 댓글 입력 )
	@PostMapping("notice/reple/write")
	@ResponseBody
	public String noticeRepleWrite(MsgRepleVo repleVo) {
		
		//TODO 세션이나 다른곳 저장되어있는 MsgNo로 바꾸기
		repleVo.setMsgNo("1");
		
		int result = ms.insertReple(repleVo);
		
		if(result == 1) {
			return "ok";
		}else {
			return "fail";
		}
		
	}
	
	
	//공지 게시글 ( 댓글 삭제 )
	@GetMapping("/notice/reple/delete/{repleNo}/{noticeNo}")
	public String noticeRepleDelete(@PathVariable String repleNo, @PathVariable String noticeNo) {
		
		int result = ms.updateRepleDelete(repleNo);
		
		if(result == 1) {
			return "redirect:/messenger/notice/detail/"+ noticeNo;
		}else {
			return "";
		}
		
	}
	
	
	
}//class
