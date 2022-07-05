package com.travel.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.airport.model.AirportDTO;
import com.hotel.model.HotelDTO;

@Repository
public class TravelDAOImpl implements TravelDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 민경님
	@Override
	public TravelDTO travelCont(int no) {
		/* this.sqlSession.selectOne("content", no); */
		
		return null;
	}

	@Override
	public TravelDTO getReserveCont(int no) {
	
		return null;
	}
	
	// 종엽님
	
	@Override
	public List<TravelDTO> getTravelList() {
		
		return this.sqlSession.selectList("travelList");
	}

	@Override
	public List<TravelDTO> getNormalList() {
		
		return this.sqlSession.selectList("travelNormalList");
	}

	@Override
	public List<TravelDTO> getHitList() {
		
		return this.sqlSession.selectList("travelHitList");
	}

	@Override
	public List<TravelDTO> getRecommendList() {
		
		return this.sqlSession.selectList("travelRecommendList");
	}

	@Override
	public List<TravelDTO> getNewList() {
		
		return this.sqlSession.selectList("travelNewList");
	}

	@Override
	public TravelDTO getTravelCont(int num) {
		
		return this.sqlSession.selectOne("travelCont", num);
	}
	
	// 리뷰
	@Override
	public List<TravelReviewDTO> getReviewList(int num) {
		
		return this.sqlSession.selectList("reviewList", num);
	}

	@Override
	public String getReviewScore(int num) {
		
		return this.sqlSession.selectOne("reviewScore", num);
	}

	@Override
	public int getReviewCount(int num) {
		
		return this.sqlSession.selectOne("reviewCount", num);
	}

	@Override
	public int insertReview(TravelReviewDTO dto) {
		
		return this.sqlSession.insert("addReview", dto);
	}
	
	// 병권님 검색작업
	// 패키지상품을 검색하는경우
	@Override
	public List<TravelDTO> SearchTravel(String search) {
		return this.sqlSession.selectList("searchTravel", search);
	}
	
	// 호텔이름을 검색하는경우
	@Override
	public List<HotelDTO> SearchHotel(String search) {
		return this.sqlSession.selectList("searchHotel", search);
	}
	
	
	// 항공이름을 검색하는경우
	@Override
	public List<AirportDTO> SearchAir(String search) {
		return this.sqlSession.selectList("searchAir", search);
	}
	

}
