package com.kh.md.file.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.file.dao.FileDao;
import com.kh.md.file.vo.FileVo;

@Service
public class FileServiceImpl implements FileService{
	
	 private final FileDao fileDao;
	 private final SqlSessionTemplate sst;
	 
	 @Autowired
	 public FileServiceImpl(FileDao fileDao, SqlSessionTemplate sst) {
			this.fileDao = fileDao;
			this.sst = sst;
	 }
	
	@Override
	public List<FileVo> getMyfileList(String memberNo) {
		List<FileVo> fileList = fileDao.selectList(sst,memberNo);
		return fileList;
	}

	@Override
	public List<FileVo> getMyfileListBySearchName(String memberNo, String searchName) {
		Map<String,String> map = new HashMap<>();
		map.put("memberNo",memberNo);
		map.put("searchName",searchName);
		List<FileVo> fileList = fileDao.selectListBySearchName(sst,map);
		return fileList;
	}

	@Override
	public int deleteMyfile(String fileNo) {
		int result = fileDao.deleteOne(sst,fileNo);
		return result;
	}

	@Override
	public int insertMyfile(FileVo vo) {
		int result = fileDao.insertOne(sst,vo);
		return result;
	}
}
