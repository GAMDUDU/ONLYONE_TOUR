package com.travel.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.airport.model.AirportDTO;
import com.hotel.model.HotelDTO;
import com.onlyone.model.PageDTO;

@Repository
public class TravelDAOImpl implements TravelDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	
	
		
		
	

	
	
	
		
	
	
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
	
	//관리자페이지 여행게시물 수 확인	
		@Override
		public int getTravelListCount() {
			return this.sqlSession.selectOne("admintravelcount");
		}

		//관리자페이지 여행 전체 리스트 조회	
		@Override
		public List<TravelDTO> getTravelList(PageDTO dto) {
			return this.sqlSession.selectList("admintravellist", dto);
		}


		@Override
		public int admininsertTravel(TravelDTO dto) {
			return this.sqlSession.insert("adminTravelAdd", dto);
		}

		@Override
		public TravelDTO adminTravelcont(int num) {
			return this.sqlSession.selectOne("adminCont", num);
			
		}

		@Override
		public int adminupdateTravel(TravelDTO dto) {
			// TODO Auto-generated method stub
			return 0;
		}

		@Override
		public int admindeleteTravel(int num) {
			return this.sqlSession.delete("travelDel", num);
			
		}

		@Override
		public void adminupdateSequence(int num) {
			this.sqlSession.delete("HotelSeq", num);
			
		}

		@Override
		public List<TravelDTO> adminsearchTravel(String fidle, String keyword) {
			// TODO Auto-generated method stub
			return null;
		}
	

}
