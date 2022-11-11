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

import com.kh.md.common.FileUploader;
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
		if(loginMember==null) {
			model.addAttribute("alertMsg","로그인 후 사용가능합니다");
			return "member/mypage";
		}
		
		int totalCount = fileService.getTotalCount(searchName);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 40);
		List<FileVo> fileList = fileService.getMyfileListBySearchName(loginMember.getNo(),searchName,pv);

		if(fileList!=null) {
			model.addAttribute("fileList", fileList);
			model.addAttribute("searchName", searchName);
			model.addAttribute("pv", pv);
		}
		return "myfile/list";
	}
	@PostMapping("/list/{pno}")
	public String myfileListAjax(@PathVariable int pno, HttpSession session,Model model,String searchName) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		if(loginMember==null) {
			model.addAttribute("alertMsg","로그인 후 사용가능합니다");
			return "member/mypage";
		}
		
		int totalCount = fileService.getTotalCount(searchName);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 40);
		List<FileVo> fileList = fileService.getMyfileListBySearchName(loginMember.getNo(),searchName,pv);

		if(fileList!=null) {
			model.addAttribute("fileList", fileList);
			model.addAttribute("searchName", searchName);
			model.addAttribute("pv", pv);
		}
		return "myfile/list-fragment";
	}
	@PostMapping("/delete")
	public String deleteMyfile(HttpSession session,String fileNo,int pno,Model model,String searchName) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		int result = fileService.deleteMyfile(fileNo); 
		
		int totalCount = fileService.getTotalCount(searchName);
		PageVo pv = Pagination.getPageVo(totalCount, pno, 5, 40);
		List<FileVo> fileList = fileService.getMyfileListBySearchName(loginMember.getNo(),searchName,pv);
		
		model.addAttribute("fileList", fileList);
		model.addAttribute("searchName", searchName);
		model.addAttribute("pv", pv);
		
		return "myfile/list-fragment";
	}
	@PostMapping("/insert")
	public String insertMyfile(HttpSession session,MultipartFile file,Model model,HttpServletRequest req) {
		MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
		String memberNo = loginMember.getNo();
		
		//파일 업로드
		String savePath = req.getServletContext().getRealPath("/resources/upload/myfile/");
		String updateName = FileUploader.uploadFile(file, savePath);
		String originName = file.getOriginalFilename();
		
		//파일테이블에 반영
		FileVo vo = new FileVo();
		vo.setMemberNo(memberNo);
		vo.setOriginName(originName);
		vo.setUpdateName(updateName);
		vo.setUploadPath("/resources/upload/myfile/");
		
		int result = fileService.insertMyfile(vo);
		
		int totalCount = fileService.getTotalCount();
		PageVo pv = Pagination.getPageVo(totalCount, 1, 5, 40);
		List<FileVo> fileList = fileService.getMyfileList(memberNo,pv);
		model.addAttribute("fileList", fileList);
		model.addAttribute("pv", pv);
		
		return "myfile/list-fragment";
		
	}
}
