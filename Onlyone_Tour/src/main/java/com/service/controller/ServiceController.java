package com.service.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.service.model.PageServDTO;
import com.service.model.ServiceDAO;
import com.service.model.ServiceQuestionDTO;

@Controller
public class ServiceController {
		
	private final int rowsize = 3;     // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0;       // DB 상의 전체 게시물의 수
	
	@Autowired
	private ServiceDAO dao;
	
	@RequestMapping("question_list.do")
	public String qustionList(HttpServletRequest request, Model model) {
		
		int page; // 현재 페이지 변수
		
		if(request.getParameter("page") != null) { page =
				Integer.parseInt(request.getParameter("page")); 
		}else { 
				page = 1; // 처음으로 게시물 전체 목록 태그를 선택한 경우 
		}
	
		
		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord = this.dao.getQuestionListCount();
		
		
		PageServDTO dto = new PageServDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출 
		List<ServiceQuestionDTO> list = this.dao.getServiceQuestionDTO(dto);
		
		model.addAttribute("List", list); 
		model.addAttribute("Paging", dto);
		
		return "admin_question_list";
	}
	
	@RequestMapping("question_write.do")
	public String question_wirte() {
		
		return "admin_question_writeForm";
		
	}
	
	@RequestMapping("admin_question_wirteOk.do")
	public void question_writeOk(ServiceQuestionDTO dto,
			HttpServletResponse response) throws IOException {
		
		int check = this.dao.insertQuestion(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('질문 추가 성공')");
			out.println("location.href='question_list.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('질문 추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("admin_question_content.do")
	public String question_content(@RequestParam("num") int num,
			@RequestParam("page") int nowPage, Model model) {
		
		ServiceQuestionDTO dto = this.dao.questionContent(num);
		
		model.addAttribute("Cont", dto);
		model.addAttribute("Page", nowPage);
		
		return "admin_question_content";
	}
	
	@RequestMapping("admin_qeustion_modify.do")
	public String question_modify(@RequestParam("num") int num,
			@RequestParam("page") int nowPage, Model model) {
		
		ServiceQuestionDTO dto = this.dao.questionContent(num);
		
		model.addAttribute("Cont", dto);
		model.addAttribute("Page", nowPage);
		
		return "admin_question_modify";
	
	}
	
	@RequestMapping("admin_question_modifyOk.do")
	public void question_modifyOk(ServiceQuestionDTO dto, 
			@RequestParam("page") int nowPage, HttpServletResponse response) throws IOException{

		int check = this.dao.update_question(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('게시물 수정 성공!!!')");
			out.println("location.href='admin_question_content.do?num="+dto.getQ_num()+"&page="+nowPage+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('게시물 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	}
	
	@RequestMapping("question_search.do")
	public String question_search(@RequestParam("field") String field,
			@RequestParam("keyword") String keyword, 
			@RequestParam("page") int nowPage, Model model) {
		
		//검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
		totalRecord = this.dao.searchQuestionCount(field, keyword);
		
		PageServDTO pdto = 
				new PageServDTO(nowPage, rowsize, totalRecord, field, keyword);
		
		//검색 시 한페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드.
		List<ServiceQuestionDTO> list = this.dao.searchQuestionList(pdto);
		
		model.addAttribute("searchQuestionList", list);
		model.addAttribute("Paging", pdto);
		
		return "admin_question_searchList";
	}
	
	
	
	@RequestMapping("admin_question_delete.do")
	public void question_delete(@RequestParam("num") int num,
			@RequestParam("page") int nowPage,
			HttpServletResponse response) throws IOException {
		
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int check = this.dao.deleteQuestion(num);
		
		if(check > 0) {
			
			this.dao.updateSequence(num);
			out.println("<script>");
			out.println("alert('삭제 성공')");
			out.println("location.href='question_list.do?page="+nowPage+"'");
			out.println("</script>");
		
		}else {
			
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		
	}
	
	
}
