package com.kh.md.file.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.common.PageVo;
import com.kh.md.file.vo.FileVo;

public interface FileDao {
	
	List<FileVo> selectList(SqlSessionTemplate sst, String memberNo, PageVo pv);

	List<FileVo> selectListBySearchName(SqlSessionTemplate sst, Map<String, String> map, PageVo pv);

	int deleteOne(SqlSessionTemplate sst, String fileNo);

	int insertOne(SqlSessionTemplate sst, FileVo vo);

	int selectTotalCount(SqlSessionTemplate sst);



}
