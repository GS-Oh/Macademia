package com.kh.md.board.service;

import java.util.List;

import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;

public interface BoardService {
	List<BoardVo> get();
	
	//게시글 insert
		int insertBoard(BoardVo vo);
		//게시글 목록조회
		List<BoardVo> selectList(PageVo pv);
		//게시글 상세조회
		BoardVo selectOne( String no);
		//게시글 수정
		int updateOne(BoardVo vo);
		//게시글 개수 조회
		int selectCountAll();
		//게시글 삭제
		int delete(String no);
		//게시글 조회수 증가
		int increaseHit(String no);
}
