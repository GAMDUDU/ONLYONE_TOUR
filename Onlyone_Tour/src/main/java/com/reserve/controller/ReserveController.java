package com.reserve.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onlyone.model.MemberDTO;
import com.reserve.model.ReserveDAO;
import com.reserve.model.ReserveDTO;
import com.travel.model.TravelDAO;
import com.travel.model.TravelDTO;

@Controller
public class ReserveController {

	@Autowired
	private ReserveDAO dao;

	
	  @RequestMapping("reserve.do") 
	  public String reserveList(@RequestParam("no") int no, Model model) {
	 
	  TravelDTO tdto = this.dao.getReserveCont(no);
	  MemberDTO mdto = this.dao.getMemberCont(no);
		 
	  model.addAttribute("Cont", tdto);
	  model.addAttribute("Member", mdto);
		  
	  return "reserve_travel";
	  
	  }
	  
	  @RequestMapping("reserve_travel_terms.do")
	  public String reserveTerms(@RequestParam("no") int no, Model model) {
		  
		  TravelDTO tdto = this.dao.getReserveCont(no);
		  MemberDTO mdto = this.dao.getMemberCont(no);
			 
		  model.addAttribute("Cont", tdto);
		  model.addAttribute("Member", mdto);
			  
		  return "reserve_travel_terms";
	  }
	  
	  @RequestMapping("reserve_travel_ok.do")
	  public String reserveOk(@RequestParam("no") int no, Model model) {
		
		  TravelDTO tdto = this.dao.getReserveCont(no);
		  MemberDTO mdto = this.dao.getMemberCont(no);
			 
		  model.addAttribute("Cont", tdto);
		  model.addAttribute("Member", mdto);
			  
		  return "reserve_travel_ok";
	  }
	  
	 

}
