package com.kh.md.board.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.kh.md.board.service.BoardService;
import com.kh.md.board.util.Pagination;
import com.kh.md.board.vo.BoardAttachment;
import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;
import com.kh.md.board.vo.SearchCriteria;
import com.kh.md.boardreply.service.BoardReplyService;
import com.kh.md.boardreply.vo.BoardReply;
import com.kh.md.member.vo.MemberVo;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("board")
@RequiredArgsConstructor
public class BoardController {
	
	private final BoardService service;
	private final BoardReplyService replyService;

	//자료공유 게시판 화면
	@GetMapping("data")
	public String dataList(Model model, SearchCriteria searchCriteria) {
		log.info(searchCriteria.toString());
		List<BoardVo> boardList = service.selectList(searchCriteria);
		int count = service.selectSearchCount(searchCriteria);
		PageVo pageVo = Pagination.calculate(
				searchCriteria.getPage(), 
				searchCriteria.getSize(), 
				(long)count);
		log.info(pageVo.toString());
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageVo", pageVo);
		model.addAttribute("queryString", getQueryString(searchCriteria));
		return "board/databoard";
	}
	
	//검색어 설정
	private String getQueryString(SearchCriteria searchCriteria) {
		StringBuilder sb = new StringBuilder();
		Field[] fields = searchCriteria.getClass().getDeclaredFields();
		for(Field f: fields) {
			f.setAccessible(true);
			try {
				if(f.get(searchCriteria) == null || 
						!(f.get(searchCriteria) instanceof String)) {
					continue;
				} else {
					sb.append(f.getName() + "=" + f.get(searchCriteria))
					.append("&");
				}	
			} catch (Exception ignored) {}
		}
		return sb.toString();
	}
	//게시글 상세 조회 화면
	@GetMapping("/data/detail/{no}")
	public String detail(@PathVariable(required = false) String no, Model model) {
		BoardVo vo = service.selectOne(no);
		List<BoardReply> replyVo = replyService.selectList(no);
		List<BoardAttachment> attachments =  service.attachmentList(no); 
		model.addAttribute("vo", vo);
		log.info(vo.toString());
		model.addAttribute("replyVo", replyVo);
		model.addAttribute("attachments", attachments);
		return "board/detail";
	}
	
	//게시판 작성 화면
	@GetMapping("/data/write")
	public String boardWrite(HttpSession session) {
		return "board/write";
	}
	
