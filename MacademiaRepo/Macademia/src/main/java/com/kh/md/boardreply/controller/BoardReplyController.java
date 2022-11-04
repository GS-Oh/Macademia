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
	
	@PostMapping("write")
	@ResponseBody
	public int replyWrite(BoardReply vo) {
		int result = boardReplyService.replyWrite(vo);
		return result;
	}
	
	@GetMapping("delete")
	public String replyRemove(BoardReply replyVo) {
		log.info(replyVo.toString());
		String boardNo = replyVo.getBoardNo();
		int result = boardReplyService.removeReply(replyVo);
		if(result == 1) {
			return "redirect:/board/detail/"+ boardNo;
		}
		return "redirect:/board/detail/"+ boardNo;
	}
}
