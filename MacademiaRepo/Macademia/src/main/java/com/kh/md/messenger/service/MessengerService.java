package com.kh.md.messenger.service;

import java.util.List;

import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.vo.MessengerVo;
import com.kh.md.messenger.vo.MsgNoticeVo;
import com.kh.md.messenger.vo.MsgRepleVo;


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

	//공지 게시글 ( 댓글 입력 )
	int insertReple(MsgRepleVo repleVo);

	//공지 게시글 ( 댓글 목록 가져오기 )
	List<MsgRepleVo> selectRepleList(String no);

	//공지 게시글 ( 댓글 삭제 )
	int updateRepleDelete(String repleNo);


	//메신저 ( 등록 체크 )
	MessengerVo selectCheckEnroll(String memberNo);

	//메신저 ( 등록 하기 )
	int insertMessenger(MessengerVo msgVo);

	//메신저 ( 등록 회원 모두 가져가기 )
	List<MessengerVo> selectAllMsg();

	//메신저 ( 메신저 프로필 변경하기 )
	MessengerVo updateMsgOne(MessengerVo vo);
	

	
}//class
