package com.travel.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
