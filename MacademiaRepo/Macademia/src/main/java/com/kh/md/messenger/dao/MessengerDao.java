package com.kh.md.messenger.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.messenger.common.PageVo;
import com.kh.md.messenger.vo.MsgNoticeVo;

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
	
	
	
}//class
