package com.kh.md.boardreply.service;

import java.util.List;

import com.kh.md.boardreply.vo.BoardReply;

public interface BoardReplyService {

	List<BoardReply> selectList(String no);

	int replyWrite(BoardReply vo);
	
	int removeReply(BoardReply replyVo);
}
