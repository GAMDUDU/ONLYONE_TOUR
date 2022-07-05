package com.hotel.model;

import java.util.List;

public interface HotelDAO {
	
	public List<HotelDTO> getAllHotelList();
	public List<HotelDTO> getDomList();
	public List<HotelDTO> getOverList();
	public List<HotelDTO> getHotelList();
	public List<HotelDTO> getPensionList();
	
	public HotelDTO getHotelCont(int num);
	
	// 리뷰
	public List<HotelReviewDTO> getReviewList(int num);
	public String getReviewScore(int num);
	public int getReviewCount(int num);
	public int insertReview(HotelReviewDTO dto);
}
