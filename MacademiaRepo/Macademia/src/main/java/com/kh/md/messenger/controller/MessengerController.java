package com.kh.md.messenger.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.md.messenger.common.FileUploader;
import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.common.Pagination;
import com.kh.md.messenger.service.MessengerService;
import com.kh.md.messenger.vo.MessengerVo;
import com.kh.md.messenger.vo.MsgNoteVo;
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
	
	//메신저 등록확인 및 메인페이지 이동
	@GetMapping("main")
	public String main(HttpSession session) {
		
		//TODO 세션에서 멤버넘버 가져오기
		String memberNo = "3";
		
		//메신저 등록되어있는지 체크
		MessengerVo msgVo = ms.selectCheckEnroll(memberNo);
		
		if(msgVo != null) {
			
			session.setAttribute("msgVo", msgVo);
			
			//메신저에 모든 정보 가져가기
			List<MessengerVo> msgVoList = ms.selectAllMsg();
			session.setAttribute("msgVoList", msgVoList);
			
			return "messenger/main";
		}else {
			return "messenger/enroll";
		}
		
	}
	
	// 메신저 등록하기
	@PostMapping("enroll")
	public String enroll(MessengerVo msgVo, HttpSession session, HttpServletRequest req) {
		
		//TODO 세션에서 멤버넘버 가져오기
		String memberNo = "3";
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
	
	
	
	
	//쪽지 받은쪽지함 페이지
	@GetMapping("noteReceiveBox")
	public String noteReceiveBox(HttpSession session, Model model) {
		
		//메시지 넘버 세팅
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
		
		List<MsgNoteVo> mnVoList = ms.selectNoteListByNo(msgVo.getMsgNo());
		
		if(mnVoList != null) {
			model.addAttribute("mnVoList", mnVoList);
			return "messenger/noteReceiveMain";
		}else {
			return "";
		}
		
	}
	
	
	//쪽지 보낸쪽지함 페이지
	@GetMapping("noteSendBox")
	public String note(HttpSession session, Model model) {
		
		//메시지 넘버 세팅
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
		
		List<MsgNoteVo> mnVoList = ms.selectNoteListByNo(msgVo.getMsgNo());
		
		if(mnVoList != null) {
			model.addAttribute("mnVoList", mnVoList);
			return "messenger/noteSendMain";
		}else {
			return "";
		}
		
	}
	
	
	
	//쪽지 받은쪽지함 - 검색하기
	@PostMapping("note/searchReceive")
	public String noteSearchReceive(HttpSession session, Model model, String menu, String keyword) {
		
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
	
		//데이터 뭉치기
		Map<String, String> map = new HashMap<String, String>();
		map.put("msgNo", msgVo.getMsgNo());
		map.put("keyword", keyword);
		map.put("menu", menu);
		
		List<MsgNoteVo> mnVoList = ms.selectNoteKeyword(map);
		if(mnVoList != null) {
			model.addAttribute("mnVoList", mnVoList);
			model.addAttribute("menu", menu);
			model.addAttribute("keyword", keyword);
			return "messenger/noteReceiveMain";
		}else {
			return "";
		}
	}
	
	
	//쪽지 보낸쪽지함 - 검색하기
	@PostMapping("note/searchSend")
	public String noteSearchSend(HttpSession session, Model model, String menu, String keyword) {
		
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
	
		//데이터 뭉치기
		Map<String, String> map = new HashMap<String, String>();
		map.put("msgNo", msgVo.getMsgNo());
		map.put("keyword", keyword);
		map.put("menu", menu);
		
		List<MsgNoteVo> mnVoList = ms.selectNoteKeyword(map);
		if(mnVoList != null) {
			model.addAttribute("mnVoList", mnVoList);
			model.addAttribute("menu", menu);
			model.addAttribute("keyword", keyword);
			return "messenger/noteSendMain";
		}else {
			return "";
		}
	}
	
	
	
	
	//쪽지 보내기 [ 화면 ] 
	@GetMapping("note/write")
	public String noteWrite(String receiveNo, String receiveName, Model model) {
		
		model.addAttribute("receiveNo",receiveNo);
		model.addAttribute("receiveName",receiveName);
		
		return "messenger/noteWrite";
	}
	
	//쪽지 보내기 [ 처리 ]
	@PostMapping("note/write/{receiveNo}")
	public String noteWrite(MsgNoteVo mnVo ,HttpSession session, HttpServletRequest req, @PathVariable String receiveNo, String reveiceName22) {
		
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
		mnVo.setMsgNo(msgVo.getMsgNo());
		
		//TODO 검색페이지에서 넘겨받은 값으로 세팅하기
		mnVo.setReceiveNo(receiveNo);
		
		if(mnVo.getAttFile() != null && !mnVo.getAttFile().isEmpty()) {
			String savePath = req.getServletContext().getRealPath("resources/upload/messenger/");
			String changeName = FileUploader.fileUploadNote(mnVo.getAttFile(), savePath);
			mnVo.setFileName(changeName);
		}
		
		int result = ms.insertNoteOne(mnVo);
		
		if(result == 1) {
			return "redirect:/messenger/noteSendBox";
		}else {
			return "";
		}
	}
	
	
	
	
	
	
	// 쪽지 - 답장하기 [ 화면 ] 처리는 쪽지쓰기 메서드 활용
	@GetMapping("note/reple/{repleNoteNo}")
	public String noteReply(@PathVariable String repleNoteNo, Model model) {

		MsgNoteVo noteRepleVo = ms.selectNoteByNo(repleNoteNo);
		
		if(noteRepleVo != null) {
			model.addAttribute("noteRepleVo",noteRepleVo);
			return "messenger/noteReple";
		}else {
			return "";
		}
	}
	
	//쪽지 - 받은쪽지함에서 삭제하기 [ 처리 ]
	@GetMapping("note/deleteReceive/{deleteNoteNo}")
	public String noteDeleteReceive(@PathVariable String deleteNoteNo) {
		
		int result = ms.updateNoteDelete(deleteNoteNo);
		
		if(result == 1) {
			return "redirect:/messenger/noteReceiveBox";
		}else {
			return ""; 
		}
		
	}
	
	//쪽지 - 보낸쪽지함에서 삭제하기 [ 처리 ]
		@GetMapping("note/deleteSend/{deleteNoteNo}")
		public String noteDeleteSend(@PathVariable String deleteNoteNo) {
			
			int result = ms.updateNoteDelete(deleteNoteNo);
			
			if(result == 1) {
				return "redirect:/messenger/noteSendBox";
			}else {
				return ""; 
			}
			
		}
	
	@GetMapping("note/recipient")
	public String noteRecipient() {
		return "messenger/noteRecipient";
	} 
	
	//쪽지 - 해당 부서명 멤버 가져오기
	@GetMapping("DeptMember")
	public String deptMember(String deptName, Model model) {
		
		List<HashMap<String, String>> deptMemberList = ms.selectDeptMember(deptName);
		
		if(deptMemberList != null) {
			model.addAttribute("deptMemberList",deptMemberList);
			return "messenger/noteRecipient";
		}else {
			return "";
			
		}
		
		
	}
	
	
	@PostMapping("note/reple/number")
	@ResponseBody
	public String noteRepleNumber(String repleNo) {
		return repleNo;
	}
	
	
	
	
	
	//메신저 나의 프로필 페이지
		@GetMapping("profile")
		public String profile() {
			return "messenger/profile";
		}
		
		
		
		//메신저 프로필 수정 화면
		@GetMapping("profile/edit")
		public String profileEdit() {
			return "messenger/profileEdit";
		}
		
		
		//메신저 프로필 수정 처리
		@PostMapping("profile/edit")
		public String profileEdit(MessengerVo vo ,HttpServletRequest req, HttpSession session) {
			
			//기존 파일 삭제
			String savePath = req.getServletContext().getRealPath("/resources/upload/messenger/"); //req로 기존 파일 경로 가져오고
			MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo"); // 세션에 msgVo 통해서 파일 이름 가져오고
			String fileName = msgVo.getFileName();
			File f= new File(savePath + fileName);
			
			if(f.exists()) {
				f.delete();
			}
			
			
			//신규로 받은 파일 업로드, 저장된 파일명 얻기
			if(!vo.getProfile().isEmpty()) {
				String changeName = FileUploader.fileUpload(vo.getProfile(), savePath);
				vo.setFileName(changeName);
			}
			
			//회원번호 세션에서 얻어와서 - 세팅 마무리 해준 vo로 - db에 업데이트
			vo.setNo(msgVo.getNo());
			MessengerVo updateMember = ms.updateMsgOne(vo);
			
			if(updateMember != null) {
				session.setAttribute("msgVo", updateMember);
				return "messenger/profile";
			}else {
				return "";
			}
			
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
