package com.kh.md.messenger.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.vo.MessengerVo;
import com.kh.md.messenger.vo.MsgNoteVo;
import com.kh.md.messenger.vo.MsgNoticeVo;
import com.kh.md.messenger.vo.MsgRepleVo;

@Repository
public class MessengerDaoImpl implements MessengerDao{

	//공지톡 게시글 ( 입력 )
	@Override
	public int insertNotice(SqlSessionTemplate sst, MsgNoticeVo noticeVo) {
		return sst.insert("messengerMapper.insertNotice", noticeVo);
	}
	
	
	//공지톡 게시글 ( 메인 화면 )
	@Override
	public List<MsgNoticeVo> selectNoticeAll(SqlSessionTemplate sst, PageVo pvo) {
		
		//페이징 처리
		int offset = pvo.getCurrentCount()-1 * pvo.getBoardLimit();
		RowBounds rb = new RowBounds(offset, pvo.getBoardLimit());
		
		return sst.selectList("messengerMapper.selectNoticeAll",null,rb);
	}

	//공지톡 게시글 ( 상세 화면 )
	@Override
	public MsgNoticeVo selectOneByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("messengerMapper.selectOneByNo",no);
	}

	//공지톡 게시글 ( 조회 수 증가 )
	@Override
	public int increaseHit(SqlSessionTemplate sst, String no) {
		return sst.update("messengerMapper.increaseHit", no);
	}


	//공지톡 게시글 ( 수정 화면 )
	@Override
	public MsgNoticeVo selectEditByNo(SqlSessionTemplate sst, String no) {
		return sst.selectOne("messengerMapper.selectEditByNo", no);
	}

	//공지톡 게시글 ( 수정 처리 )
	@Override
	public int updateEdit(SqlSessionTemplate sst, MsgNoticeVo noticeVo) {
		return sst.update("messengerMapper.updateEdit", noticeVo);
	}


	//공지톡 게시글 ( 삭제 처리 )
	@Override
	public int updateDelete(SqlSessionTemplate sst, String no) {
		return sst.update("messengerMapper.updateDelete", no);
	}

	//공지톡 게시글 ( 게시글 총 수 )
	@Override
	public int selectTotalCnt(SqlSessionTemplate sst) {
		return sst.selectOne("messengerMapper.selectTotalCnt");
	}


	//공지톡 게시글 ( 댓글 입력 )
	@Override
	public int insertReple(SqlSessionTemplate sst, MsgRepleVo repleVo) {
		return sst.insert("messengerMapper.insertReple",repleVo);
	}


	//공지톡 게시글 ( 댓글 리스트 가져오기 )
	@Override
	public List<MsgRepleVo> selectRepleList(SqlSessionTemplate sst, String no) {
		return sst.selectList("messengerMapper.selectRepleList",no);
	}


	//공지톡 게시글 ( 댓글 삭제 )
	@Override
	public int updateRepleDelete(SqlSessionTemplate sst, String repleNo) {
		return sst.update("messengerMapper.updateRepleDelete", repleNo);
	}

	//메신저 ( 등록 체크 )
	@Override
	public MessengerVo selectCheckEnroll(SqlSessionTemplate sst, String memberNo) {
		return sst.selectOne("messengerMapper.selectCheckEnroll", memberNo);
	}


	//메신저 ( 등록 하기 )
	@Override
	public int insertMessenger(SqlSessionTemplate sst, MessengerVo msgVo) {
		return sst.insert("messengerMapper.insertMessenger", msgVo);
	}


	//메신저 ( 등록 회원 가져가기 )
	@Override
	public List<MessengerVo> selectAllMsg(SqlSessionTemplate sst) {
		return sst.selectList("messengerMapper.selectAllMsg");
	}


	//메신저 ( 프로필 변경하기 )
	@Override
	public int updateMsgOne(SqlSessionTemplate sst, MessengerVo vo) {
		return sst.update("messengerMapper.updateMsgOne",vo);
	}

	//쪽지 ( 보내기 )
	@Override
	public int insertNoteOne(SqlSessionTemplate sst, MsgNoteVo mnVo) {
		return sst.insert("messengerMapper.insertNoteOne", mnVo);
	}


	//쪽지 ( 내역 불러오기 )
	@Override
	public List<MsgNoteVo> selectNoteListByNo(SqlSessionTemplate sst, String msgNo) {
		return sst.selectList("messengerMapper.selectNoteListByNo", msgNo);
	}


	//쪽지 ( 검색 값으로 쪽지 내역 불러오기 )
	@Override
	public List<MsgNoteVo> selectNoteKeyword(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("messengerMapper.selectNoteKeyword",map);
	}

	//쪽지 ( 쪽지 번호로 쪽지 1개 가져오기 )
	@Override
	public MsgNoteVo selectNoteByNo(SqlSessionTemplate sst, String repleNoteNo) {
		return sst.selectOne("messengerMapper.selectNoteByNo", repleNoteNo);
	}


	//쪽지 ( 쪽지 번호로 쪽지 삭제 )
	@Override
	public int updateNoteDelete(SqlSessionTemplate sst, String deleteNoteNo) {
		return sst.update("messengerMapper.updateNoteDelete", deleteNoteNo);
	}


	@Override
	public List<HashMap<String, String>> selectDeptMember(SqlSessionTemplate sst, String deptName) {
		return sst.selectList("messengerMapper.selectDeptMember", deptName);
	}

	
	
	
}//class
