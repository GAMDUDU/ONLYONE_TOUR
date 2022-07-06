package com.reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestAttributes;

import com.airport.model.AirportDTO;
import com.hotel.model.HotelDTO;
import com.onlyone.model.MemberDAO;
import com.onlyone.model.MemberDTO;
import com.onlyone.model.PageDTO;
import com.reserve.model.ReserveDAO;
import com.reserve.model.ReserveDTO;
import com.reserve.model.ReserveHotelDTO;
import com.travel.model.TravelDAO;
import com.travel.model.TravelDTO;

@Controller
public class ReserveController {

	@Autowired
	private ReserveDAO dao;

	private final int rowsize = 5; // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0; // DB 상의 전체 게시물의 수

	//패키지예약
	@RequestMapping("reserve_travel.do")
	public String reserveList(@RequestParam("no") int no,@RequestParam("id") String id, Model model) {

		ReserveDTO rdto = new ReserveDTO();

		TravelDTO tdto = this.dao.getReserveCont(no);
		
		MemberDTO mdto = this.dao.getMemberCont(id);
		
		System.out.println("mdto>>>>>>>>>>>>>>" + mdto);
		System.out.println("rdto>>>>>>>>>>>>>>" + rdto);
		System.out.println("tdto>>>>>>>>>>>>>>" + tdto);

		model.addAttribute("Cont", tdto);
		model.addAttribute("Member", mdto);
		model.addAttribute("Res", rdto);

		return "reserve_travel";

	}

	@RequestMapping("reserve_travel_terms.do")
	public String reserveTerms(){
		return "reserve_travel_terms";
	}



	@RequestMapping("reserve_submit.do")
	@ResponseBody
	public String reserveForm(@RequestParam("no") int no, String id,HttpServletResponse response, ReserveDTO rdto,
			Model model) {
		System.out.println("rdto1>>>>>>>>>>>>>>" + rdto);
		MemberDTO mdto = new MemberDTO();
		TravelDTO tdto = this.dao.getReserveCont(no);
		mdto = this.dao.getMemberCont(id);
		
		model.addAttribute("Cont", tdto);
		model.addAttribute("Member", mdto);
		
		

		int check = this.dao.reserveInsert(rdto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println("rdto2>>>>>>>>>>>>>>" + rdto);
		
		 rdto = this.dao.getReserveOkList(no);
		model.addAttribute("Res", rdto);
			/* request.setAttribute("Res", rdto); */
		
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
	
	//여행 예약내역
	@RequestMapping("reserve_list.do")
	public String memberReserveList(@RequestParam("memid") String id, Model model) {
		
		
		List<ReserveDTO> rdto =this.dao.memberReserveList(id);
		List<ReserveHotelDTO> hdto = this.dao.hotelReserveList(id);
		
		model.addAttribute("Reserve", rdto);
		model.addAttribute("Hotel", hdto);
		
		System.out.println("rdto>>>>>>>>>>>>>>" + rdto);
		System.out.println("rdto>>>>>>>>>>>>>>" + hdto);
		
		return "member_reserve_list";
	}

	
	
	
	
	
	//숙소예약
	
	@RequestMapping("reseve_hotel.do")
	public String reservehotelList(@RequestParam("no") int no, Model model, @RequestParam("id") String id) {
		
		/*
		 * MemberDTO mdto = new MemberDTO(); //멤버DTO HotelDTO hdto = new HotelDTO(); //
		 * 호텔DTO
		 */		
		
		ReserveHotelDTO rdto = new ReserveHotelDTO(); //예약DTO
		
		MemberDTO mdto = this.dao.getMemberCont(id); //회원 정보불러오기
		HotelDTO hdto = this.dao.getReserveHotelCont(no); //호텔정보불러오기
		
		model.addAttribute("Cont", hdto);
		model.addAttribute("Member", mdto);
		model.addAttribute("Res", rdto);
		
		return "reserve_hotel";
		
	}
	
	
	@RequestMapping("reserve_hotel_ok.do")
	public String reserveHotelOk(@RequestParam("no") int no, @RequestParam("id") String id, HotelDTO hhdto, MemberDTO mdto, ReserveHotelDTO hdto, HttpServletResponse response,
			Model model ) throws IOException {
		
		hhdto = this.dao.getReserveHotelCont(no);
		mdto =this.dao.getMemberCont(id);
		int check = this.dao.reserveHotelInsert(hdto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		model.addAttribute("Cont", hdto); //예약정보
		model.addAttribute("Member", mdto);
		model.addAttribute("hotel", hhdto);
		
		PrintWriter out = response.getWriter();
		
		System.out.println("hdto>>>>>>>>>>>>>>" + hdto);
		System.out.println("hdto>>>>>>>>>>>>>>" + hhdto);
		System.out.println("mdto>>>>>>>>>>>>>>" + mdto);
		
	return "reserve_hotel_ok";
	
	
	
		
	}	
		
		
		
		
	
	

		

		
	}
	
	
	

	
	
	


