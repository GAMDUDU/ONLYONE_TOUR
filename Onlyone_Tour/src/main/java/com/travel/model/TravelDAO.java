package com.travel.model;

import java.util.List;

import com.airport.model.AirportDTO;
import com.hotel.model.HotelDTO;
import com.onlyone.model.PageDTO;

public interface TravelDAO {
	
	
	

	
	
	
	// 종엽님 
	public List<TravelDTO> getTravelList();
	public List<TravelDTO> getNormalList();
	public List<TravelDTO> getHitList();
	public List<TravelDTO> getRecommendList();
	public List<TravelDTO> getNewList();
	public TravelDTO getTravelCont(int num);
	
	// 리뷰
	public List<TravelReviewDTO> getReviewList(int num);
	public String getReviewScore(int num);
	public int getReviewCount(int num);
	public int insertReview(TravelReviewDTO dto);
	
	// 병권님
	public List<TravelDTO> SearchTravel(String search);
	public List<HotelDTO> SearchHotel(String search);
	public List<AirportDTO> SearchAir(String search);
	
	// 민경님
	public int getTravelListCount();//전체게시물수
	List<TravelDTO> getTravelList(PageDTO dto);//리스트
	public int admininsertTravel(TravelDTO dto);//등록
	public TravelDTO adminTravelcont(int num);//상세
	public int adminupdateTravel(TravelDTO dto);//수정
	public int admindeleteTravel(int num);//삭제
	public void adminupdateSequence(int num);//번호수정
	public List<TravelDTO> adminsearchTravel(String fidle, String keyword);//검색
	
	
}
