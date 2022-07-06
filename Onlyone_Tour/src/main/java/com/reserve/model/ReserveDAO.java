package com.reserve.model;

import java.util.List;

import com.hotel.model.HotelDTO;
import com.onlyone.model.MemberDTO;
import com.travel.model.TravelDTO;

public interface ReserveDAO {
	
	//공통
	//멤버정보가져오는거
	//호텔정보
	//예약리스트 가져오기
	public List<ReserveDTO> memberReserveList(String id);
	public List<ReserveHotelDTO> hotelReserveList(String id);
	

	
	//패키지
	public TravelDTO getReserveCont(int no); //패키지정보
	public MemberDTO getMemberCont(String id); // 멤버정보
	public ReserveDTO getReserveOkList(int num); // 패키지예약정보
	public int reserveInsert(ReserveDTO rdto); // 패키지 예약
	

	
	//숙소
	public HotelDTO getReserveHotelCont(int no); //숙소정보
	//멤버정보는 다른거 쓰면될듯....
	public ReserveHotelDTO getReserveHotelOk(int num); //숙소예약정보
	public int reserveHotelInsert(ReserveHotelDTO hdto); //숙소예약
	
	
	//관리자
	public List<ReserveDTO> adminTravelAccount();
	public List<ReserveHotelDTO> adminHotelAccount();

	


}
