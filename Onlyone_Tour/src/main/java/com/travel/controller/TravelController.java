package com.travel.controller;

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
		
		return "travel_cont";
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
