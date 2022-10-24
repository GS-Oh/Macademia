package com.kh.md.organization.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.organization.dao.OrganizationDao;
import com.kh.md.organization.vo.OrganizationVo;

@Service
public class OrganizationServiceImpl implements OrganizationService{
	
	private final SqlSessionTemplate sst;
	private final OrganizationDao orgDao;
	
	@Autowired
	public OrganizationServiceImpl(SqlSessionTemplate sst, OrganizationDao orgDao) {
		this.sst = sst;
		this.orgDao = orgDao;
	}

	@Override
	public List<OrganizationVo> getTree() {
		List<OrganizationVo> list = orgDao.selectList(sst);
		return list;
	}



}
