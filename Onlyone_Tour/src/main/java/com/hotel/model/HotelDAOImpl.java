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

}
