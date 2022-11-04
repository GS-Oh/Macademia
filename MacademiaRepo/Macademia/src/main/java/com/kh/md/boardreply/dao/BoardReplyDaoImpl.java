package com.kh.md.boardreply.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.boardreply.vo.BoardReply;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardReplyDaoImpl implements BoardReplyDao {

	private final SqlSessionTemplate sst;

	@Override
	public List<BoardReply> selectList(String no) {
		return sst.selectList("boardMapper.replyList", no);
	}	
	
	@Override
	public int insertOne(BoardReply vo) {
		return sst.insert("boardMapper.writeReply", vo);
	}
	
	public int deleteOne (BoardReply replyVo) {
		return sst.update("boardMapper.removerReply", replyVo);
	}
}
