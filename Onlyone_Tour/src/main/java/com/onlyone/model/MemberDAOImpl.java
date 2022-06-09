package com.onlyone.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//로그인 구현 
	public String login(MemberDTO dto) {
		return this.sqlSession.selectOne("loginOk", dto);
	}
	
	
	// 회원 전체리스트
	public List<MemberDTO> getMemberList() {
		
		return this.sqlSession.selectList("all");
	
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
