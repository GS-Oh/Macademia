package com.kh.md.noticeBoard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.md.noticeBoard.vo.NoticeBoard;
import com.kh.md.noticeBoard.vo.NoticeBoardFile;
import com.kh.md.noticeBoard.vo.NoticeBoardReply;
import com.kh.md.noticeBoard.vo.PageInfo;

public interface NoticeBoardService {

	int getListCount();

	int insertNoticeBoard(NoticeBoard noticeBoard, ArrayList<NoticeBoardFile> fList);

	List<NoticeBoard> selectNoticeBoardList(PageInfo pi);

	int getSearchListCount(HashMap<String, String> map);

	List<NoticeBoard> selectSearchList(PageInfo pi, HashMap<String, String> map);

	NoticeBoard selectNoticeBoard(int bNo, String upd);

	List<NoticeBoardReply> selectReplyList(int bNo);

	List<NoticeBoardFile> selectFileList(int bNo);
	
	int getScrapStatus(HashMap<String, String> map);

	int insertScrap(HashMap<String, String> map);
	
	int deleteScrap(HashMap<String, String> map);

	int insertReply(NoticeBoardReply reply);

	int updateReply(NoticeBoardReply reply);

	int deleteReply(int replyNo);

	int deleteNoticeBoard(int bNo);

	int deleteFile(List<NoticeBoardFile> fileList);

	int updateNoticeBoard(NoticeBoard noticeBoard, ArrayList<NoticeBoardFile> fList);

	List<NoticeBoard> selectNoticeBoardListMain();


}