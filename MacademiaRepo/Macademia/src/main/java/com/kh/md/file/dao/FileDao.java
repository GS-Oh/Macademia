package com.kh.md.file.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.file.vo.FileVo;

public interface FileDao {

	List<FileVo> selectPrivatefileList(SqlSessionTemplate sst, String memberNo);

}
