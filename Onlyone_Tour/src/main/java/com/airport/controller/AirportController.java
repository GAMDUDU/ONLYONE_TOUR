package com.airport.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.airport.model.AirProductDTO;
import com.airport.model.AirReserveDTO;
import com.airport.model.AirlineDTO;
import com.airport.model.AirportDAO;
import com.airport.model.AirportDTO;
import com.airport.model.NationDTO;
import com.airport.model.PageAirDTO;
import com.onlyone.model.MemberDTO;



@Controller
public class AirportController {
	
	@Autowired
	private AirportDAO dao;
	private final int rowsize = 10; // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0;   // DB 상의 전체 게시물의 수
	
	@RequestMapping("airport.do")
	public String airportMain(Model model) {
		
		List<AirProductDTO> aList = this.dao.getAirProductList();
		List<NationDTO> nList = this.dao.getNationList();
		
		model.addAttribute("aList", aList);		
		model.addAttribute("nList", nList);
		
		return "airport";	
	}
	
	
	@RequestMapping("airport_list.do")
	public String airList(HttpServletRequest httpServletRequest, 
			@RequestParam("air_baby_fare") String baby, AirportDTO dto, Model model) {
			
		System.out.println("==========================================");
		System.out.println(dto);
		System.out.println("==========================================");
		
		List<AirportDTO> airlist = this.dao.getAirList(dto);
				
		model.addAttribute("air_departure", dto.getAir_departure());
		model.addAttribute("air_arrival", dto.getAir_arrival());
		model.addAttribute("air_adult", dto.getAir_adult_fare());
		model.addAttribute("air_child", dto.getAir_child_fare());
		model.addAttribute("air_baby", baby);
		model.addAttribute("airlist", airlist);
		
		System.out.println("==========================================");
		System.out.println(airlist);
		System.out.println("==========================================");
		
		return "airport_list";
	}

