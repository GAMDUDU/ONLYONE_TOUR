package com.airport.model;

import java.util.List;

import com.onlyone.model.MemberDTO;

public interface AirportDAO {

	public List<AirProductDTO> getAirProductList();
	
	public List<AirportDTO> getAirList(AirportDTO dto);
	
	public int insertAirReserve(AirReserveDTO rdto);
	
	public MemberDTO getMemberCont(String id);
	
	public int getAirNum();
	
	public List<AirReserveDTO> getAirReserveList(int airNum);
	
	public AirReserveDTO getAirReserveIndex(int airIndex);
	
	public int updateAirReserve(AirReserveDTO rdto);
	
	public List<AirReserveDTO> getMyReserve(String id);
	
	public List<AirReserveDTO> getMyReserveCont(int num);
	
	public AirReserveDTO getMyReserveContOne(int num);
	
	public int deleteMyReserve(int num);
	
	
	// 관리자
	public List<AirportDTO> getAdminAirList(PageAirDTO dto);
	
	public int getAirListCount();
	
	public int insertAir(AirportDTO dto);
	
	public AirportDTO AirCont(int no);
	
	//국가 목록 가져오기
	public List<NationDTO> getNationList();
	
	//항공사 목록 가져오기
	public List<AirlineDTO> getAirlineList();
	
	//수정
	public int updateAir(AirportDTO dto);
	
	//삭제
	public int deleteAir(int no);
	
	public void updateIdx(int no);
	
	//검색
	public int searchAirCount(String field, String keyword);
	
	public List<AirportDTO> searchAirList(PageAirDTO dto);
}
