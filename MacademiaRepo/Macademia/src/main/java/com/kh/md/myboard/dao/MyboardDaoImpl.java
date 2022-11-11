package com.kh.md.myboard.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.common.PageVo;
import com.kh.md.myboard.vo.MyboardVo;
import com.kh.md.myboard.vo.SearchVo;

@Repository
public class MyboardDaoImpl implements MyboardDao{

	@Override
	public int selectTotalCount(SqlSessionTemplate sst, SearchVo searchVo) {
		return sst.selectOne("myboardMapper.selectTotalCount",searchVo);
	}

	@Override
	public List<MyboardVo> selectList(SqlSessionTemplate sst, SearchVo searchVo, PageVo pageVo) {
		int offset = (pageVo.getCurrentPage()-1) * pageVo.getBoardLimit();
		int limit = pageVo.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		return sst.selectList("myboardMapper.selectList",searchVo,rb);
	}

}
