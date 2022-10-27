package com.kh.md.upload.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class UploadController {
	
	@GetMapping("/files")
	public String files() {
		return LocalDateTime.now().toString();
	}
	
	
	
	@PostMapping(value="/files/upload", consumes = { MediaType.MULTIPART_FORM_DATA_VALUE })
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		log.debug(multipartFile.toString());
		JsonObject jsonObject = new JsonObject();
		// 내부경로로 저장
		String contextRoot = request.getSession().getServletContext().getRealPath("/");
		String fileRoot = contextRoot+"/resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		String url = null;
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyToFile(fileStream, targetFile);	//파일 저장
			url = "/md/resources/fileupload/"+savedFileName; 
			System.out.println(uri);
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			e.printStackTrace();
		}
		return url;
	}
}
