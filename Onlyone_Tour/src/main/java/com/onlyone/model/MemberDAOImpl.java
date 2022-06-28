package com.onlyone.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MemberDAOImpl implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDTO loginOk(String id) {
		return this.sqlSession.selectOne("Login", id);
	}

	@Override
	public int insertMember(MemberDTO dto) {
		return this.sqlSession.insert("Join", dto);
	}

	@Override
	public MemberDTO getMember(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	// 회원삭제
	@Override
	public int deleteMember(String id) {
		return this.sqlSession.delete("del",id);
	}

	@Override
	public void updateSequnce(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int checkUserId(String id) {
		return this.sqlSession.selectOne("idCheck", id);
	}

	@Override
	public int checkUserEmail(String email) {
		return this.sqlSession.selectOne("emailCheck", email);
	}
	
	
	// 아이디 찾기
	@Override
	public MemberDTO findId(MemberDTO dto) {
		return this.sqlSession.selectOne("findId", dto);
	}
	
	// 비밀번호 찾기
	@Override
	public MemberDTO findPwd(MemberDTO dto) {
		return this.sqlSession.selectOne("findPwd", dto);
	}
	
	
	// 회원 리스트 전체 조회하기
	@Override
	public List<MemberDTO> getMemberList(PageDTO dto) {
		return this.sqlSession.selectList("list", dto);
	}
	
	// DB 카운터
	@Override
	public int getListCount() {
		return this.sqlSession.selectOne("count");
	}
	
	// 회원 검색
	@Override
	public List<MemberDTO> SearchMemberList(PageDTO dto) {
		return null;
	}
	
}
