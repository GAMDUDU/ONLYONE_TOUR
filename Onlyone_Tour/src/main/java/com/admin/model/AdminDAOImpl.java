package com.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<AdminDTO> getAdminList() {
		// TODO Auto-generated method stub
		return null;
	}

	public AdminDTO getMember(int num) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
