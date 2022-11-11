package com.kh.md.noticeBoard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.md.noticeBoard.dao.NoticeBoardDao;
import com.kh.md.noticeBoard.vo.NoticeBoard;
import com.kh.md.noticeBoard.vo.NoticeBoardFile;
import com.kh.md.noticeBoard.vo.NoticeBoardReply;
import com.kh.md.noticeBoard.vo.PageInfo;

@Service("nbService")
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	private NoticeBoardDao nbDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int getListCount() {
		return nbDAO.getListCount(sqlSession);
	}
	
	@Override
	public List<NoticeBoard> selectNoticeBoardList(PageInfo pi) {
		return nbDAO.selectNoticeBoardList(sqlSession, pi);
	}
	
	@Override
	@Transactional
	public int insertNoticeBoard(NoticeBoard noticeBoard, ArrayList<NoticeBoardFile> fList) {
		
		int result1 =  nbDAO.insertNoticeBoard(sqlSession, noticeBoard);
		
		int result2 = 0;
		if (result1 > 0 && !fList.isEmpty()) {
			result2 = nbDAO.insertBoardFile(sqlSession, fList);
		}
		
		return result1 + result2;
	}

	@Override
	public int getSearchListCount(HashMap<String, String> map) {
		return nbDAO.getSearchListCount(sqlSession, map);
	}

	@Override
	public List<NoticeBoard> selectSearchList(PageInfo pi, HashMap<String, String> map) {
		return nbDAO.selectSearchList(sqlSession, pi, map);
	}

	@Override
	@Transactional
	public NoticeBoard selectNoticeBoard(int bNo, String upd) {
		
		int result = 0;
		if (upd == null) {
			result = nbDAO.updateViews(sqlSession, bNo);
		}
		
		NoticeBoard board = null;
		if (result > 0 || upd.equals("Y")) {
			board = nbDAO.selectNoticeBoard(sqlSession, bNo);
		}
		
		return board;
	}

	@Override
	public List<NoticeBoardReply> selectReplyList(int bNo) {
		return nbDAO.selectReplyList(sqlSession, bNo);
	}

	@Override
	public List<NoticeBoardFile> selectFileList(int bNo) {
		return nbDAO.selectFileList(sqlSession, bNo);	
	}

	@Override
	public int getScrapStatus(HashMap<String, String> map) {
		return nbDAO.getScrapStatus(sqlSession, map);	
	}
	
	@Override
	public int insertScrap(HashMap<String, String> map) {
		return nbDAO.insertScrap(sqlSession, map);
	}

	@Override
	public int deleteScrap(HashMap<String, String> map) {
		return nbDAO.deleteScrap(sqlSession, map);
	}

	@Override
	public int insertReply(NoticeBoardReply reply) {
		return nbDAO.insertReply(sqlSession, reply);
	}

	@Override
	public int updateReply(NoticeBoardReply reply) {
		return nbDAO.updateReply(sqlSession, reply);
	}

	@Override
	public int deleteReply(int replyNo) {
		return nbDAO.deleteReply(sqlSession, replyNo);
	}

	@Override
	public int deleteNoticeBoard(int bNo) {
		return nbDAO.deleteNoticeBoard(sqlSession, bNo);
	}

	@Override
	public int deleteFile(List<NoticeBoardFile> fileList) {
		return nbDAO.deleteFile(sqlSession, fileList);
	}

	@Override
	public int updateNoticeBoard(NoticeBoard noticeBoard, ArrayList<NoticeBoardFile> fList) {
		
		int result1 =  nbDAO.updateNoticeBoard(sqlSession, noticeBoard);
		
		int result2 = 0;
		if (result1 > 0 && !fList.isEmpty()) {
			result2 = nbDAO.insertBoardFile(sqlSession, fList);
		}
		
		return result1 + result2;
		
	}

	@Override
	public List<NoticeBoard> selectNoticeBoardListMain() {
		return nbDAO.selectNoticeBoardListMain(sqlSession);
	}


	
}
