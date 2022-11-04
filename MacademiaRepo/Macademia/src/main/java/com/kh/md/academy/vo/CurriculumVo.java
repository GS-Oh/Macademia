package com.kh.md.academy.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class CurriculumVo {

	private String no;
	private String classNo;
	private String[] curriculumName;
	private String[] curriculumContent;
	private String name;
	private String content;
	
	private List<Map<String, String>> mapList = new ArrayList<Map<String, String>>();
	
	public void convertToList() {
		
		int len = curriculumContent.length;
		
		for(int i = 0 ; i < len ; ++i) {
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("name", curriculumName[i]);
			map.put("content", curriculumContent[i]);
			mapList.add(map);
		}
		
	}
	
}
