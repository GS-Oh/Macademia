package com.kh.md.board.vo;

import lombok.Data;

@Data
public class BoardAttachment {
	private String no;
	private String boardNo;
	private String originName;
	private String fileName;
	private String filePath;
	private String uploadDate;
	private String deleteYn;
}
