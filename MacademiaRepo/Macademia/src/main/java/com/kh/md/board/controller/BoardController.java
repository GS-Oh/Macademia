package com.kh.md.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("board")
public class BoardController {

	@GetMapping("main")
	public String boardHome() {
		return "board/board";
	}
	@GetMapping("detail")
	public String boardDetail() {
		return "board/detail";
	}
	@GetMapping("write")
	public String boardWrite() {
		return "board/write";
	}
	@GetMapping("edit")
	public String boardEdit() {
		return "board/edit";
	}
}
