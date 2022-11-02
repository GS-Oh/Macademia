package com.kh.md.file.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.md.common.FileUploader;
import com.kh.md.file.service.FileService;
import com.kh.md.file.vo.FileVo;
import com.kh.md.member.vo.MemberVo;

@Controller
@RequestMapping("/myfile")
public class FileController {
	
	private final FileService fileService;
	
	@Autowired
	public FileController(FileService fileService) {
		this.fileService = fileService;
	}

	@GetMapping("/list")
	public String myfileList(HttpSession session,Model model,String searchName) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		List<FileVo> fileList;
		if(searchName==null) {
			fileList = fileService.getMyfileList(loginMember.getNo());
		}else {
			fileList = fileService.getMyfileListBySearchName(loginMember.getNo(),searchName);
		}
		if(fileList!=null) {
			model.addAttribute("fileList", fileList);
		}
		return "member/myfiles";
	}
	@PostMapping("/delete")
	public String deleteMyfile(HttpSession session,String fileNo,Model model) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		int result = fileService.deleteMyfile(fileNo); 
		List<FileVo> fileList = fileService.getMyfileList(loginMember.getNo());
		model.addAttribute("fileList", fileList);
		return "member/myfiles-fragment";
	}
	@PostMapping("/insert")
	public String insertMyfile(HttpSession session,FileVo vo,Model model,HttpServletRequest req) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
		MultipartFile file = vo.getFile();
		String savePath = req.getServletContext().getRealPath("/resources/upload/myfile/");
		String updateName = FileUploader.uploadFile(file, savePath);
		String originName = file.getName();
		
		vo.setMemberNo(memberNo);
		vo.setOriginName(originName);
		vo.setUpdateName(updateName);

		int result = fileService.insertMyfile(vo);
		
		List<FileVo> fileList = fileService.getMyfileList(memberNo);
		model.addAttribute("fileList", fileList);
		return "member/myfiles-fragment";
		
	}
}
