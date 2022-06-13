package com.travel.controller;

import javax.servlet.http.HttpServletRequest;

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
	
	/*
	 * @RequestMapping("reserve.do") 
	 * public String reserveCont(@RequestParam("no")
	 * int no, Model model) {
	 * 
	 * TravelDTO dto = this.dao.getReserveCont(no);
	 * 
	 * model.addAttribute("Cont", dto);
	 * 
	 * return "reserve_travel"; }
	 */
}
