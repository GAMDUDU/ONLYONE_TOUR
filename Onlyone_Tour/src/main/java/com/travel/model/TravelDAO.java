package com.travel.model;

import java.util.List;

import com.airport.model.AirportDTO;
import com.hotel.model.HotelDTO;

public interface TravelDAO {
	
	// 민경님
	public TravelDTO travelCont(int no);

	public TravelDTO getReserveCont(int no);
	
	
	// 종엽님 
	public List<TravelDTO> getTravelList();
	public List<TravelDTO> getNormalList();
	public List<TravelDTO> getHitList();
	public List<TravelDTO> getRecommendList();
	public List<TravelDTO> getNewList();
	public TravelDTO getTravelCont(int num);
	
	
	// 병권님
	public List<TravelDTO> SearchTravel(String search);
	public List<HotelDTO> SearchHotel(String search);
	public List<AirportDTO> SearchAir(String search);
	
}
