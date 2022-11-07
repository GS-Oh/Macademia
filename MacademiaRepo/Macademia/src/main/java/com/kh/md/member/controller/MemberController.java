package com.kh.md.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.md.bank.vo.BankVo;
import com.kh.md.common.FileUploader;
import com.kh.md.file.service.FileService;
import com.kh.md.file.vo.FileVo;
import com.kh.md.member.service.MemberService;
import com.kh.md.member.vo.MemberVo;

@Controller
public class MemberController {
	
	private final MemberService memberService;
	private final FileService fileService;
	private final JavaMailSender mailSender;
	
	@Autowired
	public MemberController(MemberService memberService, FileService fileService, JavaMailSender mailSender) {
		this.memberService = memberService;
		this.fileService = fileService;
		this.mailSender = mailSender;
	}
	
	@GetMapping("/")
	public String login() {
		return "member/login";
	}
	@PostMapping("/member/login")
	public String login(MemberVo vo, HttpSession session,Model model,
			boolean saveEmail,HttpServletResponse resp) {
		MemberVo loginMember = memberService.login(vo);


		if(saveEmail) {
			Cookie c = new Cookie("rid",vo.getEmail());
			resp.addCookie(c);
		}
		
		if(loginMember!=null) {
			session.setAttribute("loginMember", loginMember);
			return "home";
		}else {
			model.addAttribute("alertMsg","아이디/비밀번호를 다시 확인해주세요.");
			return "member/login";
		}
		
	}
	@GetMapping("/member/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginMember");
		return "member/login";
	}
	@GetMapping("/member/findpwd")
	public String findPwd() {
		return "member/findpwd";
	}
	@PostMapping("/member/findpwd")
	public String findPwd(String email, String privateEmail, Model model) {
		
		Map<String,String> map = new HashMap<>();
		map.put("email", email);
		map.put("privateEmail", privateEmail);
		
		String newPwd = memberService.findPwd(map);
		
		if(newPwd != null) {
			try {
				MimeMessage mimeMessage = mailSender.createMimeMessage();
			    MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	 
			    messageHelper.setFrom("mdFindPwd@gmail.com"); 
			    messageHelper.setTo(privateEmail); 
			    messageHelper.setSubject("임시비밀번호가 발급되었습니다"); 
			    messageHelper.setText("임시비밀번호 : "+newPwd); 
			   
			    mailSender.send(mimeMessage);
			} catch (Exception e) {
				e.printStackTrace();
			}
			model.addAttribute("alertMsg","임시비밀번호 발송완료.");
			return "member/login";
		}else {
			model.addAttribute("alertMsg","사내/개인이메일을 다시 확인해주세요.");
			return "member/findpwd";
		}

	}
	
	@GetMapping("/member/insert")
	public String insert() {
		return "member/insert";
	}
	@PostMapping("/member/insert")
	public String insert(MemberVo vo){
		return "member/insert";
	}
	
	@GetMapping("/member/mypage")
	public String myPage() {
		return "member/mypage";
	}
	
	@GetMapping("/member/edit")
	public String edit(Model model) {
		return "member/edit";
	}
	
	@GetMapping("/member/bank/list")
	@ResponseBody
	public List<BankVo> edit() {
		List<BankVo> bankList = memberService.getBankList();
		
		return bankList;
	}
	@PostMapping("/member/edit")
	public String edit(MemberVo memberVo, Model model,HttpServletRequest req, HttpSession session) {
		System.out.println(memberVo);
		
		
		
		//프로필 업로드
		MultipartFile profile = memberVo.getProfile();
		if(!profile.isEmpty()) {
			System.out.println("========진입========");
			String savePath = req.getServletContext().getRealPath("/resources/upload/profile/");
			String updateName = FileUploader.uploadFile(profile, savePath);
			String originName = profile.getOriginalFilename();
			
			//파일테이블에 반영
			FileVo vo = new FileVo();
			vo.setMemberNo(memberVo.getNo());
			vo.setOriginName(originName);
			vo.setUpdateName(updateName);
			vo.setUploadPath("/resources/upload/profile/");
			
			int result = fileService.insertMyfile(vo);
			
			memberVo.setProfileName(updateName);
		}
		
		int result = memberService.editOne(memberVo);
		if(result==1) {
			model.addAttribute("successMsg","사원정보 수정완료!");
			MemberVo updateMember = memberService.login(memberVo);
			session.setAttribute("loginMember", updateMember);
		}else {
			model.addAttribute("alertMsg","사원정보 수정실패...");
		}
		return "member/edit";
		
	}
	@GetMapping("/member/myboards")
	public String myBoards() {
		return "member/myboards";
	}
	
}
