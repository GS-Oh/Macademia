package com.kh.md.messenger.service;

import java.util.List;

import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.vo.MsgNoticeVo;


public interface MessengerService {
	
	//공지 게시글 ( 메인 화면 )
	List<MsgNoticeVo> selectNoticeAll(PageVo pvo);
	

	//공지 게시글 ( 입력 처리 )
	int insertNotice(MsgNoticeVo noticeVo);

	//공지 게시글 ( 상세 화면 )
	MsgNoticeVo selectOneByNo(String no);

	//공지 게시글 ( 수정 화면 )
	MsgNoticeVo selectEditByNo(String no);

	//공지 게시글 ( 수정 처리 )
	int updateEdit(MsgNoticeVo noticeVo);


	//공지 게시글 ( 삭제 처리 )
	int updateDelete(String no);

	//공지 게시글 ( 총 게시글 수 )
	int selectTotalCnt();
	

	
}//class
