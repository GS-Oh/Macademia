package com.kh.md.messenger.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.vo.MessengerVo;
import com.kh.md.messenger.vo.MsgFileCopyVo;
import com.kh.md.messenger.vo.MsgFileboxVo;
import com.kh.md.messenger.vo.MsgNoteVo;
import com.kh.md.messenger.vo.MsgNoticeVo;
import com.kh.md.messenger.vo.MsgRepleVo;


public interface MessengerService {
	
	//공지 게시글 ( 메인 화면 )
	List<MsgNoticeVo> selectNoticeAll(PageVo pvo);
	

	//공지 게시글 ( 입력 처리 )
	int insertNotice(MsgNoticeVo noticeVo);

	//공지 게시글 ( 상세 화면 )
	MsgNoticeVo selectOneByNo(String noticeNo);

	//공지 게시글 ( 수정 화면 )
	MsgNoticeVo selectEditByNo(String noticeNo);

	//공지 게시글 ( 수정 처리 )
	int updateEdit(MsgNoticeVo noticeVo);


	//공지 게시글 ( 삭제 처리 )
	int updateDelete(String noticeNo);

	//공지 게시글 ( 총 게시글 수 )
	int selectTotalCnt();

	//공지 게시글 ( 댓글 입력 )
	int insertReple(MsgRepleVo repleVo);

	//공지 게시글 ( 댓글 목록 가져오기 )
	List<MsgRepleVo> selectRepleList(String noticeNo);

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

	
	//쪽지 ( 보내기 )
	int insertNoteOne(MsgNoteVo mnVo);

	//쪽지 ( 내역 불러오기 )
	List<MsgNoteVo> selectNoteListByNo(String msgNo);

	
	//쪽지 ( 검색 값으로 쪽지 불러오기 )
	List<MsgNoteVo> selectNoteKeyword(Map<String, String> map);


	//쪽지 ( 쪽지 번호로 쪽지 1개 가져오기 )
	MsgNoteVo selectNoteByNo(String repleNoteNo);

	//쪽지 ( 쪽지 번호로 삭제 )
	int updateNoteDelete(String deleteNoteNo);


	//쪽지 ( 보낸사람검색 )
	List<HashMap<String, String>> selectDeptMember(String deptName);

	//파일보관함 ( 이미지 파일 전부 가져오기 )
	List<MsgFileboxVo> selectAllFileImgByNo(String msgNo);

	//파일보관함 ( 예외 파일 전부 가져오기 )
	List<MsgFileboxVo> selectAllEtcFileByNo(String msgNo);

	//파일보관함 ( 이미지 파일 입력 )
	int insertImgFilebox(MsgFileboxVo msgFileVo, MsgFileCopyVo copyVo);

	//파일보관함 ( etc 파일 입력 )
	int insertFilebox(MsgFileboxVo msgFileVo, MsgFileCopyVo copyVo);

	//파일보관함 ( etc 파일 삭제 )
	int fileBoxDelete(Map<String, String> deleteMap);

	
}//class
