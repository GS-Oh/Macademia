package com.kh.md.boardreply.dao;

import java.util.List;

import com.kh.md.boardreply.vo.BoardReply;


public interface BoardReplyDao {

	List<BoardReply> selectList(String no);

	int insertOne(BoardReply vo);
	
}
