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
	
	public List<BoardReply> selectList(String no) {
		return dao.selectList(no);
	}

	@Override
	public int replyWrite(BoardReply vo) {
		
		return dao.insertOne(vo);
	}
	
	
}
