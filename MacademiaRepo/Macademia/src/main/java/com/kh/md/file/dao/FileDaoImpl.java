package com.kh.md.file.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.file.vo.FileVo;

@Repository
public class FileDaoImpl implements FileDao{

	@Override
	public List<FileVo> selectList(SqlSessionTemplate sst, String memberNo) {
		return sst.selectList("myfileMapper.selectList",memberNo);
	}
	@Override
	public List<FileVo> selectListBySearchName(SqlSessionTemplate sst, Map<String, String> map) {
		return sst.selectList("myfileMapper.selectListBySearchName",map);
	}
	@Override
	public int deleteOne(SqlSessionTemplate sst, String fileNo) {
		return sst.update("myfileMapper.deleteOne",fileNo);
	}
	@Override
	public int insertOne(SqlSessionTemplate sst, FileVo vo) {
		return sst.insert("myfileMapper.insertOne",vo);
	}


}
