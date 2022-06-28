package com.airport.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.airport.model.AirportDAO;
import com.airport.model.AirportDTO;


@Controller
public class AirportController {
	
	@Autowired
	private AirportDAO dao;
	
	@RequestMapping("airport.do")
	public String airportMain(Model model) {
		return "airport";	
	}
	
	
	@RequestMapping("airport_list.do")
	public String roundlist(HttpServletRequest httpServletRequest, 
										AirportDTO dto, Model model) {
			
		System.out.println("==========================================");
		System.out.println(dto);
		System.out.println("==========================================");
		
		List<AirportDTO> airlist = this.dao.DatePart(dto);
				
		model.addAttribute("air_departure", dto.getAir_departure());
		model.addAttribute("air_arrival", dto.getAir_arrival());
		model.addAttribute("air_adult", dto.getAir_adult_fare());
		model.addAttribute("air_child", dto.getAir_child_fare());
		model.addAttribute("airlist", airlist);
		
		System.out.println("==========================================");
		System.out.println(airlist);
		System.out.println("==========================================");
		
		return "airport_list";
	}

}
