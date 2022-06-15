package com.reserve.model;

import java.util.List;

import com.onlyone.model.MemberDTO;
import com.travel.model.TravelDTO;

public interface ReserveDAO {
	
	public TravelDTO getReserveCont(int no);
	public MemberDTO getMemberCont(String id);
	public int reserveInsert(ReserveDTO rdto);
	

}
