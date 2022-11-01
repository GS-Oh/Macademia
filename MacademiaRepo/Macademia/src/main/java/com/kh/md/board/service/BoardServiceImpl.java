package com.kh.md.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.md.board.dao.BoardDao;
import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	
	private final BoardDao boardDao;
		
		//게시글 작성
		@Override
		public int insertBoard(BoardVo vo) {
			int result = boardDao.insertBoard(vo);
			return result;
		}
		
		//게시글 목록 조회
		@Override
		public List<BoardVo> selectList(PageVo pv) {
			return boardDao.selectList(pv);
		}
		
		//게시글 상세 조회
		@Override
		public BoardVo selectOne(String no) {
			int result = boardDao.increaseHit(no);
			if(result == 1) {
				return boardDao.selectOne(no);			
			}else {
				return null;
			}
		}
		
		//게시글 수정 
		@Override
		public int updateOne(BoardVo vo) {
			
			return boardDao.updateOne(vo);
		}
		
		//게시글 개수 조회
		@Override
		public int selectCountAll() {
			return boardDao.selectCountAll();
		}

		//게시글 삭제
		@Override
		public int delete(String no) {
			return boardDao.delete(no);
		}
		//게시글 조회수 증가
		@Override
		public int increaseHit(String no) {
			return boardDao.increaseHit(no);
		}
		
		//게시글 검색하기
		@Override
		public List<BoardVo> searchList(PageVo pv, Map<String, String> map) {
			return boardDao.searchList(pv, map);
		}

		@Override
		public int selectSearchCount(Map<String, String> map) {
			return boardDao.selectSearchCount(map);
		}
}
