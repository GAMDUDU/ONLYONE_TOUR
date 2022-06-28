package com.hotel.model;

import java.util.List;


public interface HotelDAO {
	
	public List<HotelDTO> getAllHotelList();
	public List<HotelDTO> getDomList();
	public List<HotelDTO> getOverList();
	public List<HotelDTO> getHotelList();
	public List<HotelDTO> getPensionList();
	
}
