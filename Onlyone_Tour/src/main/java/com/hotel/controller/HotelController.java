package com.hotel.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hotel.model.HotelDAO;
import com.hotel.model.HotelDTO;
import com.hotel.model.HotelReviewDTO;

@Controller
public class HotelController {
	
	@Autowired
	private HotelDAO dao;
	
	@RequestMapping("hotel_list.do")
	public String hotelList(Model model) {
		
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
	
	@RequestMapping("hotel_cont.do")
	public String hotelCont(@RequestParam("num") int num, Model model) {
		
		HotelDTO dto = dao.getHotelCont(num);
		model.addAttribute("Cont", dto);
		
		List<HotelReviewDTO> reviewList = dao.getReviewList(num);
		model.addAttribute("ReviewList", reviewList);
		
		String reviewScore = dao.getReviewScore(num);
		model.addAttribute("ReviewScore", reviewScore);
		
		int reviewCount = dao.getReviewCount(num);
		model.addAttribute("ReviewCount", reviewCount);
		
		return "hotel_cont";
	}
	
	@RequestMapping("hotel_review_write.do")
	public String writeOk(HotelReviewDTO rdto,
			HttpServletResponse response, Model model) throws IOException {
		
		int check = this.dao.insertReview(rdto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			HotelDTO dto = dao.getHotelCont(rdto.getHotel_num_fk());
			model.addAttribute("Cont", dto);
			
			List<HotelReviewDTO> reviewList = dao.getReviewList(rdto.getHotel_num_fk());
			model.addAttribute("ReviewList", reviewList);
			
			String reviewScore = dao.getReviewScore(rdto.getHotel_num_fk());
			model.addAttribute("ReviewScore", reviewScore);
			
			int reviewCount = dao.getReviewCount(rdto.getHotel_num_fk());
			model.addAttribute("ReviewCount", reviewCount);
			
			return "hotel_cont";
			
		} else {
			out.println("<script>");
			out.println("alert('리뷰 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
			
			return null;
		}
	}
	

}
