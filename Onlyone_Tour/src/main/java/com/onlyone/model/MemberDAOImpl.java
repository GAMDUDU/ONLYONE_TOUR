package com.onlyone.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public List<MemberDTO> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}

	public int insertMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public MemberDTO getMember(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	public int updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteMember(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	public void updateSequnce(int num) {
		// TODO Auto-generated method stub
		
	}

	public List<MemberDTO> SearchMemberList(String field, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
