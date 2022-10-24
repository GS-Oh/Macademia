package com.kh.md.organization.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.md.organization.vo.OrganizationVo;

@Repository
public class OrganizationDaoImpl implements OrganizationDao{

	@Override
	public List<OrganizationVo> selectList(SqlSessionTemplate sst) {
		return sst.selectList("organizationMapper.selectList");
	}

}
