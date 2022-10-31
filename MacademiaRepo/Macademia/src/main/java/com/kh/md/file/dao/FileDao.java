package com.kh.md.file.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.file.vo.FileVo;

public interface FileDao {
	
	List<FileVo> selectList(SqlSessionTemplate sst, String memberNo);

	List<FileVo> selectListBySearchName(SqlSessionTemplate sst, Map<String, String> map);


}
