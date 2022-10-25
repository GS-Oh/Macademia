package com.kh.md.messenger.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.vo.MessengerVo;
import com.kh.md.messenger.vo.MsgFileboxVo;
import com.kh.md.messenger.vo.MsgNoteVo;
import com.kh.md.messenger.vo.MsgNoticeVo;
import com.kh.md.messenger.vo.MsgRepleVo;

public interface MessengerDao {
	
	//공지톡 게시글 입력
	int insertNotice(SqlSessionTemplate sst, MsgNoticeVo noticeVo);
	
	//공지톡 ( 메인 화면 )
	List<MsgNoticeVo> selectNoticeAll(SqlSessionTemplate sst, PageVo pvo);
	
	//공지톡 ( 상세 화면 )
	MsgNoticeVo selectOneByNo(SqlSessionTemplate sst, String no);

	//공지톡 ( 조회 수 증가 )
	int increaseHit(SqlSessionTemplate sst, String no);

	//공지톡 ( 수정 화면 )
	MsgNoticeVo selectEditByNo(SqlSessionTemplate sst, String no);

	//공지톡 ( 수정 처리 )
	int updateEdit(SqlSessionTemplate sst, MsgNoticeVo noticeVo);

	//공지톡 ( 수정 처리 )
	int updateDelete(SqlSessionTemplate sst, String no);

	//공지톡 ( 게시글 총 수 )
	int selectTotalCnt(SqlSessionTemplate sst);

	//공지톡 ( 댓글 입력하기 )
	int insertReple(SqlSessionTemplate sst, MsgRepleVo repleVo);

	//공지톡 ( 댓글 리스트 가져오기 )
	List<MsgRepleVo> selectRepleList(SqlSessionTemplate sst, String no);

	//공지톡 ( 댓글 삭제하기 )
	int updateRepleDelete(SqlSessionTemplate sst, String repleNo);

	//메신저 ( 등록 체크 )
	MessengerVo selectCheckEnroll(SqlSessionTemplate sst, String memberNo);

	//메신저 ( 등록 하기 )
	int insertMessenger(SqlSessionTemplate sst, MessengerVo msgVo);

	//메신저 ( 등록 회원 모두 가져가기 )
	List<MessengerVo> selectAllMsg(SqlSessionTemplate sst);

	//메신저 ( 프로필 변경하기 )
	int updateMsgOne(SqlSessionTemplate sst, MessengerVo vo);

	//쪽지 ( 보내기 )
	int insertNoteOne(SqlSessionTemplate sst, MsgNoteVo mnVo);

	//쪽지 ( 내역 불러오기 )
	List<MsgNoteVo> selectNoteListByNo(SqlSessionTemplate sst, String msgNo);

	//쪽지 ( 검색 값으로 내역 불러오기 )
	List<MsgNoteVo> selectNoteKeyword(SqlSessionTemplate sst, Map<String, String> map);

	//쪽지 ( 번호로 쪽지 1개 가져오기 )
	MsgNoteVo selectNoteByNo(SqlSessionTemplate sst, String repleNoteNo);

	//쪽지 ( 번호로 쪽지 삭제 )
	int updateNoteDelete(SqlSessionTemplate sst, String deleteNoteNo);

	//쪽지 ( 부서명으로 멤버 가져오기 )
	List<HashMap<String, String>> selectDeptMember(SqlSessionTemplate sst, String deptName);

	//파일보관함 - 이미지 파일 전부 가져오기
	List<MsgFileboxVo> selectAllFileImgByNo(SqlSessionTemplate sst, String msgNo);

	//파일보관함 - 예외 파일 전부 가져오기
	List<MsgFileboxVo> selectAllEtcFileByNo(SqlSessionTemplate sst, String msgNo);

	
	//파일보관함 - 이미지 파일 추가하기
	int insertImgFilebox(SqlSessionTemplate sst, MsgFileboxVo msgFileVo);

	//파일보관함 - etc 파일 추가하기
	int insertFilebox(SqlSessionTemplate sst, MsgFileboxVo msgFileVo);

	//파일보관함 - 파일 삭제하기
	int fileBoxDeleteByName(SqlSessionTemplate sst, String fileName);
	
	
	
}//class
