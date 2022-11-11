package com.kh.md.myboard.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.board.vo.BoardVo;
import com.kh.md.common.PageVo;
import com.kh.md.myboard.dao.MyboardDao;
import com.kh.md.myboard.vo.MyboardVo;
import com.kh.md.myboard.vo.SearchVo;

@Service
public class MyboardServiceImpl implements MyboardService{
	
	private final MyboardDao myboardDao;
	private final SqlSessionTemplate sst;
	
	@Autowired
	public MyboardServiceImpl(MyboardDao myboardDao, SqlSessionTemplate sst) {
		this.myboardDao = myboardDao;
		this.sst = sst;
	}
	@Override
	public int getTotalCount(SearchVo searchVo) {
		return myboardDao.selectTotalCount(sst, searchVo);
	}
	@Override
	public List<MyboardVo> getList(SearchVo searchVo, PageVo pageVo) {
		return myboardDao.selectList(sst, searchVo, pageVo);
	}
}
