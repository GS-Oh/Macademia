package com.kh.md.boardreply.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.md.boardreply.service.BoardReplyService;
import com.kh.md.boardreply.vo.BoardReply;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("reply")
public class BoardReplyController {
	
	private final BoardReplyService boardReplyService;
	//자료공유게시판
	@PostMapping("data/write")
	@ResponseBody
	public int replyWrite(BoardReply vo) {
		int result = boardReplyService.replyWrite(vo);
		return result;
	}
	
	@GetMapping("/data/delete")
	public String replyRemove(BoardReply replyVo) {
		log.info(replyVo.toString());
		String boardNo = replyVo.getBoardNo();
		int result = boardReplyService.removeReply(replyVo);
		if(result == 1) {
			return "redirect:/board/data/detail/"+ boardNo;
		}
		return "redirect:/board/data/detail/"+ boardNo;
	}
	
	//자유게시판
	@PostMapping("free/write")
	@ResponseBody
	public int replyWriteFreeBoard(BoardReply vo) {
		int result = boardReplyService.replyWriteFreeBoard(vo);
		return result;
	}
	
	@GetMapping("/free/delete")
	public String replyRemoveFreeBoard(BoardReply replyVo) {
		log.info(replyVo.toString());
		String boardNo = replyVo.getBoardNo();
		int result = boardReplyService.removeReplyFreeBoard(replyVo);
		if(result == 1) {
			return "redirect:/board/free/detail/"+ boardNo;
		}
		return "redirect:/board/free/detail/"+ boardNo;
	}
}
