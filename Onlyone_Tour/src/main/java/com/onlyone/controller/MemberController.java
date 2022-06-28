package com.onlyone.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import com.onlyone.model.PageDTO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO dao;
	private final int rowsize = 5; // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0; // DB 상의 전체 게시물의 수
	
	
	// 로그인 페이지로
	@RequestMapping("login.do")
	public String loginMain(Model model) {
		
		return "Login";
		
	}
	
	// 관리자 페이지로
	@RequestMapping("admin.do")
	public String adminMain() {
		return "/admin/admin_main";
	}
	
	
	// 로그인 완료한경우
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
	
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logOut(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.invalidate();
		
		return "main";
		
	}
	
	// 회원가입 페이지로 보내기
	@RequestMapping("join.do")
	public String join(Model model) {
		
		return "join";
	}
	
	// 로그인이 성공한 경우
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
	
	
	// 회원가입 아이디 체크하기
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
	
	// 회원가입 이메일 체크하기
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
	public String memberList(HttpServletRequest request, Model model) {
		
		int page; // 현재 페이지 변수
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}else {
			page = 1; // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}
		
		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord =  this.dao.getListCount();
		
		PageDTO dto = new PageDTO(page, rowsize, totalRecord);
		
		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<MemberDTO> list = this.dao.getMemberList(dto);
		
		model.addAttribute("List", list);
		model.addAttribute("Paging",dto);
		model.addAttribute("total", totalRecord);
		
		return "/admin/admin_memberlist";
	}
	
	// 관리자페이지에서 회원 탈퇴
	@RequestMapping("member_delete.do") 
	public void deleteMember(@RequestParam("id") String id, 
			@RequestParam("page") int nowPage, 
			HttpServletResponse response, MemberDTO dto) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int del = this.dao.deleteMember(id);
		
		if(del > 0) {
			out.println("<script>");
			out.println("alert('회원을 삭제하였습니다.')");
			out.println("location.href='admin_memberlist.do?page="+nowPage+"'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('회원을 삭제하지 못했습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
}
