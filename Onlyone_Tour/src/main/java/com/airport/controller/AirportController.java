package com.airport.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.airport.model.AirportDAO;


@Controller
public class AirportController {
	
	@Autowired
	private AirportDAO dao;
	
	@RequestMapping("airport.do")
	public String airportMain(Model model) {	
		
		return "airport";	
	}

}
