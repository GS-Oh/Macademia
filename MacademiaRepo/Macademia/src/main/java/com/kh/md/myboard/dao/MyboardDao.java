package com.kh.md.myboard.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.common.PageVo;
import com.kh.md.myboard.vo.MyboardVo;
import com.kh.md.myboard.vo.SearchVo;

public interface MyboardDao {

	int selectTotalCount(SqlSessionTemplate sst, SearchVo searchVo);

	List<MyboardVo> selectList(SqlSessionTemplate sst, SearchVo searchVo, PageVo pageVo);

}
