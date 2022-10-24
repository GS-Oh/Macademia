package com.kh.md.organization.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.md.organization.vo.OrganizationVo;

public interface OrganizationDao {

	List<OrganizationVo> selectList(SqlSessionTemplate sst);
	
}
