package com.kh.md.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.kh.md.board.vo.BoardAttachment;
import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;
import com.kh.md.board.vo.SearchCriteria;

public interface BoardService {
		//게시글 insert
		int insertBoard(BoardVo vo, HttpServletRequest req);
		//게시글 목록조회
		List<BoardVo> selectList(SearchCriteria searchCriteria);
		//게시글 상세조회
		BoardVo selectOne(String no);
		//게시글 수정
		int updateOne(BoardVo vo, HttpServletRequest req);
		//게시글 개수 조회
		int selectCountAll();
		//게시글 삭제
		int delete(String no);
		//게시글 조회수 증가
		int increaseHit(String no);
		//게시글 검색하기
		List<BoardVo> searchList(PageVo pv, Map<String, String> map);
		//검색한 게시글 개수
		int selectSearchCount(SearchCriteria searchCriteria);
		//게시글에 업로드한 파일 보여주기
		List<BoardAttachment> attachmentList(String no);
		//게시글에 파일 업데이트하기
		int updateattachment(MultipartFile[] file);
		//게시글의 파일 삭제
		void deleteFile(BoardAttachment attachment);
		
		//자유게시판 영역
		int insertFreeBoard(BoardVo vo, HttpServletRequest req);
		
		List<BoardVo> selectListFreeBoard(SearchCriteria searchCriteria);
		
		BoardVo selectOneFreeBoard(String no);
		
		int updateOneFreeBoard(BoardVo vo, HttpServletRequest req);
		
		int selectCountAllFreeBoard();
		
		int deleteFreeBoard(String no);
		
		int increaseHitFreeBoard(String no);
		
		List<BoardVo> searchListFreeBoard(PageVo pv, Map<String, String> map);
		
		int selectSearchCountFreeBoard(SearchCriteria searchCriteria);
		
		List<BoardAttachment> attachmentListFreeBoard(String no);
		
		int updateattachmentFreeBoard(MultipartFile[] file);
		
		void deleteFileFreeBoard(BoardAttachment attachment);
		
		//썸네일
		List<BoardAttachment> thumbnailList();
}
