package com.kh.md.messenger.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.dao.MessengerDao;
import com.kh.md.messenger.vo.MessengerVo;
import com.kh.md.messenger.vo.MsgFileCopyVo;
import com.kh.md.messenger.vo.MsgFileboxVo;
import com.kh.md.messenger.vo.MsgNoteVo;
import com.kh.md.messenger.vo.MsgNoticeVo;
import com.kh.md.messenger.vo.MsgRepleVo;

@Service
public class MessengerServiceImpl implements MessengerService{
	
	private final MessengerDao dao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MessengerServiceImpl(MessengerDao dao, SqlSessionTemplate sst) {
		this.dao = dao;
		this.sst = sst;
	}
	
	//공지톡 게시글 화면
	@Override
	public List<MsgNoticeVo> selectNoticeAll(PageVo pvo) {
		return dao.selectNoticeAll(sst, pvo);
	}
		
	//공지톡 게시글 입력
	@Override
	public int insertNotice(MsgNoticeVo noticeVo) {
		return dao.insertNotice(sst, noticeVo);
	}

	
	//공지톡 상세 화면
	@Override
	public MsgNoticeVo selectOneByNo(String noticeNo) {
		
		int result = dao.increaseHit(sst, noticeNo);
		
		if(result == 1) {
			return dao.selectOneByNo(sst, noticeNo);
		}else {
			return null;
		}
		
	}
	
	//공지톡 수정 화면
	@Override
	public MsgNoticeVo selectEditByNo(String noticeNo) {
		return dao.selectEditByNo(sst, noticeNo);
	}

	//공지톡 수정 처리
	@Override
	public int updateEdit(MsgNoticeVo noticeVo) {
		return dao.updateEdit(sst, noticeVo);
	}

	//공지톡 삭제 처리
	@Override
	public int updateDelete(String noticeNo) {
		return dao.updateDelete(sst, noticeNo);
	}
	
	//공지톡 총 게시글 수
	@Override
	public int selectTotalCnt() {
		return dao.selectTotalCnt(sst);
	}

	//공지톡 댓글 입력
	@Override
	public int insertReple(MsgRepleVo repleVo) {
		return dao.insertReple(sst, repleVo);
	}

	
	//공지톡 댓글 리스트 가져오기
	@Override
	public List<MsgRepleVo> selectRepleList(String noticeNo) {
		return dao.selectRepleList(sst, noticeNo);
	}

	//공지톡 댓글 삭제
	@Override
	public int updateRepleDelete(String repleNo) {
		
		return dao.updateRepleDelete(sst, repleNo); 
		
	}

	
	
	
	
	//메신저 등록 체크
	@Override
	public MessengerVo selectCheckEnroll(String memberNo) {
		return dao.selectCheckEnroll(sst, memberNo);
	}
	
	//메신저 등록 하기
	@Override
	public int insertMessenger(MessengerVo msgVo) {
		return dao.insertMessenger(sst, msgVo);
	}

	//메신저 회원 모두 가져가지
	@Override
	public List<MessengerVo> selectAllMsg() {
		return dao.selectAllMsg(sst);
	}
	
	//메신저 프로필 변경하기
	@Override
	public MessengerVo updateMsgOne(MessengerVo vo) {
		
		int result = dao.updateMsgOne(sst, vo);
		//업데이트된 메신저 멤버로 세션에 다시 넣어주기
		
		MessengerVo updateMsgVo = null;
		if(result == 1) {
			updateMsgVo = dao.selectCheckEnroll(sst, vo.getNo()); //번호로 메신저 멤버 1명 가져오는거 재사용
		}
		
		return  updateMsgVo;
	}

	
	//쪽지 - 보내기
	@Override
	public int insertNoteOne(MsgNoteVo mnVo) {
		return dao.insertNoteOne(sst, mnVo);
	}
	
	//쪽지 - 내역 불러오기
	@Override
	public List<MsgNoteVo> selectNoteListByNo(String msgNo) {
		return dao.selectNoteListByNo(sst, msgNo);
	}

	
	//쪽지 - 검색값으로 쪽지 내역 불러오기
	@Override
	public List<MsgNoteVo> selectNoteKeyword(Map<String, String> map) {
		return dao.selectNoteKeyword(sst, map);
	}

	//쪽지 - 쪽지넘버로 쪽지 1개 가져오기
	@Override
	public MsgNoteVo selectNoteByNo(String repleNoteNo) {
		return dao.selectNoteByNo(sst, repleNoteNo);
	}

	//쪽지 - 쪽지넘버로 쪽지 삭제
	@Override
	public int updateNoteDelete(String deleteNoteNo) {
		return dao.updateNoteDelete(sst, deleteNoteNo);
	}
	
	//쪽지 - 해당 부서 멤버 가져오기
	@Override
	public List<HashMap<String, String>> selectDeptMember(String partName) {
		return dao.selectDeptMember(sst, partName);
	}

	//파일보관함 - 이미지 파일 전부 가져오기
	@Override
	public List<MsgFileboxVo> selectAllFileImgByNo(String msgNo) {
		return dao.selectAllFileImgByNo(sst, msgNo);
	}
	
	//파일보관함 - 예외 파일 전부 가져오기
	@Override
	public List<MsgFileboxVo> selectAllEtcFileByNo(String msgNo) {
		return dao.selectAllEtcFileByNo(sst, msgNo);
	}

	//파일보관함 - 이미지 파일 입력
	@Override
	public int insertImgFilebox(MsgFileboxVo msgFileVo, MsgFileCopyVo copyVo) {
		
		//파일보관함에 파일 추가되면 / 카피 파일 오리진 네임 테이블에 인서트해주기
		int result = dao.insertImgFilebox(sst, msgFileVo);
		
		if(result == 1) {
			return dao.insertCopyFileName(sst, copyVo);
		}else {
			return 0;
		}
	}

	//파일보관함 -  etc 파일 입력
	@Override
	public int insertFilebox(MsgFileboxVo msgFileVo, MsgFileCopyVo copyVo) {
		int result = dao.insertFilebox(sst, msgFileVo);

		//파일보관함에 파일 추가되면 / 카피 파일 오리진 네임 테이블에 인서트해주기
		if(result == 1) {
			return dao.insertCopyFileName(sst, copyVo);
		}else {
			return 0;
		}
	}


	//파일보관함 - 파일 삭제
	@Override
	public int fileBoxDelete(Map<String, String> deleteMap) {
		// TODO Auto-generated method stub
		return dao.fileBoxDelete(sst, deleteMap);
	}

	
	

	
	
	
}//class
