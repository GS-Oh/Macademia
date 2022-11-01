package com.kh.md.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class BoardDaoImpl implements BoardDao {
	
	private final SqlSessionTemplate sst;
	
	@Override
	public int insertBoard(BoardVo vo) {
		return sst.insert("boardMapper.insertBoard", vo);
	}

	@Override
	public List<BoardVo> selectList(PageVo pv) {
		int offset = (pv.getCurrentPage() -1) * pv.getBoardLimit();
				
		RowBounds rb = new RowBounds(offset ,pv.getBoardLimit());
		return sst.selectList("boardMapper.selectList",null, rb);
	}

	@Override
	public BoardVo selectOne(String no) {
		return sst.selectOne("boardMapper.selectOne", no);
	}

	@Override
	public int increaseHit(String no) {
		return sst.update("boardMapper.increaseHit", no);
	}

	@Override
	public int updateOne(BoardVo vo) {
		return sst.update("boardMapper.updateOne", vo);
	}

	@Override
	public int selectCountAll() {
		return sst.selectOne("boardMapper.selectCountAll");
	}

	@Override
	public int delete(String no) {
		return sst.update("boardMapper.deleteBoard", no);
	}

	@Override
	public List<BoardVo> searchList(PageVo pv, Map<String, String> map) {
		int offset = (pv.getCurrentPage() -1) * pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset ,pv.getBoardLimit());
		return sst.selectList("boardMapper.searchList" ,map, rb);
	}

	@Override
	public int selectSearchCount(Map<String, String> map) {
		return sst.selectOne("boardMapper.selectSearchCount", map);
	}
}

