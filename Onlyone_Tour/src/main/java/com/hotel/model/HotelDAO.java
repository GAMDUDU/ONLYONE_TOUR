package com.hotel.model;

import java.util.List;

import com.onlyone.model.PageDTO;

public interface HotelDAO {
	
	public List<HotelDTO> getAllHotelList();
	public List<HotelDTO> getDomList();
	public List<HotelDTO> getOverList();
	public List<HotelDTO> getHotelList();
	public List<HotelDTO> getPensionList();
	
	public HotelDTO getHotelCont(int num);
	public List<HotelDTO> getSearchList(String keyword);
	
	// 리뷰
	public List<HotelReviewDTO> getReviewList(int num);
	public String getReviewScore(int num);
	public int getReviewCount(int num);
	public int insertReview(HotelReviewDTO dto);
	
	// 민경
		public int getHotelListCount();//전체게시물수
		List<HotelDTO> getHoteladminList(PageDTO dto);//리스트
		public int admininsertHotel(HotelDTO dto);//등록
		public HotelDTO adminHotelcont(int num);//상세
		public int adminupdateHotel(HotelDTO dto);//수정
		public int admindeleteHotel(int num);//삭제
		public void adminupdateHotelSequence(int num);//번호수정
		
}
