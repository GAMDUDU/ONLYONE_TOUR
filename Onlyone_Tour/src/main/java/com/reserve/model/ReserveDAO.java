package com.reserve.model;

import java.util.List;

import com.airport.model.AirportDTO;
import com.onlyone.model.MemberDTO;
import com.travel.model.TravelDTO;

public interface ReserveDAO {
	
	public TravelDTO getReserveCont(int no);
	public MemberDTO getMemberCont(String id);
	public ReserveDTO getReserveOkList(int num);
	public int reserveInsert(ReserveDTO rdto);
	
	public AirportDTO getReserveAirCont(int no);
	public MemberDTO getMemberAirCont(String id);
	public ReserveAirDTO getReserveAirOk(int num);
	public int reserveAirInsert(ReserveAirDTO rdto);


}
