package com.reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	  public String reserveList(@RequestParam("no") int no, Model model, String id) {
	 
	  MemberDTO mdto = new MemberDTO();
		  
	  TravelDTO tdto = this.dao.getReserveCont(no);
	  mdto = this.dao.getMemberCont(id);
	 
		 
	  model.addAttribute("Cont", tdto);
	  model.addAttribute("Member", mdto);
		  
	  return "reserve_travel";
	  
	  }
	  
	  @RequestMapping("reserve_travel_terms.do")
	  public String reserveTerms(@RequestParam("no") int no,  HttpServletResponse response, Model model, String id) throws IOException {
		  
		  MemberDTO mdto = new MemberDTO();
		  
		  TravelDTO tdto = this.dao.getReserveCont(no);
		  mdto = this.dao.getMemberCont(id);
			 
		  model.addAttribute("Cont", tdto);
		  model.addAttribute("Member", mdto);
		    
		  return "reserve_travel_terms";
	  }
	  
	  @RequestMapping("reserve_travel_ok.do")
	  public String reserveOk(@RequestParam("no") int no, String id,
			  HttpServletResponse response, ReserveDTO rdto, Model model) throws IOException {
		 
		  MemberDTO mdto = new MemberDTO();
		  TravelDTO tdto = this.dao.getReserveCont(no);
		  mdto = this.dao.getMemberCont(id);
		  
		  model.addAttribute("Cont", tdto);
		  model.addAttribute("Member", mdto);
		  
		  int check = this.dao.reserveInsert(rdto);
		  response.setContentType("text/html; charset=UTF-8");
		  PrintWriter out = response.getWriter();

			  
		  return "reserve_travel_ok";
	  }
	  
	  @RequestMapping("main.do")
	  public String homepageMain() {
		  return "main";
	  }
	  
	 

}
