package com.kh.md.file.service;

import java.util.List;

import com.kh.md.common.PageVo;
import com.kh.md.file.vo.FileVo;

public interface FileService {

	List<FileVo> getMyfileList(String memberNo, PageVo pv);

	List<FileVo> getMyfileListBySearchName(String no, String searchName, PageVo pv);

	int deleteMyfile(String fileNo);

	int insertMyfile(FileVo vo);

	int getTotalCount();

	int getTotalCount(String searchName);


}