	@RequestMapping("airport_reserve.do")
	public String airReserve(HttpServletRequest httpServletRequest, 
				HttpServletResponse response, AirReserveDTO rdto, Model model) throws IOException {
		
		int airNum = this.dao.getAirNum()+1;
		
		System.out.println("==========================================");
		System.out.println("airNum=========" + airNum);
		System.out.println("==========================================");
		
		rdto.setRe_num(airNum);
		
		MemberDTO mdto = new MemberDTO();
		mdto = this.dao.getMemberCont(rdto.getRe_mem_id());
		
		rdto.setRe_mem_gender(mdto.getMember_gender());
		rdto.setRe_mem_birth(mdto.getMember_birth());
		rdto.setRe_mem_phone(mdto.getMember_phone());
		rdto.setRe_mem_email(mdto.getMember_email());
		
		int check = this.dao.insertAirReserve(rdto);
		
		List<AirReserveDTO> airReserve = this.dao.getAirReserveList(airNum);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		model.addAttribute("Member", mdto);
		model.addAttribute("AirReserve", airReserve);
		model.addAttribute("AirReserveDTO", rdto);
		
		System.out.println("==========================================");
		System.out.println(airReserve);
		System.out.println("==========================================");

		if(check == 0) {
			out.println("<script>");
			out.println("alert('항공권 예매에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return "airport_reserve";
				
	}
	
	@RequestMapping("airport_reserve_ok.do")
	public String airReserveList(HttpServletRequest httpServletRequest, 
			HttpServletResponse response, AirReserveDTO rdto, Model model) throws IOException {
		
		
		System.out.println("==========================================");
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println("test >>>>>>> " + rdto);
		System.out.println("==========================================");
		
		
		String[] info = rdto.getRe_info().split(",");
		String[] name = rdto.getRe_tour_name().split(",");
		String[] gender = rdto.getRe_tour_gender().split(",");
		String[] birth = rdto.getRe_tour_birth().split(",");
		String[] phone = rdto.getRe_tour_phone().split(",");
		
		int check = 0;
		int air_Index;
		AirReserveDTO ardto;		
				
		for(int i=0; i<=rdto.getRe_people()-1; i++) {
			
			air_Index = Integer.parseInt(info[i]);
			ardto = this.dao.getAirReserveIndex(air_Index);
			
			ardto.setRe_index(air_Index);
			ardto.setRe_tour_name(name[i]);
			ardto.setRe_tour_gender(gender[i]);
			ardto.setRe_tour_birth(birth[i]);
			ardto.setRe_tour_phone(phone[i]);
			
			check = check + this.dao.updateAirReserve(ardto);
		}
		
		PrintWriter out = response.getWriter();
		
		if(check == 0) {
			out.println("<script>");
			out.println("alert('항공권 예매에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		System.out.println("check >>>>>>> " + check);
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		
		AirReserveDTO arrdto = this.dao.getAirReserveIndex(Integer.parseInt(info[0]));
		model.addAttribute("AirReserve", arrdto);
		
		return "airport_reserve_ok";	
	}
	
	
	@RequestMapping("airport_mypage.do")
	public String airMyPage(@RequestParam("id") String memid, Model model) {
		
		List<AirReserveDTO> ardto = this.dao.getMyReserve(memid);
		
		model.addAttribute("ReserveList", ardto);
		
		return "airport_mypage";	
	}
	
	
	@RequestMapping("airport_mypage_content.do")
	public String airMyPageCont(@RequestParam("num") int num, Model model) {
		
		List<AirReserveDTO> ardto = this.dao.getMyReserveCont(num);
		AirReserveDTO rdto = this.dao.getMyReserveContOne(num);
		
		model.addAttribute("ReserveList", ardto);
		model.addAttribute("ReserveOne", rdto);
		
		return "airport_mypage_content";	
	}		
	
	
	@RequestMapping("airport_delete.do")
	public String airMyPageDelete(@RequestParam("id") String memid,
							@RequestParam("num") int num, Model model) {
		
		MemberDTO mdto = new MemberDTO();
		mdto = this.dao.getMemberCont(memid);
		
		model.addAttribute("num", num);
		model.addAttribute("pwd", mdto.getMember_pwd());
		
		return "airport_mypage_delete";
	}
	
	
	@RequestMapping("airport_delete_ok.do")
	public void airMyPageDeleteOk(@RequestParam("id") String memid, 
			@RequestParam("num") int num, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int del = this.dao.deleteMyReserve(num);
		
		if(del > 0) {
			out.println("<script>");
			out.println("alert('항공권 예약이 취소 되었습니다.')");
			out.println("location.href='airport_mypage.do?id="+memid+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('항공권 예약을 취소하지 못했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}	
	
	
	@RequestMapping("admin_air.do")
	public String adminAirList(HttpServletRequest request, Model model) {
		
		int page; // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1; // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord =  this.dao.getAirListCount();
				
		PageAirDTO dto = new PageAirDTO(page, rowsize, totalRecord);
		
		// 항공 리스트 가져오기
		List<AirportDTO> airlist = this.dao.getAdminAirList(dto);

		model.addAttribute("list", airlist);
		model.addAttribute("Paging",dto);
		model.addAttribute("total", totalRecord);
		
		return "admin/admin_air_list";
	}
	
	
	@RequestMapping("admin_air_write.do")
	public String adminAirWrite(Model model) {
		
		// 국가 조회
		List<NationDTO> nList = this.dao.getNationList();
		
		// 항공사 조회
		List<AirlineDTO> aList = this.dao.getAirlineList();
		
		model.addAttribute("nList", nList);
		model.addAttribute("aList", aList);

		return "admin/admin_air_write";
	}
	
	
	@RequestMapping("admin_air_write_ok.do")
	public void adminAirWriteOk(AirportDTO dto,
				HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertAir(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('항공권이 등록되었습니다.')");
			out.println("location.href='admin_air.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('항공권 등록에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}	
	
	@RequestMapping("admin_air_content.do")
	public String adminAirContent(@RequestParam("no") int no,
				@RequestParam("page") int nowPage, Model model) {
		
		// 게시글 상세 내역을 조회하는 메서드 호출
		AirportDTO dto = this.dao.AirCont(no);
		
		model.addAttribute("Cont", dto);
		model.addAttribute("Page", nowPage);
		
		return "admin/admin_air_content";
	}
	
	
	@RequestMapping("admin_air_modify.do")
	public String adminAirmodify(@RequestParam("no") int no,
				@RequestParam("page") int nowPage, Model model) {
		
		// 게시글 상세 내역을 조회하는 메서드 호출
		AirportDTO dto = this.dao.AirCont(no);
		
		// 국가 조회
		List<NationDTO> nList = this.dao.getNationList();
		
		// 항공사 조회
		List<AirlineDTO> aList = this.dao.getAirlineList();
		
		model.addAttribute("nList", nList);
		model.addAttribute("aList", aList);
		model.addAttribute("modify", dto);
		model.addAttribute("Page", nowPage);
		
		return "admin/admin_air_modify";
	}
	
	
	@RequestMapping("admin_air_modify_ok.do")
	public void adminAirModifyOk(AirportDTO dto,
			@RequestParam("page") int nowPage, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int check = this.dao.updateAir(dto);
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('항공권이 수정되었습니다.')");
			out.println("location.href='admin_air_content.do?no="+dto.getAir_num()+"&page="+nowPage+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('항공권 수정에 실패하였습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	

	@RequestMapping("admin_air_delete.do")
	public void deleteOk(@RequestParam("no") int no,
					@RequestParam("page") int nowPage, 
					HttpServletResponse response) throws IOException {
		
			response.setContentType("text/html; charset=UTF-8");
		
			PrintWriter out = response.getWriter();
					
			int check = this.dao.deleteAir(no);
			
			if(check > 0) {
				
				this.dao.updateIdx(no);
				
				out.println("<script>");
				out.println("alert('항공권이 삭제되었습니다.')");
				out.println("location.href='admin_air.do?page="+nowPage+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('항공권 삭제에 실패하였습니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
			
		}
	
		@RequestMapping("air_search.do")
		public String search(@RequestParam("field") String field,
				@RequestParam("keyword") String keyword,
				@RequestParam("page") int nowPage, Model model) {
			
			// 검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
			totalRecord = this.dao.searchAirCount(field, keyword);
			
			PageAirDTO pdto = 
				new PageAirDTO(nowPage, rowsize, totalRecord, field, keyword);
			
			System.out.println("검색 게시물 수 >>> " + pdto.getTotalRecord());
			
			System.out.println("검색 전체 페이지 수 >>> " + pdto.getAllPage());
			
			// 검색 시 한페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드.
			List<AirportDTO> list = this.dao.searchAirList(pdto);
			
			model.addAttribute("searchPageList", list);
			
			model.addAttribute("Paging", pdto);
			
			return "admin/admin_air_searchList";
			
		}	
	
}
