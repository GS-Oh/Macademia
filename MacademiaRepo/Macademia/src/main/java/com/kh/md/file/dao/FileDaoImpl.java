package com.kh.md.file.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.file.vo.FileVo;

@Repository
public class FileDaoImpl implements FileDao{

	@Override
	public List<FileVo> selectPrivatefileList(SqlSessionTemplate sst, String memberNo) {
		return sst.selectList("privatefileMapper.selectList",memberNo);
		
	}


}
