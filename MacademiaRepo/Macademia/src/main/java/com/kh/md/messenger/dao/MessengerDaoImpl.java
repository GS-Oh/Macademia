package com.kh.md.messenger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.messenger.vo.MsgNoticeVo;

@Repository
public class MessengerDaoImpl implements MessengerDao{

	//공지톡 게시글 ( 입력 )
	@Override
	public int insertNotice(SqlSessionTemplate sst, MsgNoticeVo noticeVo) {
		return sst.insert("messengerMapper.insertNotice", noticeVo);
	}
	
	
	//공지톡 게시글 ( 메인 화면 )
	@Override
	public List<MsgNoticeVo> selectNoticeAll(SqlSessionTemplate sst) {
		return sst.selectList("messengerMapper.selectNoticeAll");
	}

	
	
	
}//class
