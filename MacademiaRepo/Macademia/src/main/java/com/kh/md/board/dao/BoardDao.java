package com.kh.md.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.md.board.vo.BoardAttachment;
import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;
import com.kh.md.board.vo.SearchCriteria;


public interface BoardDao {
	//게시글 insert
	int insertBoard(BoardVo vo);
	int insertFreeBoard(BoardVo vo);
	//게시글 목록조회
	List<BoardVo> selectList(SearchCriteria searchCriteria);
	List<BoardVo> selectListFreeBoard(SearchCriteria searchCriteria);
	
	//게시글 상세조회
	BoardVo selectOne(String no);
	BoardVo selectOneFreeBoard(String no);
	
	//게시글 조회수 증가
	int increaseHit(String no);
	int increaseHitFreeBoard(String no);
	
	//게시글 수정
	int updateOne(BoardVo vo);
	int updateOneFreeBoard(BoardVo vo);
	
	//게시글 개수 조회
	int selectCountAll(); 
	int selectCountAllFreeBoard(); 
	
	//게시글 삭제
	int delete(String no);
	int deleteFreeBoard(String no);
	
	//게시글 검색
	List<BoardVo> searchList(PageVo pv, Map<String, String> map);
	List<BoardVo> searchListFreeBoard(PageVo pv, Map<String, String> map);
	
	//검색한 게시글 개수
	int selectSearchCount(SearchCriteria searchCriteria);
	int selectSearchCountFreeBoard(SearchCriteria searchCriteria);
	
	//파일 업로드
	int insertFile(BoardAttachment attachment);
	int insertFileFreeBoard(BoardAttachment attachment);
	
	//게시글의 파일업로드 리스트 
	List<BoardAttachment> attachmentList(String no);
	List<BoardAttachment> attachmentListFreeBoard(String no);
	//게시글의 파일 업데이트
	int updateAttachment(MultipartFile[] file); 
	int updateAttachmentFreeBoard(MultipartFile[] file);
	//썸네일 이미지
	List<BoardAttachment> selectThumbnailList();
	//썸네일 이미지 저장
	int saveThumbnail(BoardVo vo);
	//썸네일 이름 가져오기
	String selectThumbnailByNo(String valueOf);
	//썸네일 삭제
	int deleteThumbnailByNo(String valueOf); 
}
