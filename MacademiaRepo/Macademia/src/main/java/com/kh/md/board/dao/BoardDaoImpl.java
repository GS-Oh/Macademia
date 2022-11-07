package com.kh.md.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.md.board.vo.BoardAttachment;
import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;
import com.kh.md.board.vo.SearchCriteria;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
@RequiredArgsConstructor
public class BoardDaoImpl implements BoardDao {
	
	private final SqlSessionTemplate sst;
	
	@Override
	public int insertBoard(BoardVo vo) {
		return sst.insert("boardMapper.insertBoard", vo);
	}

	@Override
	public List<BoardVo> selectList(SearchCriteria searchCriteria) {
		RowBounds rowBounds = new RowBounds(searchCriteria.getOffSet(), searchCriteria.getSize());
		log.info(""+rowBounds.getOffset());
		log.info(""+rowBounds.getLimit());
		return sst.selectList("boardMapper.selectList", searchCriteria, rowBounds);
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
	public int selectSearchCount(SearchCriteria searchCriteria) {
		return sst.selectOne("boardMapper.selectSearchCount", searchCriteria);
	}

	@Override
	public int insertFile(BoardAttachment attachment) {
		return sst.insert("boardMapper.insertFile", attachment);
	}

	@Override
	public List<BoardAttachment> attachmentList(String no) {
		return sst.selectList("boardMapper.attachmentList", no);
	}

	@Override
	public int updateAttachment(MultipartFile[] file) {
		return sst.update("boardMapper.updateAttachment", file);
	}
}

