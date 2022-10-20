package com.kh.md.messenger.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.dao.MessengerDao;
import com.kh.md.messenger.vo.MsgNoticeVo;

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
	public MsgNoticeVo selectOneByNo(String no) {
		
		int result = dao.increaseHit(sst, no);
		
		if(result == 1) {
			return dao.selectOneByNo(sst, no);
		}else {
			return null;
		}
		
	}
	
	//공지톡 수정 화면
	@Override
	public MsgNoticeVo selectEditByNo(String no) {
		return dao.selectEditByNo(sst, no);
	}

	//공지톡 수정 처리
	@Override
	public int updateEdit(MsgNoticeVo noticeVo) {
		return dao.updateEdit(sst, noticeVo);
	}

	//공지톡 삭제 처리
	@Override
	public int updateDelete(String no) {
		return dao.updateDelete(sst, no);
	}
	
	//공지톡 총 게시글 수
	@Override
	public int selectTotalCnt() {
		return dao.selectTotalCnt(sst);
	}
	
	

	
	
	
}//class
