package com.airport.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AirportDAOImpl implements AirportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
