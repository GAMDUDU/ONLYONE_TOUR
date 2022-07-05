package com.onlyone.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	// 개인정보 수정
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
		
		}else if(user_pwd == "") {
			
			out.println("<script>");
			out.println("alert('비밀번호를 입력해주세요.')");
			out.println("history.back()");
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
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			out.println("<script>");
			out.println("alert('개인정보를 수정하였습니다')");
			out.println("location.href='/'");
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
	
	// 회원탈퇴
	@RequestMapping("delete_user.do")
	public String deleteUser(@RequestParam("memid") String memid, Model model) {
		
		MemberDTO dto = this.dao.loginOk(memid);
		
		model.addAttribute("mem", dto);
		
		return "delete_user";
	}
	
	// 회원탈퇴 확정
	@RequestMapping("delete_user_ok.do")
	public void deleteOk(@RequestParam("user_id") String id,
			@RequestParam("user_pwd") String pwd, @RequestParam("dbpwd") String dbpwd
			, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		response.setContentType("text/html; charset=UTF-8");
		
		// 패스워드와 데이터베이스 패스워드를 비교 후 삭제하는 메서드
		if(pwd.equals(dbpwd)) {
			
			// 데이터베이스 패스워드와 입력한 패스워드의 값이 일치하는 경우 하기 로직이 설정되게끔 처리
			// delete dao의 객체의 경우 조건문 이전에 실행할경우 조건부와 상관없이 읽히게됨
			// 그 부분을 방지하기 위해 조건문 구현부안에서만 실행되게끔 조정.
			int delete = this.dao.deleteMember(id);
			
			if(delete > 0) {
				session.invalidate();
				out.println("<script>");
				out.println("alert('회원탈퇴를 완료하였습니다.')");
				out.println("location.href='/'");
				out.println("</script>");
			}
			System.out.println(delete);
		
		}else if(pwd.equals("")) {
			out.println("<script>");
			out.println("alert('비밀번호를 입력해주세요')");
			out.println("history.back()");
			out.println("</script>");
		}
		// 데이터베이스 패스워드와 입력한 값의 패스워드가 불일치하는경우 아래 조건문을 실행
		else {
			
			out.println("<script>");
			out.println("alert('비밀번호가 틀렸습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
	}
}
