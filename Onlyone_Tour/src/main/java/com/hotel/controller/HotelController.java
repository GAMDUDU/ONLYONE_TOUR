package com.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.model.HotelDAO;
import com.hotel.model.HotelDTO;
import com.travel.model.TravelDTO;

@Controller
public class HotelController {
	
	@Autowired
	private HotelDAO dao;
	
	@RequestMapping("hotel_list.do")
	public String travelList(Model model) {
		
		List<HotelDTO> list = dao.getAllHotelList();
		List<HotelDTO> domlist = dao.getDomList();
		List<HotelDTO> overlist = dao.getOverList();
		List<HotelDTO> hotellist = dao.getHotelList();
		List<HotelDTO> pensionlist = dao.getPensionList();

		model.addAttribute("List", list);		
		model.addAttribute("DomList", domlist);		
		model.addAttribute("OverList", overlist);		
		model.addAttribute("HotelList", hotellist);		
		model.addAttribute("PensionList", pensionlist);		
		
		return "hotel_list";
	}

}
