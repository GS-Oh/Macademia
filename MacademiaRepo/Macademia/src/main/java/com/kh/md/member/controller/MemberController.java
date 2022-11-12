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

import com.kh.md.bank.vo.BankVo;
import com.kh.md.board.service.BoardService;
import com.kh.md.board.util.Pagination;
import com.kh.md.board.vo.BoardVo;
import com.kh.md.board.vo.PageVo;
import com.kh.md.file.service.FileService;
import com.kh.md.member.service.MemberService;
import com.kh.md.member.vo.MemberVo;
import com.kh.md.member.vo.MyboardSearchVo;

@Controller
public class MemberController {
	
	private final MemberService memberService;
	private final FileService fileService;
	private final BoardService boardService;
	private final JavaMailSender mailSender;
	
	@Autowired
	public MemberController(MemberService memberService, FileService fileService, BoardService boardService, JavaMailSender mailSender) {
		this.memberService = memberService;
		this.fileService = fileService;
		this.boardService = boardService;
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
		System.out.println("newPwd : "+newPwd);
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
			model.addAttribute("successMsg","임시비밀번호 발송완료.");
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

	@GetMapping("/member/bank/list")
	@ResponseBody
	public List<BankVo> bankList() {
		List<BankVo> bankList = memberService.getBankList();
		
		return bankList;
	}
	
	@GetMapping("/member/edit")
	public String edit(Model model) {
		return "member/edit";
	}
	
	@PostMapping("/member/edit")
	public String edit(MemberVo memberVo, Model model,HttpServletRequest req, HttpSession session) {
		System.out.println(memberVo);
		
		//비밀번호 체크
		int result1 = memberService.checkPwd(memberVo);
		if(result1==0) {
			model.addAttribute("alertMsg","잘못된 비밀번호입니다.");
			return "member/edit";
		}
		
		//사원정보 수정
		int result2 = memberService.editOne(memberVo, req);
		if(result2==1) {
			MemberVo updateMember = memberService.findOneByNo(memberVo.getNo());
			model.addAttribute("successMsg","사원정보 수정완료!");
			session.setAttribute("loginMember", updateMember);
		}else {
			model.addAttribute("alertMsg","사원정보 수정실패...");
		}
		return "member/edit";
		
	}
	@PostMapping("/member/checkpwd")
	@ResponseBody
	public int checkPwd(MemberVo memberVo) {
		int result = memberService.checkPwd(memberVo);
		return result;
	}
	@PostMapping("/member/changepwd")
	@ResponseBody
	public int changePwd(MemberVo memberVo, HttpSession session) {
		int result = memberService.changePwd(memberVo);
		if(result==1) {
			MemberVo updateMember= memberService.findOneByNo(memberVo.getNo());
			session.setAttribute("loginMember", updateMember);
		}
		return result;
	}
	@GetMapping("home")
	public String home (HttpSession session, Model model) {
	MemberVo loginMember = (MemberVo)session.getAttribute("loginMember");
	model.addAttribute("loginMember",loginMember);
	return "home";
	
	}

}
