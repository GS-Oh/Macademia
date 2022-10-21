package com.kh.md.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("meetingRoom")
public class RoomController {

	@GetMapping("main")
	public String roomHome() {
		return "mtroom/mtroom";
	}
	
}
