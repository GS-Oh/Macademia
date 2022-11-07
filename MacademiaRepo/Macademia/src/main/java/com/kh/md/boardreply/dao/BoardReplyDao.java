package com.kh.md.boardreply.dao;

import java.util.List;

import com.kh.md.boardreply.vo.BoardReply;


public interface BoardReplyDao {

	List<BoardReply> selectList(String no);

	int insertOne(BoardReply vo);
	
	int deleteOne (BoardReply replyNo);

	List<BoardReply> selectListFreeBoard(String no);

	int insertOneFreeBoard(BoardReply vo);

	int deleteOneFreeBoard(BoardReply replyNo);
	
}
