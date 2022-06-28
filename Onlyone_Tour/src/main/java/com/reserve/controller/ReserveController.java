package com.reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.airport.model.AirportDTO;
import com.onlyone.model.MemberDTO;
import com.reserve.model.ReserveAirDTO;
import com.reserve.model.ReserveDAO;
import com.reserve.model.ReserveDTO;
import com.travel.model.TravelDTO;

@Controller
public class ReserveController {

	@Autowired
	private ReserveDAO dao;

	//패키지예약
	@RequestMapping("reserve_travel.do")
	public String reserveList(@RequestParam("no") int no, Model model, String id) {

		MemberDTO mdto = new MemberDTO();
		ReserveDTO rdto = new ReserveDTO();

		TravelDTO tdto = this.dao.getReserveCont(no);
		mdto = this.dao.getMemberCont(id);

		model.addAttribute("Cont", tdto);
		model.addAttribute("Member", mdto);
		model.addAttribute("Res", rdto);

		return "reserve_travel";

	}

	/*
	 * @RequestMapping("reserve_travel_terms.do") public String
	 * reserveTerms(@RequestParam("no") int no, HttpServletResponse response, Model
	 * model, String id) throws IOException {
	 * 
	 * MemberDTO mdto = new MemberDTO();
	 * 
	 * TravelDTO tdto = this.dao.getReserveCont(no); mdto =
	 * this.dao.getMemberCont(id);
	 * 
	 * model.addAttribute("Cont", tdto); model.addAttribute("Member", mdto);
	 * 
	 * return "reserve_travel_terms"; }
	 */
	@RequestMapping("reserve_travel_terms.do")
	public String reserveTerms(){
		return "reserve_travel_terms";
	}



	@RequestMapping("reserve_submit.do")
	@ResponseBody
	public String reserveForm(@RequestParam("no") int no, String id, HttpServletResponse response, ReserveDTO rdto,
			Model model) {
		System.out.println("rdto>>>>>>>>>>>>>>" + rdto);
		MemberDTO mdto = new MemberDTO();
		TravelDTO tdto = this.dao.getReserveCont(no);
		mdto = this.dao.getMemberCont(id);
		
		model.addAttribute("Cont", tdto);
		model.addAttribute("Member", mdto);
		model.addAttribute("Res", rdto);

		int check = this.dao.reserveInsert(rdto);
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("rdto>>>>>>>>>>>>>>" + rdto);
		return "T";
	}


	
	@RequestMapping("reserve_travel_ok.do")
	public String reserveOk(@RequestParam("no") int no, String id, HttpServletResponse response,
			Model model) throws IOException {

		MemberDTO mdto = new MemberDTO();
		mdto = this.dao.getMemberCont(id);
		
		TravelDTO tdto = this.dao.getReserveCont(no);
		
		ReserveDTO rdto =this.dao.getReserveOkList(no);
		
		mdto = this.dao.getMemberCont(id);
		model.addAttribute("Cont", tdto);
		model.addAttribute("Member", mdto);
		model.addAttribute("Res", rdto);

		return "reserve_travel_ok";
	}
	
	@RequestMapping("main.do")
	public String homepageMain() {
		return "main";
	}

	/*
	 * @RequestMapping("ajax") public String ajax() {
	 * System.out.println("ajax 실행!"); return "ajax"; } static int cnt=0;
	 * 
	 * @RequestMapping(value="/ajax_result")
	 * 
	 * @ResponseBody public String ajaxResult() { return null; //숫자를 문자화함... }
	 */

	/*
	 * @RequestMapping("reserve_submit.do")
	 * 
	 * @ResponseBody public String reserveForm(ReserveDTO dto) {
	 * System.out.println("dto>>>>>>>>>>>>>>"+dto); dto.setReserve_count(3);
	 * this.dao.reserveInsert(dto); return "T"; }
	 */
	
	
	
	
	
	//항공예약
	@RequestMapping("reseve_air.do")
	public String reserveAir(@RequestParam("no") int no, Model model, String id) {

		MemberDTO mdto = new MemberDTO();

		AirportDTO adto= this.dao.getReserveAirCont(no);
		mdto = this.dao.getMemberCont(id);

		model.addAttribute("Cont", adto);
		model.addAttribute("Member", mdto);

		return "reserve_air";

	}
	
	@RequestMapping("reserve_submit_air.do")
	@ResponseBody
	public String reserveAirForm(@RequestParam("no") int no, String id, HttpServletResponse response, ReserveAirDTO rdto,
			Model model) {
		System.out.println("rdto>>>>>>>>>>>>>>" + rdto);
		
		MemberDTO mdto = new MemberDTO();
		/* TravelDTO tdto = this.dao.getReserveCont(no); */
		AirportDTO adto = this.dao.getReserveAirCont(no);
		
		mdto = this.dao.getMemberCont(id);
		
		model.addAttribute("Cont", adto);
		model.addAttribute("Member", mdto);
		model.addAttribute("Res", rdto);

		int check = this.dao.reserveAirInsert(rdto);
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("rdto>>>>>>>>>>>>>>" + rdto);
		return "T";
	}
	
	@RequestMapping("reserve_air_ok.do")
	public String reserveairOk(@RequestParam("no") int no, String id, HttpServletResponse response,
			Model model) throws IOException {

		MemberDTO mdto = new MemberDTO();
		mdto = this.dao.getMemberAirCont(id);
		
		TravelDTO tdto = this.dao.getReserveCont(no);
		ReserveAirDTO rdto =this.dao.getReserveAirOk(no);
		
		mdto = this.dao.getMemberCont(id);
		model.addAttribute("Cont", tdto);
		model.addAttribute("Member", mdto);
		model.addAttribute("Res", rdto);

		return "reserve_air_ok";
	}
	
	
	
	
	
	

}
