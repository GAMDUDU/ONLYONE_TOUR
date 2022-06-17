package com.reserve.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onlyone.model.MemberDTO;
import com.travel.model.TravelDTO;

@Repository
public class ReserveDAOImpl implements ReserveDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	

	@Override
	public TravelDTO getReserveCont(int no) {
		
		return this.sqlSession.selectOne("content", no);
		
	}



	@Override
	public MemberDTO getMemberCont(String id) {
		return this.sqlSession.selectOne("member", id);
	}



	@Override
	public int reserveInsert(ReserveDTO rdto) {
		return this.sqlSession.insert("add", rdto);
		
	}
	

}
