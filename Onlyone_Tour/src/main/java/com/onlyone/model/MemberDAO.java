package com.onlyone.model;

import java.util.List;

public interface MemberDAO {
	
	List<MemberDTO> getMemberList();
	
	int insertMember(MemberDTO dto);
	
	MemberDTO getMember(int num);
	
	int updateMember(MemberDTO dto);
	
	int deleteMember(int num);
	
	void updateSequnce(int num);
	
	List<MemberDTO> SearchMemberList(String field, String keyword);
	
	
}
