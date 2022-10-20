package com.kh.md.messenger.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.common.Pagination;
import com.kh.md.messenger.service.MessengerService;
import com.kh.md.messenger.vo.MsgNoticeVo;

@Controller
@RequestMapping("messenger")
public class MessengerController {

	private final MessengerService ms;
	
	@Autowired
	public MessengerController(MessengerService ms) {
		this.ms = ms;
	}
	
	
	@GetMapping("main")
	public String main() {
		return "messenger/main";
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
		
		MsgNoticeVo noticeVo = ms.selectOneByNo(no);
		
		model.addAttribute("noticeVo" ,noticeVo);
		
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
			return "redirect:/messenger/notice";
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}//class
