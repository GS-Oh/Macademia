package com.kh.md.organization.service;

import java.util.List;

import com.kh.md.member.vo.MemberVo;
import com.kh.md.organization.vo.OrganizationVo;

public interface OrganizationService {

	List<OrganizationVo> getTree();

	List<MemberVo> getTreeDetail(String deptNo);

}
