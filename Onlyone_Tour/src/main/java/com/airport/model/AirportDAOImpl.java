package com.airport.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.onlyone.model.MemberDTO;

@Repository
public class AirportDAOImpl implements AirportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<AirProductDTO> getAirProductList() {
		
		return this.sqlSession.selectList("AirProductList");
	}

	@Override
	public List<AirportDTO> getAirList(AirportDTO dto) {
		
		return this.sqlSession.selectList("AirList", dto);
	}

	
	@Override
	public MemberDTO getMemberCont(String id) {
		
		return this.sqlSession.selectOne("Login", id);
		
	}
	
	
	@Override
	public int insertAirReserve(AirReserveDTO rdto) {
		
		int reserve = 0;
		
		for(int i = 0; i<rdto.getRe_people(); i++) {
			rdto.setRe_no(i+1);
			reserve = reserve + this.sqlSession.insert("AirReserve", rdto);
		}
		
		int count = 0;
		
		if(reserve == rdto.getRe_people()) {
			count = 1;			
		}

		return count;
	}
	
	
	@Override
	public int getAirNum() {
		
		return this.sqlSession.selectOne("AirNum");
	}
	
	
	@Override
	public List<AirReserveDTO> getAirReserveList(int airNum) {
		
		return this.sqlSession.selectList("AirReserveList", airNum);
	}

	@Override
	public AirReserveDTO getAirReserveIndex(int airIndex) {
		
		return this.sqlSession.selectOne("AirReserveIndex", airIndex);
	}
	
	@Override
	public int updateAirReserve(AirReserveDTO rdto) {
		
		return this.sqlSession.update("updateAirReserve", rdto);
	}
	
	@Override
	public List<AirReserveDTO> getMyReserve(String memid) {
		
		return this.sqlSession.selectList("AirMyReserve", memid);
	}
	
	@Override
	public List<AirReserveDTO> getMyReserveCont(int num) {
		
		return this.sqlSession.selectList("AirMyReserveCont", num);
	}
	
	@Override
	public AirReserveDTO getMyReserveContOne(int num) {
		
		return this.sqlSession.selectOne("AirMyReserveContOne", num);
	}
	
	@Override
	public int deleteMyReserve(int num) {
		
		return this.sqlSession.delete("AirMyReserveDelete",num);
	}
	
	
	// 관리자
	@Override
	public List<AirportDTO> getAdminAirList(PageAirDTO dto) {
		
		return this.sqlSession.selectList("AdminAirList", dto);
	}
	
	
	@Override
	public int getAirListCount() {
		
		return this.sqlSession.selectOne("AirListCount");
	}
	
	
	@Override
	public int insertAir(AirportDTO dto) {
		
		return this.sqlSession.insert("AirAdd", dto);
	}
	
	@Override
	public AirportDTO AirCont(int no) {
		return this.sqlSession.selectOne("AirContent", no);
	}
	
	@Override
	public List<NationDTO> getNationList() {
		return this.sqlSession.selectList("NationList");
	}
	
	@Override
	public List<AirlineDTO> getAirlineList() {
		return this.sqlSession.selectList("AirlineList");
	}
	
	@Override
	public int updateAir(AirportDTO dto) {
		
		return this.sqlSession.update("AirModify", dto);
	}
	
	@Override
	public int deleteAir(int no) {
		
		return this.sqlSession.delete("AirDelete", no);
	}

	@Override
	public void updateIdx(int no) {
		
		this.sqlSession.update("AirIndex", no);
	}
	
	@Override
	public int searchAirCount(String field, String keyword) {
		
		return this.sqlSession.selectOne(field, keyword);
	}

	@Override
	public List<AirportDTO> searchAirList(PageAirDTO dto) {
		
		return this.sqlSession.selectList(dto.getField()+"1", dto);
	}

}
