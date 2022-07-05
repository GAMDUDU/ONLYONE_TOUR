package com.travel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.airport.model.AirportDTO;
import com.hotel.model.HotelDTO;
import com.travel.model.TravelDAO;
import com.travel.model.TravelDTO;
import com.travel.model.TravelReviewDTO;

@Controller
public class TravelController {
	
	@Autowired
	private TravelDAO dao;
	
	@RequestMapping("travel_list.do")
	public String travelList(Model model) {
		
		List<TravelDTO> list = dao.getTravelList();
		List<TravelDTO> normallist = dao.getNormalList();
		List<TravelDTO> hitlist = dao.getHitList();
		List<TravelDTO> recommendlist = dao.getRecommendList();
		List<TravelDTO> newlist = dao.getNewList();

		model.addAttribute("List", list);		
		model.addAttribute("NormalList", normallist);		
		model.addAttribute("HitList", hitlist);		
		model.addAttribute("RecommendList", recommendlist);		
		model.addAttribute("NewList", newlist);		
		
		return "travel_list";
	}
	
	@RequestMapping("travel_cont.do")
	public String travelCont(@RequestParam("num") int num, Model model) {
		
		TravelDTO dto = dao.getTravelCont(num);
		model.addAttribute("Cont", dto);
		
		List<TravelReviewDTO> reviewList = dao.getReviewList(num);
		model.addAttribute("ReviewList", reviewList);
		
		String reviewScore = dao.getReviewScore(num);
		model.addAttribute("ReviewScore", reviewScore);
		
		int reviewCount = dao.getReviewCount(num);
		model.addAttribute("ReviewCount", reviewCount);
		
		return "travel_cont";
	}
	
	@RequestMapping("review_write.do")
	public String writeOk(TravelReviewDTO rdto,
			HttpServletResponse response, Model model) throws IOException {
		
		int check = this.dao.insertReview(rdto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			TravelDTO dto = dao.getTravelCont(rdto.getTravel_num_fk());
			model.addAttribute("Cont", dto);
			
			List<TravelReviewDTO> reviewList = dao.getReviewList(rdto.getTravel_num_fk());
			model.addAttribute("ReviewList", reviewList);
			
			String reviewScore = dao.getReviewScore(rdto.getTravel_num_fk());
			model.addAttribute("ReviewScore", reviewScore);
			
			int reviewCount = dao.getReviewCount(rdto.getTravel_num_fk());
			model.addAttribute("ReviewCount", reviewCount);
			
			return "travel_cont";
			
		} else {
			out.println("<script>");
			out.println("alert('리뷰 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
			
			return null;
		}
	}
	
	@RequestMapping("travel_list_all.do")
	public String travelListAll(Model model) {
		
		List<TravelDTO> list = dao.getTravelList();

		model.addAttribute("List", list);			
		
		return "travel_list_all";
	}
	
	// 병권 Search 작업라인
	@RequestMapping("search_product.do")
	public String travelSearch(@RequestParam("search_product") String search, Model model, 
			HttpServletResponse response, HttpServletRequest request) {
		
		List<TravelDTO> find = this.dao.SearchTravel(search);
		List<HotelDTO> hotelFind = this.dao.SearchHotel(search);
		List<AirportDTO> airFind = this.dao.SearchAir(search);
		
		response.setContentType("text/html; charset=UTF-8");
		
		model.addAttribute("Find", find);
		model.addAttribute("search", search);
		model.addAttribute("hotelFind", hotelFind);
		model.addAttribute("airFind", airFind);
		
		return "search_travel";
	}
}
