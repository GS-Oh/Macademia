package com.kh.md.common;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {

	public static String uploadFile(MultipartFile f, String savePath) {
		//1-1. 기존파일 확장자 얻기
		String originName = f.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//1-2. 저장할 이름 만들기
		long now = System.currentTimeMillis();
		int random = (int)(Math.random() * 90000 + 10000);
		String changeName = now + "_" + random + ext;
		
		//2. 서버에 업로드
		File target = new File(savePath + changeName);
		
		try {
			f.transferTo(target);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
}
