package com.onlyone.model;

import java.util.List;

public interface MemberDAO {
	
	// 회원 전체 리스트
	List<MemberDTO> getMemberList();
	
	// 로그인 ok
	MemberDTO loginOk(String id);
	
	// 아이디 중복 체크
	int checkUserId(String id);
	
	// 이메일 중복 체크 
	int checkUserEmail(String email);
	
	// 회원정보 가져오기
	int insertMember(MemberDTO dto);
	
	// 아이디 찾기 ok 
	MemberDTO findId(MemberDTO dto);
	
	// 비밀번호 찾기 ok
	MemberDTO findPwd(MemberDTO dto);
	
	
	MemberDTO getMember(int num);
	
	int updateMember(MemberDTO dto);
	
	int deleteMember(int num);
	
	void updateSequnce(int num);
	
	List<MemberDTO> SearchMemberList(String field, String keyword);


	
	
}
