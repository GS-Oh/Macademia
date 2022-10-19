package com.kh.md.messenger.service;

import java.util.List;

import com.kh.md.messenger.vo.MsgNoticeVo;


public interface MessengerService {
	
	//공지 게시글 ( 메인 화면 )
	List<MsgNoticeVo> selectNoticeAll();
	

	//공지 게시글 ( 입력 처리 )
	int insertNotice(MsgNoticeVo noticeVo);
	
	
	
}//class