	//게시글 작성
	@PostMapping("data/write")
	public String wirte(BoardVo vo, Model model, HttpSession session, HttpServletRequest req) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember"); 
		String no = loginMember.getNo();
		vo.setUserNo(no);
		int result = service.insertBoard(vo, req);
		if(result == 1) {
			return "redirect:/board/data/";
		}else {
			return "error/errorPage";
		}
	}
	
	//게시글 수정 화면
	@GetMapping("/data/edit/{no}")
	public String edit(@PathVariable String no, Model model) {
		BoardVo vo = service.selectOne(no);
		List<BoardAttachment> attachments =  service.attachmentList(no); 
		model.addAttribute("vo", vo);
		model.addAttribute("attachments", attachments);
		return "board/edit";
	}
		
		//게시글 수정 로직
	@PostMapping("/data/edit/{no}")
	public String edit(@PathVariable int no, BoardVo vo, HttpServletRequest req) {
		vo.setNo(no);
		int result = service.updateOne(vo, req);
				
		if(result == 1) {
			return "redirect:/board/data/detail/" + no;			
		}else {
			return "redirect:/";
		}
	}
	
	//게시판 삭제
	@GetMapping("/data/delete/{no}")
	public String delete(@PathVariable String no, HttpSession session, Model model) {
		int result = service.delete(no);
		if(result == 1 ) {
			return "redirect:/board/data/";
		}else {
			return "common/errorPage";
		}
	}
		
	//파일 등록하기
	@PostMapping(value="uploadSummernoteImageFile", produces = "application/json")
    @ResponseBody
    public JsonObject uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile) {
        JsonObject jsonObject = new JsonObject();
        String fileRoot = "C:\\summernote_image\\";	//저장될 외부 파일 경로
        String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
        String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
        String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
        File targetFile = new File(fileRoot + savedFileName);
        try {
            InputStream fileStream = multipartFile.getInputStream();
            FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
            jsonObject.addProperty("url", "/summernoteImage/"+savedFileName);
            jsonObject.addProperty("responseCode", "success");

        } catch (IOException e) {
            FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
            jsonObject.addProperty("responseCode", "error");
            e.printStackTrace();
        }
        return jsonObject;
    }
	//게시글의 업로드 파일 삭제
	@GetMapping("/data/deleteFile")
	public String deleteFile(BoardAttachment attachment, HttpServletRequest req) {
		service.deleteFile(attachment, req);
		return "redirect:/board/data/edit/" + attachment.getBoardNo();
	}
	
	//자유 게시판 화면
		@GetMapping("free")
		public String freeboardList(Model model, SearchCriteria searchCriteria) {
			log.info(searchCriteria.toString());
			searchCriteria.setSize(6);
			List<BoardVo> boardList = service.selectListFreeBoard(searchCriteria);
			List<BoardAttachment> attachments = service.thumbnailList();
			int count = service.selectSearchCountFreeBoard(searchCriteria);
			PageVo pageVo = Pagination.calculate(
					searchCriteria.getPage(), 
					searchCriteria.getSize(), 
					(long)count);
			log.info(pageVo.toString());
			model.addAttribute("boardList", boardList);
			model.addAttribute("attachments", attachments);
			model.addAttribute("pageVo", pageVo);
			model.addAttribute("queryString", getQueryString(searchCriteria));
			return "board/freeboard";
		}
		//자유게시판 게시글 상세 조회 화면
		@GetMapping("free/detail/{no}")
		public String freeboardDetail(@PathVariable(required = false) String no, Model model) {
			BoardVo vo = service.selectOneFreeBoard(no);
			List<BoardReply> replyVo = replyService.selectListFreeBoard(no);
			List<BoardAttachment> attachments =  service.attachmentListFreeBoard(no); 
			model.addAttribute("vo", vo);
			model.addAttribute("replyVo", replyVo);
			model.addAttribute("attachments", attachments);
			return "board/freeDetail";
		}
		//자유게시판 작성 화면
		@GetMapping("free/write")
		public String freeboardWrite(HttpSession session) {
			return "board/freeWrite";
		}
		//자유게시글 작성
		@PostMapping("free/write")
		public String freeboardWirte(BoardVo vo, Model model, HttpSession session, HttpServletRequest req) {
			
			  MemberVo loginMember = (MemberVo)session.getAttribute("loginMember"); 
			  String no = loginMember.getNo();
			  vo.setUserNo(no);
			 
			//비즈니스 로직
			int result = service.insertFreeBoard(vo, req);	
			//화면 선택
			if(result == 1) {
				return "redirect:/board/free";
			}else {
				return "error/errorPage";
			}
		}
		//자유게시판 게시글 수정 화면
		@GetMapping("free/edit/{no}")
		public String freeboardEdit(@PathVariable String no, Model model) {
			BoardVo vo = service.selectOneFreeBoard(no);
			List<BoardAttachment> attachments =  service.attachmentListFreeBoard(no); 
			model.addAttribute("vo", vo);
			model.addAttribute("attachments", attachments);
			return "board/freeEdit";
		}
		//자유게시판 게시글 수정 로직
		@PostMapping("free/edit/{no}")
		public String freeboardEdit(@PathVariable int no, BoardVo vo, HttpServletRequest req) {
			vo.setNo(no);
			int result = service.updateOneFreeBoard(vo, req);
			if(result == 1) {
				return "redirect:/board/free/detail/" + no;			
			}else {
				return "redirect:/";
			}
		}
		//자유게시판 삭제		
		@GetMapping("free/delete/{no}")
		public String freeboardDelete(@PathVariable String no, HttpSession session, Model model) {
			int result = service.deleteFreeBoard(no);
			if(result == 1 ) {
				return "redirect:/board/free/";
			}else {
				return "common/errorPage";
			}
		}
}