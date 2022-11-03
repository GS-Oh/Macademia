package com.kh.md.file.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.common.PageVo;
import com.kh.md.file.vo.FileVo;

@Repository
public class FileDaoImpl implements FileDao{

	@Override
	public List<FileVo> selectList(SqlSessionTemplate sst, String memberNo, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		return sst.selectList("myfileMapper.selectList",memberNo,rb);
	}
	@Override
	public List<FileVo> selectListBySearchName(SqlSessionTemplate sst, Map<String, String> map, PageVo pv) {
		int offset = (pv.getCurrentPage()-1) * pv.getBoardLimit();
		int limit = pv.getBoardLimit();
		RowBounds rb = new RowBounds(offset,limit);
		return sst.selectList("myfileMapper.selectListBySearchName",map,rb);
	}
	@Override
	public int deleteOne(SqlSessionTemplate sst, String fileNo) {
		return sst.update("myfileMapper.deleteOne",fileNo);
	}
	@Override
	public int insertOne(SqlSessionTemplate sst, FileVo vo) {
		return sst.insert("myfileMapper.insertOne",vo);
	}
	@Override
	public int selectTotalCount(SqlSessionTemplate sst) {
		return sst.selectOne("myfileMapper.selectTotalCount");
	}


}
