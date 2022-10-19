package com.kh.md.messenger.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<MsgNoticeVo> selectNoticeAll() {
		return dao.selectNoticeAll(sst);
	}
		
		
		
		
		
	//공지톡 게시글 입력
	@Override
	public int insertNotice(MsgNoticeVo noticeVo) {
		return dao.insertNotice(sst, noticeVo);
	}

	

	
	
	
}//class
