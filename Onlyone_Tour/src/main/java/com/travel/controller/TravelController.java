package com.travel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

}
