package com.kh.md.member.service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.md.bank.vo.BankVo;
import com.kh.md.common.FileUploader;
import com.kh.md.file.dao.FileDao;
import com.kh.md.file.vo.FileVo;
import com.kh.md.member.dao.MemberDao;
import com.kh.md.member.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService{
	
	 private final MemberDao memberDao;
	 private final FileDao fileDao;
	 private final SqlSessionTemplate sst;
	 
	 @Autowired
	 public MemberServiceImpl(MemberDao memberDao, FileDao fileDao, SqlSessionTemplate sst) {
			this.memberDao = memberDao;
			this.fileDao = fileDao;
			this.sst = sst;
	 }

	@Override
	public MemberVo login(MemberVo vo) {
		MemberVo loginMember  = memberDao.selectOne(sst, vo);
		return loginMember;
	}
	
	@Override
	public MemberVo findOneByNo(String no) {
		MemberVo member  = memberDao.selectOneByNo(sst, no);
		return member;
	}
	

	@Override
	public String findPwd(Map<String, String> map) {
		int result1 = memberDao.selectCountByEmail(sst,map);
		int result2;
		String newPwd;
		if(result1 == 1) {
			newPwd = UUID.randomUUID().toString().substring(0,8);
			map.put("newPwd",newPwd);
			result2  = memberDao.updatePwd(sst,map);
			if(result2 == 1) return newPwd;
			else return null;
		}else return null;
	}
	
	@Override
	public int checkPwd(MemberVo memberVo) {
		int result  = memberDao.selectCountByPwd(sst, memberVo);
		return result;
	}

	@Override
	public List<MemberVo> findListBySearch(String search) {
		List<MemberVo> memberList  = memberDao.selectListBySearch(sst,search);
		return memberList;
	}

	@Override
	public List<BankVo> getBankList() {
		List<BankVo> bankList  = memberDao.selectBankList(sst);
		return bankList;
	}

	@Override
	@Transactional
	public int editOne(MemberVo memberVo, HttpServletRequest req) {
		
		int result1 = 1;
		MultipartFile profile = memberVo.getProfile();
		if(!profile.isEmpty()) {
			//파일업로드
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
			
			result1 = fileDao.insertOne(sst,vo);
			memberVo.setProfileName(updateName);
		}
		
		if(result1==1) {
			return memberDao.updateOne(sst,memberVo);
		}else {
			return 0;
		}
	}

	@Override
	public int changePwd(MemberVo memberVo) {
		//백단에서 비밀번호 유효성검사 한 번 더 시행
		String pwd = memberVo.getPwd();
		String pwd2 = memberVo.getPwd2();
		if(pwd==null || pwd2==null) return -1;
		else if(pwd.isBlank() || pwd2.isBlank()) return -2;
		else if(pwd.length() < 4 || pwd2.length() < 4) return -3;
		else if(!pwd.equals(pwd2)) return -4;
		
		int result  = memberDao.updatePwd(sst, memberVo);
		return result;
	}










	 
	 
	 

}
