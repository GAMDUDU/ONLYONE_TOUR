package com.reserve.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.airport.model.AirportDTO;
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
		return this.sqlSession.selectOne("Login", id);
	}



	@Override
	public int reserveInsert(ReserveDTO rdto) {
		return this.sqlSession.insert("add", rdto);
		
	}



	@Override
	public ReserveDTO getReserveOkList(int num) {
		return this.sqlSession.selectOne("reserveOk", num);
	
	}



	@Override
	public AirportDTO getReserveAirCont(int no) {
		return this.sqlSession.selectOne("contentAir", no);
	}



	@Override
	public MemberDTO getMemberAirCont(String id) {
		return this.sqlSession.selectOne("Login", id);
	}



	@Override
	public ReserveAirDTO getReserveAirOk(int num) {
		return this.sqlSession.selectOne("AirreserveOk", num);
	}



	@Override
	public int reserveAirInsert(ReserveAirDTO rdto) {
		return this.sqlSession.insert("Airadd", rdto);
	}



}
