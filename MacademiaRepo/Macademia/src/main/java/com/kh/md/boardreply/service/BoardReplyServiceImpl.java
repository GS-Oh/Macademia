package com.kh.md.boardreply.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.md.boardreply.dao.BoardReplyDao;
import com.kh.md.boardreply.vo.BoardReply;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class BoardReplyServiceImpl implements BoardReplyService {
	
	private final BoardReplyDao dao;
	
	//댓글 목록
	public List<BoardReply> selectList(String no) {
		return dao.selectList(no);
	}
	//댓글 작성
	@Override
	public int replyWrite(BoardReply vo) {		
		return dao.insertOne(vo);
	}
	//댓글 삭제
	@Override
	public int removeReply(BoardReply replyNo) {
		return dao.deleteOne(replyNo);
	}
	@Override
	public List<BoardReply> selectListFreeBoard(String no) {
		return dao.selectListFreeBoard(no);
	}
	@Override
	public int replyWriteFreeBoard(BoardReply vo) {
		return dao.insertOneFreeBoard(vo);
	}
	@Override
	public int removeReplyFreeBoard(BoardReply replyNo) {
		return dao.deleteOneFreeBoard(replyNo);
	}
}
