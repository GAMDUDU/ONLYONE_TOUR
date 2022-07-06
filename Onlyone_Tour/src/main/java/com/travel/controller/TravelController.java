package com.travel.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.airport.model.AirportDTO;
import com.hotel.model.HotelDTO;
import com.onlyone.model.PageDTO;
import com.travel.model.TravelDAO;
import com.travel.model.TravelDTO;
import com.travel.model.TravelReviewDTO;

@Controller
public class TravelController {
	
	@Autowired
	private TravelDAO dao;
	private final int rowsize = 5; // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0; // DB 상의 전체 게시물의 수
	private static final String saveDirectory = "C:\\Users\\ubg11\\git\\ONLYONE-TOUR\\ONLYONE-TOUR\\Onlyone_Tour\\src\\main\\webapp\\resources\\image_package";
	
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
		
		List<TravelReviewDTO> reviewList = dao.getReviewList(num);
		model.addAttribute("ReviewList", reviewList);
		
		String reviewScore = dao.getReviewScore(num);
		model.addAttribute("ReviewScore", reviewScore);
		
		int reviewCount = dao.getReviewCount(num);
		model.addAttribute("ReviewCount", reviewCount);
		
		return "travel_cont";
	}
	
	@RequestMapping("review_write.do")
	public String writeOk(TravelReviewDTO rdto,
			HttpServletResponse response, Model model) throws IOException {
		
		int check = this.dao.insertReview(rdto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			TravelDTO dto = dao.getTravelCont(rdto.getTravel_num_fk());
			model.addAttribute("Cont", dto);
			
			List<TravelReviewDTO> reviewList = dao.getReviewList(rdto.getTravel_num_fk());
			model.addAttribute("ReviewList", reviewList);
			
			String reviewScore = dao.getReviewScore(rdto.getTravel_num_fk());
			model.addAttribute("ReviewScore", reviewScore);
			
			int reviewCount = dao.getReviewCount(rdto.getTravel_num_fk());
			model.addAttribute("ReviewCount", reviewCount);
			
			return "travel_cont";
			
		} else {
			out.println("<script>");
			out.println("alert('리뷰 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
			
			return null;
		}
	}
	
	@RequestMapping("travel_list_all.do")
	public String travelListAll(Model model) {
		
		List<TravelDTO> list = dao.getTravelList();

		model.addAttribute("List", list);			
		
		return "travel_list_all";
	}
	
	@RequestMapping("travel_search.do")
	public String onlyTravelSearch(@RequestParam("keyword") String keyword, Model model) {
		
		List<TravelDTO> list = this.dao.getSearchList(keyword);
		
		model.addAttribute("List", list);
		model.addAttribute("Keyword", keyword);
		
		return "travel_searchlist";
	}
	
	// 병권 Search 작업라인
	@RequestMapping("search_product.do")
	public String travelSearch(@RequestParam("search_product") String search, Model model, 
			HttpServletResponse response, HttpServletRequest request) {
		
		List<TravelDTO> find = this.dao.SearchTravel(search);
		List<HotelDTO> hotelFind = this.dao.SearchHotel(search);
		List<AirportDTO> airFind = this.dao.SearchAir(search);
		
		response.setContentType("text/html; charset=UTF-8");
		
		model.addAttribute("Find", find);
		model.addAttribute("search", search);
		model.addAttribute("hotelFind", hotelFind);
		model.addAttribute("airFind", airFind);
		
		return "search_travel";
	}
	
	

	
	///민경관리자 등록////
	
	// 패키지정보 페이지로 보내기
	@RequestMapping("admin_travel_list.do")
	public String travelList(HttpServletRequest request, Model model) {
		
		int page; // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1; // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord =  this.dao.getTravelListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<TravelDTO> list = this.dao.getTravelList(dto);
		
		model.addAttribute("List", list);
		model.addAttribute("Paging",dto);
		model.addAttribute("total", totalRecord);
		
		return "/admin/admin_travellist";
	}
	
	
	  @RequestMapping("travel_content.do")
	  public String traveladmincontent(@RequestParam("num") int num, Model model) {
		 TravelDTO dto = this.dao.adminTravelcont(num);
		 model.addAttribute("Cont", dto);
		 return "/admin/admin_travelContent";
		  
	  }
	  
	  @RequestMapping("travel_insert.do")
	  public String travel_insert() {
		  return "/admin/admin_travelInsert";
	  }
	  
	  @RequestMapping("travel_insert_ok.do")
	  public void travel_insert_ok(TravelDTO dto, HttpServletResponse response, MultipartFile imgfile,
			  MultipartHttpServletRequest mRequest, Model model ) throws IOException {
		  

		String file_name = imgfile.getOriginalFilename();
		File target = new File(saveDirectory, file_name);
        try {
            FileCopyUtils.copy(imgfile.getInputStream(), new FileOutputStream(target));
        } catch (IOException e) {
            e.printStackTrace();
        }
        
		 dto.setTravel_image(file_name);
		
		int check = this.dao.admininsertTravel(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		
			if(check >0){
				out.println("<script>");
				out.println("alert('패키지 등록 성공!!!')");
				out.println("location.href='admin_travel_list.do'");
				out.println("</script>");
			}
			out.println("<script>");
			out.println("alert('패키지 등록 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
			
	}
		
	  
	  @RequestMapping("travel_delete.do")
	  public void delete_Travel(@RequestParam("num") int num,
			  @RequestParam("page") int nowPage, 
			  HttpServletResponse response, TravelDTO dto) throws IOException {
		  
			response.setContentType("text/html; charset=UTF-8");
			
			PrintWriter out = response.getWriter();
		  
			int del = this.dao.admindeleteTravel(num);
			
			if(del > 0) {
				this.dao.adminupdateSequence(num);
				out.println("<script>");
				out.println("alert('패키지 삭제성공')");
				out.println("location.href='admin_travel_list.do?page="+nowPage+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('패키지 삭제실패')");
				out.println("history.back()");
				out.println("</script>");
			}
			
	  }
		
}
