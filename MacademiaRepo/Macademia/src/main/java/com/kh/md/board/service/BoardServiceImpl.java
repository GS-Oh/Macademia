package com.kh.md.board.service;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.md.board.dao.BoardDao;
import com.kh.md.board.vo.BoardAttachment;
import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;
import com.kh.md.board.vo.SearchCriteria;
import org.apache.commons.io.FileUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	
	private final BoardDao boardDao;
		
		//게시글 작성
		@Override
		@Transactional
		public int insertBoard(BoardVo vo, HttpServletRequest req) {
			int result = boardDao.insertBoard(vo);
			//확장자명 가져오는 유틸
			//FilenameUtils.getExtension(null)
			
			BoardAttachment AttachmentVo = new BoardAttachment();
			AttachmentVo.setBoardNo(String.valueOf(vo.getNo()));
			
			//<파일 저장> 		
			MultipartFile[] fArr = vo.getFile();
			//파일이 있는지 확인
			
			if(!fArr[0].isEmpty()) { //클라이언트로 부터 전달받은 파일 있는 상태
				
				for(int i =0; i<fArr.length; i++) {
					MultipartFile f= fArr[i];
					
					String changedFileName = makeFileName(f);
					
					//저장할 경로 파일 객체 생성
					String rootpath = req.getServletContext().getRealPath("/resources/upload/board/");
					File targetFile = new File(rootpath + changedFileName);
					
					AttachmentVo.setFileName(changedFileName);
					AttachmentVo.setFilePath(rootpath);					
					AttachmentVo.setOriginName(f.getOriginalFilename());
					//저장
					boardDao.insertFile(AttachmentVo);
					try {
						f.transferTo(targetFile);
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
			}
			
			return result;
		}
		
//		private void fileUpload(MultipartFile... file) {
//			if(file != null) { //클라이언트로 부터 전달받은 파일 있는 상태
//				for(MultipartFile f : file) {
//					
//					String changedFileName = makeFileName(f);
//					
//					//저장할 경로 파일 객체 생성
//					String rootpath = req.getServletContext().getRealPath("/resources/upload/board/");
//					File targetFile = new File(rootpath + changedFileName);
//					
//					AttachmentVo.setFileName(changedFileName);
//					AttachmentVo.setFilePath(rootpath);					
//					AttachmentVo.setOriginName(f.getOriginalFilename());
//					//저장
//					boardDao.insertFile(AttachmentVo);
//					try {
//						f.transferTo(targetFile);
//					}catch (Exception e) {
//						e.printStackTrace();
//					}
//				}
//			}
//		}
		
		private String makeFileName(MultipartFile file) {
			//원본파일명 얻어오기
			String originName = file.getOriginalFilename();
			String ext = originName.substring(originName.lastIndexOf(".")); //확장자명 가져오기 ex) .png
			return UUID.randomUUID().toString() + ext;
		
		}
		
		//게시글 목록 조회
		@Override
		public List<BoardVo> selectList(SearchCriteria searchCriteria) {
			return boardDao.selectList(searchCriteria);
		}
		
		//게시글 상세 조회
		@Override
		public BoardVo selectOne(String no) {
			int result = boardDao.increaseHit(no);
			if(result == 1) {
				return boardDao.selectOne(no);			
			}else {
				return null;
			}
		}
		
		//게시글 수정 
		@Override
		public int updateOne(BoardVo vo, HttpServletRequest req) {
			
			BoardAttachment AttachmentVo = new BoardAttachment();
			AttachmentVo.setBoardNo(String.valueOf(vo.getNo()));
			//<파일 저장> 		
			MultipartFile[] fArr = vo.getFile();
			//파일이 있는지 확인
			if(!fArr[0].isEmpty()) { //클라이언트로 부터 전달받은 파일 있는 상태
				
				for(int i =0; i<fArr.length; i++) {
					MultipartFile f= fArr[i];
					
					//원본파일명 얻어오기
					String originName = f.getOriginalFilename();
					String ext = originName.substring(originName.lastIndexOf(".")); //확장자명 가져오기 ex) .png
					//변경할 파일명 붙이기 
					long now = System.currentTimeMillis();
					int randomNum = (int)(Math.random() * 90000 + 10000);
					String changeFileName = now + "_" + randomNum;
					
					//저장할 경로 파일 객체 생성
					String rootpath = req.getServletContext().getRealPath("/resources/upload/board/");
					File targetFile = new File(rootpath + changeFileName + ext);
					
					AttachmentVo.setFileName(changeFileName+ext);
					AttachmentVo.setFilePath(rootpath);					
					AttachmentVo.setOriginName(originName);
					//저장
					boardDao.insertFile(AttachmentVo);
					try {
						f.transferTo(targetFile);
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
			}	
			return boardDao.updateOne(vo);
		}
		
		//게시글 개수 조회
		@Override
		public int selectCountAll() {
			return boardDao.selectCountAll();
		}

		//게시글 삭제
		@Override
		public int delete(String no) {
			return boardDao.delete(no);
		}
		//게시글 조회수 증가
		@Override
		public int increaseHit(String no) {
			return boardDao.increaseHit(no);
		}
		
		//게시글 검색하기
		@Override
		public List<BoardVo> searchList(PageVo pv, Map<String, String> map) {
			return boardDao.searchList(pv, map);
		}
		
		@Override
		public int selectSearchCount(SearchCriteria searchCriteria) {
			return boardDao.selectSearchCount(searchCriteria);
		}

		//게시글에 업로드한 파일 리스트
		@Override
		public List<BoardAttachment> attachmentList(String no) {
			return boardDao.attachmentList(no);
		}
		//게시글의 파일 업데이트
		@Override
		public int updateattachment(MultipartFile[] file) {
			return boardDao.updateAttachment(file);
		}

		@Override
		public void deleteFile(BoardAttachment attachment) {
			// TODO Auto-generated method stub
			
		}
		
}
