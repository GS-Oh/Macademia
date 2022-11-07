package com.kh.md.messenger.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
import org.springframework.web.multipart.MultipartFile;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.messenger.common.FileUploader;
import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.common.Pagination;
import com.kh.md.messenger.service.MessengerService;
import com.kh.md.messenger.vo.MessengerVo;
import com.kh.md.messenger.vo.MsgFileCopyVo;
import com.kh.md.messenger.vo.MsgFileboxVo;
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
	public String main(HttpSession session, Model model) {
		
		//TODO 세션에서 멤버넘버 가져오기 //멤버넘버 5000으로 바꿔서 쪽지 보내기
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
		
		//메신저 등록되어있는지 체크
		MessengerVo msgVo = ms.selectCheckEnroll(memberNo);
		System.out.println(msgVo);
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
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
		
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
			String originName = mnVo.getAttFile().getOriginalFilename();
			String savePath = req.getServletContext().getRealPath("resources/upload/messenger/");
			String changeName = FileUploader.fileUploadNote(mnVo.getAttFile(), savePath);
			mnVo.setFileName(changeName);
			mnVo.setOriginName(originName);
		}
		
		int result = ms.insertNoteOne(mnVo);
		
		if(result == 1) {
			return "redirect:/messenger/noteSendBox";
		}else {
			return "";
		}
	}
	
	
	
	
	
	
	// 쪽지 - 답장하기 [ 화면 ] 처리는 이동된 화면에서 다른 쪽으로 요청해서 처리
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
	
	//쪽지 - 받는 사람 검색 ( 화면 )	
	@GetMapping("note/recipient")
	public String noteRecipient() {
		return "messenger/noteRecipient";
	} 
	
	//쪽지 - 받는 사람 검색 처리 ( 해당 부서명 멤버 가져오기 - script로 요청 )
	@GetMapping("deptMember")
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
		
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo"); 
		String savePath = req.getServletContext().getRealPath("/resources/upload/messenger/"); //req로 기존 파일 경로 가져오고
		
		//신규로 받은 파일 업로드, 저장된 파일명 얻기 
		if(!vo.getProfile().isEmpty()) { // ( 프로필사진까지 변경했으면 이 작업 진행 )
			String changeName = FileUploader.fileUpload(vo.getProfile(), savePath);
			vo.setFileName(changeName);
			
			//기존 파일 삭제
			
			// 세션에 msgVo 통해서 파일 이름 가져오고
			String fileName = msgVo.getFileName();
			File f= new File(savePath + fileName);
			
			if(f.exists()) {
				f.delete();
			}
			
		}else if(vo.getProfile().isEmpty()) { // ( 프로필사진까지 변경안했으면 이 작업 진행 )	
			vo.setFileName(msgVo.getFileName());
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
	
	
	//파일보관함 메인 페이지 ( 이미지 파일들 보여주기 )
	@GetMapping("imgFileBox")
	public String fileBox(MsgFileboxVo msgFileVo ,HttpSession session, Model model) {
		
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
		msgFileVo.setMsgNo(msgVo.getMsgNo());
		
		List<MsgFileboxVo> ImgFileVoList = ms.selectAllFileImgByNo(msgFileVo.getMsgNo());
		
		if(ImgFileVoList != null) {
			model.addAttribute("ImgFileVoList", ImgFileVoList);
			return "messenger/fileBox";
		}else {
			return "";
		}
		
	}
	
	//파일보관함 메인 페이지 ( 이미지 외 파일들 보여주기 )
	@GetMapping("etcFileBox")
	public String fileBoxEtc(MsgFileboxVo msgFileVo ,HttpSession session, Model model) {
		
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
		msgFileVo.setMsgNo(msgVo.getMsgNo());
		
		List<MsgFileboxVo> FileVoList = ms.selectAllEtcFileByNo(msgFileVo.getMsgNo());
		
		if(FileVoList != null) {
			model.addAttribute("FileVoList", FileVoList);
			return "messenger/fileBoxEtc";
		}else {
			return "";
		}
	} 
	
	
	//파일보관함 ( 파일 등록하기 )
	@GetMapping("allFileBox/Enroll/{fileName}/{originName}")
	public String imgFileBoxEnroll(MsgFileboxVo msgFileVo, @PathVariable String fileName, @PathVariable String originName, MsgFileCopyVo copyVo,HttpSession session, Model model) {
		
		int random = (int)(Math.random() * 90000 + 10000);
		
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
		msgFileVo.setMsgNo(msgVo.getMsgNo());
		msgFileVo.setFileName(fileName);
		msgFileVo.setCopyName(random+ fileName);
		
		copyVo.setOriginName(originName);
		copyVo.setCopyName(random + fileName);
		
		//확장자가 jpg 면 img파일 테이블에 추가 아니면 etc파일 테이블에 추가
		String dot = fileName.substring(fileName.lastIndexOf("."));
		
		int result = 0;
		
		if(dot.equals(".jpg") || dot.equals(".png")) {
			result = ms.insertImgFilebox(msgFileVo,copyVo);
			
		}else {
			result = ms.insertFilebox(msgFileVo,copyVo);
		}
		
		
		if(result == 1) {
			model.addAttribute("fileName", fileName);
			model.addAttribute("originName", originName);
			model.addAttribute("checkDownload", "1");
			model.addAttribute("dot", dot);
			return "messenger/download"; 
		}else {
			return "";
		}
		
		//
		
	}
	
	
	//파일보관함 ( 파일 다운로드 페이지로 이동 )
	@GetMapping("download/{fileName}/{originName}")
	public String download(@PathVariable String fileName, @PathVariable String originName, Model model) {
		
		model.addAttribute("fileName", fileName);
		model.addAttribute("originName", originName);
		
		//확장자가 jpg 면 img파일 테이블에 추가 아니면 etc파일 테이블에 추가
		String dot = fileName.substring(fileName.lastIndexOf("."));
		
		String checkFileDot = "";
		
		if(dot.equals(".jpg") || dot.equals(".png")) {
			checkFileDot = "imgFile";
		}else {
			checkFileDot = "etc";
		}
		
		model.addAttribute("checkFileDot", checkFileDot);
		
		
		return "messenger/download";
	}
	
	
	//파일보관함 ( 파일 보내기 - 화면)
	@GetMapping("fileSend/{originName}/{fileName}")
	public String fileSend(@PathVariable String originName, @PathVariable String fileName, Model model) {
		
		model.addAttribute("originName",originName);
		model.addAttribute("fileName",fileName);
		
		return "messenger/fileSend";
	}
	
	
	//파일보관함 ( 파일 보내기 - 처리 )
	@PostMapping("fileSend")
	public String fileSend(MsgNoteVo mnVo, Model model, HttpSession session) {
		
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
		mnVo.setMsgNo(msgVo.getMsgNo());
		
		
		//어디서 보낸건지 구분해서 리턴 페이지 정해주도록해주기 위함
		String fileCategory = "etc";
		String dot = mnVo.getFileName().substring( (mnVo.getFileName().lastIndexOf('.')) );
		if(dot.equals(".jpg")) {
			fileCategory = "jpg";
		}			
		
		
		int result = ms.insertNoteOne(mnVo);
		
		if(result == 1 && fileCategory.equals("jpg")) {
			return "redirect:/messenger/imgFileBox";
		}else if(result == 1 && fileCategory.equals("etc")) {
			return "redirect:/messenger/etcFileBox";
		}else {
			return "";
		}
		
	}
	
	
	//파일보관함 - 받는 사람 검색 처리 ( 해당 부서명 멤버 가져오기 - script로 요청 )
	@GetMapping("fileDeptMember/{originName}/{fileName}/{deptName}")
	public String fileDeptMember(@PathVariable String originName, @PathVariable String fileName, @PathVariable String deptName, Model model) {
		
		List<HashMap<String, String>> deptMemberList = ms.selectDeptMember(deptName);
		if(deptMemberList != null) {
			model.addAttribute("deptMemberList",deptMemberList);
			model.addAttribute("originName",originName);
			model.addAttribute("fileName",fileName);
			return "messenger/fileSend";
		}else {
			return "";
			
		}
	}
	
	
	
	//파일보관함 ( 파일 삭제하기 )
	@GetMapping("fileBox/delete/{fileNo}/{fileName}")
	public String fileBoxDelete(@PathVariable String fileNo, @PathVariable String fileName) {

		
		//쿼리문에서 추가할 테이블 지정하기 위해 카테고리 지정
		String fileCategory = "etc";
		String ext = fileName.substring( (fileName.lastIndexOf('.')) );
		if(ext.equals(".jpg")) {
			fileCategory = "jpg";
		}			
		
		
		Map<String, String> deleteMap = new HashMap<String, String>();
		deleteMap.put("fileCategory", fileCategory);
		deleteMap.put("fileNo", fileNo);
		deleteMap.put("fileName", fileName);
		
		int result = ms.fileBoxDelete(deleteMap);
		
		//jpg / etc 구분해서 보내주기
		if(result == 1 && fileCategory.equals("jpg")) {
			return "redirect:/messenger/imgFileBox";
		}else if(result == 1 && fileCategory.equals("etc")) {
			return "redirect:/messenger/etcFileBox";
		}else {
			return "";
		}
		
		
	}
	
	
	//공지 게시글 ( 메인 화면 )
	@GetMapping("notice/{pno}")
	public String notice(@PathVariable int pno, Model model) {
		
		//페이징 처리
		int totalCount = ms.selectTotalCnt(); //전체게시글 수 구하기
		PageVo pvo = Pagination.getPageVo(totalCount, pno, 3, 10);
		
		
		List<MsgNoticeVo> noticeVoList = ms.selectNoticeAll(pvo);
		
		model.addAttribute("noticeVoList", noticeVoList);
		model.addAttribute("pvo", pvo);
		
		return "messenger/notice";
	}

	
	//공지 게시글 ( 입력 화면 )
	@GetMapping("notice/write")
	public String noticeWrite() {
		return "messenger/noticeWrite";
	}
	
	
	//공지 게시글 ( 입력 처리 )
	@PostMapping("notice/write")
	public String noticeWrite(MsgNoticeVo noticeVo, HttpSession session) {
		
		//입력한 컨텐츠에서 html코드 제거하기 
		String deleteHtmlTag = noticeVo.getContent();
		deleteHtmlTag.replaceAll("<(/)?([a-zA-Z]*)(\\s[a-zA-Z]*=[^>]*)?(\\s)*(/)?>", "");
		noticeVo.setContent(deleteHtmlTag);
				
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
		noticeVo.setMsgNo(msgVo.getMsgNo());
		
		int result = ms.insertNotice(noticeVo);
		
		if( result == 1) {
			return "redirect:/messenger/notice/1";
		}else {
			return "redirect:/";
			
		}
		
	}
	
	
	//공지 게시글 ( 상세 페이지 화면 )
	@GetMapping("notice/detail/{noticeNo}")
	public String noticeDetail(@PathVariable String noticeNo, Model model) {
		
		//상세페이지 글
		MsgNoticeVo noticeVo = ms.selectOneByNo(noticeNo);
		
		//댓글 리스트
		List<MsgRepleVo> repleVoList = ms.selectRepleList(noticeNo);
		
		model.addAttribute("noticeVo" ,noticeVo);
		model.addAttribute("repleVoList", repleVoList);
		
		return "messenger/noticeDetail";
	}
	
	
	//공지 게시글 ( 수정 페이지 화면 )
	@GetMapping("notice/edit/{noticeNo}")
	public String noticeEdit(@PathVariable String noticeNo, Model model) {
		
		MsgNoticeVo noticeVo = ms.selectEditByNo(noticeNo);
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "messenger/noticeEdit";
	}
	
	
	//공지 게시글 ( 수정 처리 )
	@PostMapping("notice/edit/{noticeNo}")
	public String noticeEdit(@PathVariable String noticeNo, MsgNoticeVo noticeVo) {
		
		noticeVo.setNoticeNo(noticeNo);
		
		int result = ms.updateEdit(noticeVo);
		
		if(result == 1) {
			return "redirect:/messenger/notice/detail/"+ noticeNo;
		}else {
			return "redirect:/messenger/notice";
		}
	}

	//공지 게시글 ( 삭제 처리 )
	@GetMapping("notice/delete/{noticeNo}")
	public String noticeDelete(@PathVariable String noticeNo) {
		
		int result = ms.updateDelete(noticeNo);
		if(result == 1) {
			return "redirect:/messenger/notice/1";
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	//공지 게시글 ( 댓글 입력 )
	@PostMapping("notice/reple/write")
	@ResponseBody
	public String noticeRepleWrite(MsgRepleVo repleVo, HttpSession session) {
		
		MessengerVo msgVo = (MessengerVo)session.getAttribute("msgVo");
		repleVo.setMsgNo(msgVo.getMsgNo());
		
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
