package com.kh.md.messenger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.messenger.vo.MsgNoticeVo;

public interface MessengerDao {
	
	//공지톡 게시글 입력
	int insertNotice(SqlSessionTemplate sst, MsgNoticeVo noticeVo);
	
	//공지톡 ( 메인 화면 )
	List<MsgNoticeVo> selectNoticeAll(SqlSessionTemplate sst);

}//class
