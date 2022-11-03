package com.kh.md.file.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.md.common.PageVo;
import com.kh.md.common.Pagination;
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
	
	
	
	@GetMapping("/list/{pno}")
	public String myfileList(@PathVariable int pno, HttpSession session,Model model,String searchName) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		int totalCount = fileService.getTotalCount();
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 40);
		
		if(loginMember==null) {
			model.addAttribute("alertMsg","로그인 후 사용가능합니다");
			return "member/mypage";
		}
		
		List<FileVo> fileList;
		if(searchName==null) {
			fileList = fileService.getMyfileList(loginMember.getNo(),pv);
		}else {
			fileList = fileService.getMyfileListBySearchName(loginMember.getNo(),searchName,pv);
		}
		if(fileList!=null) {
			model.addAttribute("fileList", fileList);
			model.addAttribute("pv", pv);
		}
		return "member/myfiles";
	}
	@PostMapping("/delete")
	public String deleteMyfile(HttpSession session,String fileNo,int pno,Model model) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		int result = fileService.deleteMyfile(fileNo); 
		
		int totalCount = fileService.getTotalCount();
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 40);
		
		List<FileVo> fileList = fileService.getMyfileList(loginMember.getNo(),pv);
		model.addAttribute("fileList", fileList);
		
		return "member/myfiles-fragment";
	}
	@PostMapping("/insert")
	public String insertMyfile(HttpSession session,MultipartFile file,int pno,Model model,HttpServletRequest req) {
		FileVo vo = new FileVo();
		System.out.println("==========");
		System.out.println(file);
		System.out.println("==========");
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
//		MultipartFile file = vo.getFile();
//		String savePath = req.getServletContext().getRealPath("/resources/upload/myfile/");
//		String updateName = FileUploader.uploadFile(file, savePath);
//		String originName = file.getName();
//		
//		vo.setMemberNo(memberNo);
//		vo.setOriginName(originName);
//		vo.setUpdateName(updateName);
//
//		int result = fileService.insertMyfile(vo);
//		
		int totalCount = fileService.getTotalCount();
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 40);
		List<FileVo> fileList = fileService.getMyfileList(memberNo,pv);
		model.addAttribute("fileList", fileList);
		return "member/myfiles-fragment";
		
	}
}
