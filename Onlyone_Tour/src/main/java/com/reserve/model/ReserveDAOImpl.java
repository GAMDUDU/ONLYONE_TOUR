package com.reserve.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.airport.model.AirportDTO;
import com.hotel.model.HotelDTO;
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
		return this.sqlSession.selectOne("reserve_member", id);
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
	public HotelDTO getReserveHotelCont(int no) {
		return this.sqlSession.selectOne("reservehotelCont", no);
		
	}



	@Override
	public ReserveHotelDTO getReserveHotelOk(int num) {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public int reserveHotelInsert(ReserveHotelDTO hdto) {
		return this.sqlSession.insert("hotelAdd", hdto);
		
	}



	
	//관리자 결제내역
	@Override
	public List<ReserveDTO> adminTravelAccount() {
		return this.sqlSession.selectList("travelac");
		
	}



	@Override
	public List<ReserveHotelDTO> adminHotelAccount() {
		return this.sqlSession.selectList("hotelac");
	}





	@Override
	public List<ReserveDTO> memberReserveList(String id) {
		return this.sqlSession.selectList("memeberreserve", id);
	}



	@Override
	public List<ReserveHotelDTO> hotelReserveList(String id) {
		
		return this.sqlSession.selectList("hotelreserve", id);
	}







}
