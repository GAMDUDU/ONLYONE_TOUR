package com.onlyone.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.onlyone.model.MemberDAO;
import com.onlyone.model.MemberDTO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	
	@RequestMapping("login.do")
	public String loginMain(Model model) {
		
		return "Login";
		
	}
	
	@RequestMapping("login_ok.do")
	public void loginOk(@RequestParam("id") String id, @RequestParam("pwd") String pwd,
			HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		MemberDTO dto = this.dao.loginOk(id);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		HttpSession session = request.getSession();
		
		if(id == "") {
			
			out.println("<script>");
			out.println("alert('아이디를 입력해주세요')");
			out.println("history.back()");
			out.println("</script>");
			
		}else if(pwd == "") {
			
			out.println("<script>");
			out.println("alert('비밀번호를 입력해주세요')");
			out.println("history.back()");
			out.println("</script>");
			
		}else if(dto == null) {
			
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.')");
			out.println("history.back()");
			out.println("</script>");
			
		}else if(dto.getMember_id() != null) {
			if(dto.getMember_id().equals(id)) { // 입력id와 데이터베이스 id와 같을 경우
				if(dto.getMember_pwd().equals(pwd)) {
					
					session.setAttribute("member_id", dto.getMember_id());
					session.setAttribute("member_pwd", dto.getMember_pwd());
					session.setAttribute("member_name", dto.getMember_name());
					session.setAttribute("verify", dto.getVerify());
					
					out.println("<script>");
					out.println("location.href='/'");
					out.println("</script>");
					
					
				}else { // 비밀번호가 틀린 경우
				
					out.println("<script>");
					out.println("alert('비밀번호가 틀립니다.')");
					out.println("history.back()");
					out.println("</script>");
				}
			}
		}
	} // loginOk() end문
		
	@RequestMapping("logout.do")
	public String logOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "main";
		
	}
	
	@RequestMapping("join.do")
	public String join(Model model) {
		
		return "join";
	}
	
	
	@RequestMapping("joinOk.do")
	public String joinOk(MemberDTO dto, HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {
		
		int check = this.dao.insertMember(dto);
		String name = dto.getMember_name();
		String ok = "";
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		model.addAttribute("name", name);
		
		if(check > 0) {
			ok = "joinOk";
			
		}else {
			out.println("<script>");
			out.println("alert('회원가입 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return ok;
		
	} // joinOk.do() end
	
	@RequestMapping("idCheck.do")
	public String idCheck(@RequestParam("memberId") String id, HttpServletResponse response) throws IOException{
		
		int res = this.dao.checkUserId(id);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(res == 1) {
			// ajax에게 응답을 해준다.
			out.println(res);
		}
		
		return null;
		
	
	} // idCheck() end 부분
	
	@RequestMapping("emailCheck.do")
	public String emailCheck(@RequestParam("memberEmail") String email, HttpServletResponse response) throws IOException {
		
		int res = this.dao.checkUserEmail(email);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(res == 1) {
			out.println(res);
		}
		
		return null;
	} // emailCheck() end 부분
	
	
	// 아이디 찾기
	@RequestMapping("findId.do")
	public String idsearch(MemberDTO dto,
		HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {
		
		MemberDTO findId = this.dao.findId(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		
		if(findId != null) {
			model.addAttribute("check", 0);
			model.addAttribute("FindId", findId.getMember_id());
		}else {
			model.addAttribute("check", 1);

		}
		
		return "idFind";
		
	} // idsearch(end)
	
	
	// 비밀번호 찾기
	@RequestMapping("findPwd.do")
	public String pwdSearch(MemberDTO dto, Model model, HttpServletResponse response) {
		
		MemberDTO findPwd = this.dao.findPwd(dto);
		
		response.setContentType("text/html; charset=UTF-8");
		
		if(findPwd != null) {
			model.addAttribute("check", 0);
			model.addAttribute("FindPwd", findPwd.getMember_pwd());
		}else {
			model.addAttribute("check", 1);
		}
		return "pwdFind";
	}
	
	
	// 고객정보 페이지로 보내기
	@RequestMapping("admin_memberlist.do")
	public String memberList() {
		return "/admin/admin_memberlist";
	}
	
	
	
}
