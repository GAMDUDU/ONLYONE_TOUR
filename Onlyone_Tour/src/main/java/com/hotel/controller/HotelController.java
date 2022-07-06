package com.hotel.controller;

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

import com.hotel.model.HotelDAO;
import com.hotel.model.HotelDTO;
import com.hotel.model.HotelReviewDTO;
import com.onlyone.model.PageDTO;

@Controller
public class HotelController {
	
	@Autowired
	private HotelDAO dao;
	private final int rowsize = 5; // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0; // DB 상의 전체 게시물의 수
	private static final String saveDirectory = "C:\\Users\\GAMDU\\git\\ONLYONE-TOUR\\Onlyone_Tour\\src\\main\\webapp\\resources\\image_hotel";
	
	
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
	
	
	//민경

	//관리자페이지
	
	@RequestMapping("admin_hotel_list.do")
	public String hotelList(HttpServletRequest request, Model model) {
		
		int page; // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1; // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}
		
		totalRecord =this.dao.getHotelListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		List<HotelDTO> list = this.dao.getHoteladminList(dto);
		
		model.addAttribute("List", list);
		model.addAttribute("Paging",dto);
		model.addAttribute("total", totalRecord);
		
		return "/admin/admin_hotellist";
		
	}
	
	@RequestMapping("hotel_content.do")
	public String adminhotelCont(@RequestParam("num") int num, Model model) {
		HotelDTO dto = this.dao.adminHotelcont(num);
		model.addAttribute("Cont", dto);
		return "/admin/admin_hotelContent";
	}
	
	@RequestMapping("hotel_insert.do")
	public String hotel_insert() {
		return "/admin/admin_hotelInsert";
	}
	
	
	@RequestMapping("hotel_insert_ok.do")
	public void hotel_insert_ok(HotelDTO dto, HttpServletResponse response, MultipartFile imgfile,
			MultipartHttpServletRequest mRequest, Model model) throws IOException {
		
		//image 파일을 string으로 반환
		String file_name = imgfile.getOriginalFilename();
		//서버의 파일 저장 경로 설정(
		File target = new File(saveDirectory, file_name);
		
		
		try {
			//파일 및 스트림 복사를 위한 간단한 유틸리티 메소드의 집합체
			//지정한 InputStream의 내용을, 지정한 OutputStream에 복사하고, 스트림을 닫는다.
			//리턴값은 copy한 byte수를 리턴한다.
			FileCopyUtils.copy(imgfile.getInputStream(), new FileOutputStream(target));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		dto.setHotel_image(file_name); 
		
		int check = this.dao.admininsertHotel(dto);
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out= response.getWriter();
		if(check >0){
			out.println("<script>");
			out.println("alert('숙소 등록 성공!!!')");
			out.println("location.href='admin_hotel_list.do'");
			out.println("</script>");
		}
		out.println("<script>");
		out.println("alert('숙소 등록 실패~~~')");
		out.println("history.back()");
		out.println("</script>");

	}
	
	@RequestMapping("hotel_delete.do")
	public void delete_Hotel(@RequestParam("num") int num,
			@RequestParam("page") int nowPage,
			HttpServletResponse response, HotelDTO dto) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
	
		int del = this.dao.admindeleteHotel(num);
		
		
		if(del > 0) {
			this.dao.adminupdateHotelSequence(num);
			out.println("<script>");
			out.println("alert('숙소 삭제성공')");
			out.println("location.href='admin_hotel_list.do?page="+nowPage+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('숙소 삭제실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	

}
