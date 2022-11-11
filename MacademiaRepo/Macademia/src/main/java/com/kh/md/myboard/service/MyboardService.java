package com.kh.md.myboard.service;

import java.util.List;

import com.kh.md.common.PageVo;
import com.kh.md.myboard.vo.MyboardVo;
import com.kh.md.myboard.vo.SearchVo;

public interface MyboardService {

	int getTotalCount(SearchVo searchVo);

	List<MyboardVo> getList(SearchVo searchVo, PageVo pageVo);

}
