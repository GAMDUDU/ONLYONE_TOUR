package com.hotel.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HotelDAOImpl implements HotelDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<HotelDTO> getAllHotelList() {
		
		return this.sqlSession.selectList("allHotelList");
	}

	@Override
	public List<HotelDTO> getDomList() {
		
		return this.sqlSession.selectList("hotelDomList");
	}

	@Override
	public List<HotelDTO> getOverList() {
		
		return this.sqlSession.selectList("hotelOverList");
	}

	@Override
	public List<HotelDTO> getHotelList() {
		
		return this.sqlSession.selectList("justHotelList");
	}

	@Override
	public List<HotelDTO> getPensionList() {
		
		return this.sqlSession.selectList("justPensionList");
	}

	@Override
	public HotelDTO getHotelCont(int num) {
		
		return this.sqlSession.selectOne("hotelCont", num);
	}

	// 리뷰
	@Override
	public List<HotelReviewDTO> getReviewList(int num) {
		
		return this.sqlSession.selectList("hotelreviewList", num);
	}

	@Override
	public String getReviewScore(int num) {
		
		return this.sqlSession.selectOne("hotelreviewScore", num);
	}

	@Override
	public int getReviewCount(int num) {
		
		return this.sqlSession.selectOne("hotelreviewCount", num);
	}

	@Override
	public int insertReview(HotelReviewDTO dto) {
		
		return this.sqlSession.insert("addHotelReview", dto);
	}

}
