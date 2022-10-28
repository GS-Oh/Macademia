package com.kh.md.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class MeetRoomController {
	
    /**
     * 회의실 목록 조회
     */
	@RequestMapping("admin/meetList.ad")
	public String meetRoomList() {
			return "meetRoomList";
	}
	
    /**
     * 회의실 등록
     */
	@RequestMapping("admin/meetinsert.ad")
	public String insertMeetRoom() {
		// 업로드할 파일 존재
			
		// 등록 실패시 저장된 파일도 삭제
	
		return "redirect:meetList.ad?message=success";
	}
	
    /**
     * 회의실 상세
     */
	@RequestMapping("admin/meetdetail.ad")
	public String meetRoomDetail() {
		
			return "meetRoomDetail";
	}
	
    /**
     * 회의실 수정
     */
	@RequestMapping("admin/meetupdate.ad")
	public String updateMeetRoom() {
		
		// 수정할 파일 존재
			
		// 수정할 파일 존재 + 기존 파일 존재 = 기존 파일 삭제
		return "redirect:meetdetail.ad?meet_no=" +  "&message=success";
	}
	
    /**
     * 회의실 삭제
     */
	@RequestMapping("admin/meetdelete.ad")
	public String deleteMeetRoom() {
		
		// 회의실 삭제시 등록된 파일도 삭제
				
		return "redirect:meetList.ad?message=d";
			
	}

}

