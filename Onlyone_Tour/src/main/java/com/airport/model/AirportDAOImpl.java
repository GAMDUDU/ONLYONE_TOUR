package com.airport.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AirportDAOImpl implements AirportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public List<AirportDTO> DatePart(AirportDTO dto) {
		return this.sqlSession.selectList("datePart", dto);
	}

	@Override
	public String MaxT() {
		String maxT = sqlSession.selectOne("selectMaxT");
		return maxT;
	}
	
}
