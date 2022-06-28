package com.onlyone.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.onlyone.model.MemberDAO;
import com.onlyone.model.MemberDTO;

@Controller
public class HomeController {
	
	@Autowired
	private MemberDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		
		return "main";
	}

	@RequestMapping("update_info.do")
	public String updateInfo(@RequestParam("memid") String memid,Model model) {
		
		MemberDTO dto = this.dao.loginOk(memid);
		
		model.addAttribute("mem",dto);
		
		return "update_info";
	}
	
	@RequestMapping("update_info_ok.do")
	public void updateInfoOk(@RequestParam("user_id") String user_id,
			@RequestParam("user_pwd") String user_pwd, 
			@RequestParam("dbpwd") String dbpwd, HttpServletResponse response,
			Model model) throws IOException {
		
		PrintWriter out = response.getWriter();
		
		response.setContentType("text/html; charset=UTF-8");
		
		if(user_pwd.equals(dbpwd)) {
			
			out.println("<script>");
			out.println("location.href='update.do?memid="+user_id+"'");
			out.println("</script>");
		
		}else {
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다. 확인해주세요.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("update.do")
	public String update(@RequestParam("memid") String memid,Model model) {
		
		MemberDTO dto = this.dao.loginOk(memid);
		
		model.addAttribute("update",dto);
		
		return "update_info_ok";
		
	}
	
	@RequestMapping("update_ok.do")
	public void updateOk(MemberDTO dto, Model model,
			HttpServletResponse response ) throws IOException {
		
		int check = this.dao.updateMember(dto);
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("location.href='update_check.do?memid="+dto.getMember_id()+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	@RequestMapping("update_check.do")
	public String updateCheck(@RequestParam("memid") String memid,Model model) {
		
		MemberDTO dto = this.dao.loginOk(memid);
		
		model.addAttribute("check",dto);
		
		return "update_check";
		
	}
}
