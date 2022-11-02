package com.kh.md.file.service;

import java.util.List;

import com.kh.md.file.vo.FileVo;

public interface FileService {

	List<FileVo> getMyfileList(String memberNo);

	List<FileVo> getMyfileListBySearchName(String no, String searchName);

	int deleteMyfile(String fileNo);

	int insertMyfile(FileVo vo);

}
