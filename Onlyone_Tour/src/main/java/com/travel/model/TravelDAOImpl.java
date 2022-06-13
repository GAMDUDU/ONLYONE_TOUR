package com.travel.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TravelDAOImpl implements TravelDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public TravelDTO travelCont(int no) {
		/* this.sqlSession.selectOne("content", no); */
		
		return null;
	}

	@Override
	public TravelDTO getReserveCont(int no) {
	
		return null;
	}

}
