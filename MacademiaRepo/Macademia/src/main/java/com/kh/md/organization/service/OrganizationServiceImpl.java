package com.kh.md.organization.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.md.member.dao.MemberDao;
import com.kh.md.member.vo.MemberVo;
import com.kh.md.organization.dao.OrganizationDao;
import com.kh.md.organization.vo.OrganizationVo;

@Service
public class OrganizationServiceImpl implements OrganizationService{
	
	private final SqlSessionTemplate sst;
	private final OrganizationDao orgDao;
	private final MemberDao memberDao;
	
	@Autowired
	public OrganizationServiceImpl(SqlSessionTemplate sst, OrganizationDao orgDao,MemberDao memberDao) {
		this.sst = sst;
		this.orgDao = orgDao;
		this.memberDao = memberDao;
	}

	@Override
	public List<OrganizationVo> getTree() {
		List<OrganizationVo> list = orgDao.selectList(sst);
		return list;
	}

	@Override
	public List<MemberVo> getTreeDetail(String deptNo) {
		List<MemberVo> list = memberDao.selectListByDeptNo(sst,deptNo);
		return list;
	}



}
