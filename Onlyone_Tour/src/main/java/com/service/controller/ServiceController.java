package com.service.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;


import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.w3c.dom.ls.LSInput;

import com.google.gson.Gson;
import com.service.model.PageServDTO;
import com.service.model.ServiceCategoryDTO;
import com.service.model.ServiceDAO;
import com.service.model.ServiceDTO;
import com.service.model.ServiceFileDTO;
import com.service.model.ServiceNoticeDTO;
import com.service.model.ServiceQuestionDTO;

@Controller
public class ServiceController {

	private final int rowsize = 6; // 한 페이지당 보여질 게시물의 수
	private int totalRecord = 0; // DB 상의 전체 게시물의 수

	@Autowired
	private ServiceDAO dao;


//자주찾는 질문
	@RequestMapping("question_list.do")
	public String qustionList(HttpServletRequest request, Model model) {

		int page; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
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
	public String question_wirte(Model model) {

		return "admin_question_writeForm";

	}

	@RequestMapping("admin_question_wirteOk.do")
	public void question_writeOk(ServiceQuestionDTO dto, HttpServletResponse response) throws IOException {

		System.out.println(dto.getQ_oc());

		int check = this.dao.insertQuestion(dto);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('질문 추가 성공')");
			out.println("location.href='question_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('질문 추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("admin_question_content.do")
	public String question_content(@RequestParam("num") int num, @RequestParam("page") int nowPage, Model model) {

		ServiceQuestionDTO dto = this.dao.questionContent(num);

		model.addAttribute("Cont", dto);
		model.addAttribute("Page", nowPage);

		return "admin_question_content";

	}

	@RequestMapping("admin_qeustion_modify.do")
	public String question_modify(@RequestParam("num") int num, @RequestParam("page") int nowPage, Model model) {

		ServiceQuestionDTO dto = this.dao.questionContent(num);

		model.addAttribute("Cont", dto);
		model.addAttribute("Page", nowPage);

		return "admin_question_modify";

	}

	@RequestMapping("admin_question_modifyOk.do")
	public void question_modifyOk(ServiceQuestionDTO dto, @RequestParam("page") int nowPage,
			HttpServletResponse response) throws IOException {

		int check = this.dao.update_question(dto);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('게시물 수정 성공!!!')");
			out.println("location.href='admin_question_content.do?num=" + dto.getQ_num() + "&page=" + nowPage + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('게시물 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("question_search.do")
	public String question_search(@RequestParam("field") String field, @RequestParam("keyword") String keyword,
			@RequestParam("page") int nowPage, Model model) {

		// 검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
		totalRecord = this.dao.searchQuestionCount(field, keyword);

		PageServDTO pdto = new PageServDTO(nowPage, rowsize, totalRecord, field, keyword);

		// 검색 시 한페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드.
		List<ServiceQuestionDTO> list = this.dao.searchQuestionList(pdto);

		model.addAttribute("searchQuestionList", list);
		model.addAttribute("Paging", pdto);

		return "admin_question_searchList";
	}

	@RequestMapping("admin_question_delete.do")
	public void question_delete(@RequestParam("num") int num, @RequestParam("page") int nowPage,
			HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int check = this.dao.deleteQuestion(num);

		if (check > 0) {

			this.dao.updateSequence(num);
			out.println("<script>");
			out.println("alert('삭제 성공')");
			out.println("location.href='question_list.do?page=" + nowPage + "'");
			out.println("</script>");

		} else {

			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

//공지사항

	@RequestMapping("notice_list.do")
	public String notice_list(HttpServletRequest request, Model model) {

		int page;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1;
		}

		totalRecord = this.dao.getNoticeListCount();

		PageServDTO dto = new PageServDTO(page, rowsize, totalRecord);

		List<ServiceNoticeDTO> list = this.dao.getServiceNoticeList(dto);

		model.addAttribute("List", list);
		model.addAttribute("Paging", dto);

		return "admin_notice_list";
	}

	@RequestMapping("notice_write.do")
	public String notice_write() {

		return "admin_notice_write";

	}

	@RequestMapping("admin_notice_writeOk.do")
	public void notice_writeOk(HttpServletResponse response, ServiceNoticeDTO dto) throws IOException {

		int check = this.dao.insertNotice(dto);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('공지사항 추가 성공')");
			out.println("location.href='notice_list.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('공지사항 추가 실패')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("admin_notice_content.do")
	public String admin_notice_content(@RequestParam("num") int num, @RequestParam("page") int nowPage, Model model) {
		
		ServiceNoticeDTO dto = this.dao.getNoticeContent(num);
		System.out.println("dto");
		model.addAttribute("Cont", dto);
		model.addAttribute("Page", nowPage);

		return "admin_notice_content";

	}

	@RequestMapping("admin_notice_modify.do")
	public String admin_notice_modify(@RequestParam("num") int num, @RequestParam("page") int nowPage, Model model) {

		ServiceNoticeDTO dto = this.dao.getNoticeContent(num);

		model.addAttribute("Cont", dto);
		model.addAttribute("Page", nowPage);

		return "admin_notice_modify";
	}

	@RequestMapping("admin_notice_modifyOk.do")
	public void notice_modifyOk(ServiceNoticeDTO dto, @RequestParam("page") int nowPage, HttpServletResponse response)
			throws IOException {

		int check = this.dao.update_notice(dto);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		if (check > 0) {
			out.println("<script>");
			out.println("alert('수정 성공')");
			out.println("location.href='admin_notice_content.do?num=" + dto.getN_num() + "&page=" + nowPage + "'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('게시물 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}

	}

	@RequestMapping("admin_notice_delete.do")
	public void notice_delete(@RequestParam("num") int num, @RequestParam("page") int nowPage,
			HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		int check = this.dao.deleteNotice(num);

		if (check > 0) {

			this.dao.updateNoticeSequence(num);

			out.println("<script>");
			out.println("alert('삭제 성공')");
			out.println("location.href='notice_list.do?page=" + nowPage + "'");
			out.println("</script>");

		} else {

			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
	}

	@RequestMapping("notice_search.do")
	public String notice_search(@RequestParam("field") String field, @RequestParam("keyword") String keyword,
			@RequestParam("page") int nowPage, Model model) {

		// 검색분류와 검색어에 해당하는 게시글의 수를 DB에서 확인하는 작업
		totalRecord = this.dao.searchNoticeCount(field, keyword);

		PageServDTO pdto = new PageServDTO(nowPage, rowsize, totalRecord, field, keyword);

		// 검색 시 한페이지당 보여질 게시물의 수만큼 검색한 게시물을 List로 가져오는 메서드.
		List<ServiceNoticeDTO> list = this.dao.searchNoticeList(pdto);

		model.addAttribute("searchNoticeList", list);
		model.addAttribute("Paging", pdto);

		return "admin_notice_searchList";

	}

//회원 - 공지사항	
	@RequestMapping("user_notice_list.do")
	public String user_notice_list(HttpServletRequest request, Model model) {

		int page; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
		// 단, user일 경우 공개여부에 '공개'라고 되어있는 게시글만 가져와야함
		totalRecord = this.dao.userNoticeListCount();

		PageServDTO dto = new PageServDTO(page, rowsize, totalRecord);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		// 단, user일 경우 공개여부에 '공개'라고 되어있는 게시글만 가져와야함.
		List<ServiceNoticeDTO> list = this.dao.userServiceNoticeList(dto);

		model.addAttribute("List", list);
		model.addAttribute("Paging", dto);

		return "user_notice_list";
	}

	@RequestMapping("user_notice_content.do")
	public String user_notice_content(@RequestParam("num") int num, @RequestParam("page") int nowPage, Model model) {
		
		
		this.dao.viewCount(num);

		ServiceNoticeDTO dto = this.dao.getNoticeContent(num);

		model.addAttribute("Cont", dto);
		model.addAttribute("Page", nowPage);

		return "user_notice_content";
	}

//회원 자주 찾는 질문 
	@RequestMapping("user_question_list.do")
	public String userQuestionList(HttpServletRequest request, Model model) {

		int page; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
		// 단, user일 경우 공개여부에 '공개'라고 되어있는 게시글만 가져와야함
		totalRecord = this.dao.userQuestionListCount();

		PageServDTO dto = new PageServDTO(page, rowsize, totalRecord);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		// 단, user일 경우 공개여부에 '공개'라고 되어있는 게시글만 가져와야함.
		List<ServiceQuestionDTO> list = this.dao.userServiceQuestionDTO(dto);

		model.addAttribute("List", list);
		model.addAttribute("Paging", dto);

		return "user_question_list";
	}

//회원 1:1 문의	
	@RequestMapping("user_oneQuestion.do")
	public String user_oneQuestionList(HttpServletRequest request, Model model, 
			@RequestParam("id") String id) {

		
		// 카테고리 리스트
		List<ServiceCategoryDTO> cList = this.dao.getCategoryList();

		model.addAttribute("categoryList", cList);
		
		// 회원의 질문 리스트
		int page; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord = this.dao.getUserQuListCount(id);

		PageServDTO dto = new PageServDTO(page, rowsize, totalRecord);
		dto.setMember_id(id);
		
		//session에서 가져온 id로 해당 회원의 질문글 조회 
		List<ServiceDTO> List = this.dao.getOneQuestionList(dto); 
		
		model.addAttribute("Paging", dto);
		model.addAttribute("QList", List);
		
		return "user_OneQuestion";

	}
	
	@RequestMapping(value="/user_oneQuestionJson.do" )
	public void user_oneQuestionListJason(@RequestParam HashMap<String, Object> params,HttpServletResponse response,  Model model) throws IOException {
		System.out.println(":::::ajax연결");
		System.out.println(":::::params:::"+params.get("page"));
		
		String memid = (String)params.get("memberId");
		System.out.println(params);
		
		// 카테고리 리스트
		
		List<ServiceCategoryDTO> cList = this.dao.getCategoryList();
		model.addAttribute("categoryList", cList);
		
		//회원의 질문 리스트
		int page; // 현재 페이지 변수

		if (params.get("page") != null) {
			page = Integer.parseInt((String)params.get("page"));
		} else {
			page = 1; // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord = this.dao.getUserQuListCount(memid);

		PageServDTO dto = new PageServDTO(page, rowsize, totalRecord);
		dto.setMember_id(memid);
		
		//session에서 가져온 id로 해당 회원의 질문글 조회 
		List<ServiceDTO> List = this.dao.getOneQuestionList(dto); 
		model.addAttribute("Paging", dto); 
		model.addAttribute("QList", List);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("List", List);
		map.put("Pdto", dto);
		
		 response.setContentType("text/html; charset=UTF-8"); 
		 PrintWriter out = response.getWriter();
		 
		// ajax에게 응답을 해준다.
		 out.println(new Gson().toJson(map)); 
		
	}
	
	@RequestMapping("user_oneQuestion_Write.do")
	public void user_oneQuestionWrite(ServiceDTO serviceDTO, 
			HttpServletResponse response, HttpServletRequest request,
			@RequestParam("upfile")MultipartFile[] upfile,  Model model) throws IOException {
		
		//파일목록을 저장할 리스트 생성
		//ArrayList<ServiceFileDTO> fileList = new ArrayList<ServiceFileDTO>();
		
		
		//게시글 등록
		int result = this.dao.writeOneQuestion(serviceDTO);  
		
		// fileDTO에 service_num의 fk 값을 주기위해 조회한다.
		int sNum = this.dao.getServiceNumValue();
		
		
		System.out.println("upfile.length///"+upfile.length);		
		//MultipartFile[] : 첨부파일의 갯수만큼 길이가 생성 (단, 첨부파일이 없어도 길이는 무조건 1)
		//input이기 때문에 일단 데이터가 넘어오기 때문
		//첨부파일이 없는 경우는 배열의 첫번째 파일이 비어있는지 체크하는 방식		
		
		
		//첨부파일이 있는 경우 파일 업로드 작업 진행
		//1. 파일업로드 경로 설정(HttpServletRequest 객체를 이용해서 경로를 가져옴)
		//request.getSession().getServletContext().getRealPath()  ->  /webapp/폴더경로
		String savePath 
		= "C:\\Users\\ubg11\\git\\ONLYONE-TOUR\\ONLYONE-TOUR\\Onlyone_Tour\\src\\main\\webapp\\resources\\image_service\\upload\\";
		
		//request.getSession().getServletContext().getRealPath("/resources/image_service/upload/");
		//패스 경로 위에처럼 해야하는데 안돼서 직접 복사
		
		
		//2. 반복문을 이용한 파일 업로드 처리
		for(MultipartFile file : upfile) {
			//넘어온 파일이 비어있을 경우 for문을 continue함 (실행하지 않고 빠져나가 다음 것을 실행함)
			if(file ==null || file.isEmpty()) {continue;}
			
			//파일명이 기존 파일과 겹치는 경우 기존 파일을 삭제하고 새 파일만 남는 현상이 생김(덮어쓰기)
			//파일명 중복처리 (겹치면 넘버링 처리)
			//사용자가 업로드한 파일 이름(원본파일이름) 
			String file_name = file.getOriginalFilename();
			
			//test.txt 중복일 경우 -> test_1.txt -> test_2.txt
			//업로드한 파일명이 test.txt인 경우 -> (test) (.txt) 두 부분으로 분리 (이름과 확장자로 분리)
			//file_name.lastIndexOf(".") : file_name 중 0번째 자리부터 뒤에서 가장 가까운 인덱스 "." 까지 찾아 자른다.
			String onlyFilename = file_name.substring(0, file_name.lastIndexOf(".")); // test
			String extention = file_name.substring(file_name.lastIndexOf(".")); // .txt
			
			//실제 업로드할 파일명을 저장할 변수
			String file_path = null;
			
			//파일명 중복시 뒤에 붙일 수자 변수
			int count = 0;
			
			//중복이 안될때까지 반복해야하기 때문에 무한반복 사용
			while(true) {
				
				if(count == 0) {
					//반복 첫째회차에는 원본 파일명 그대로 적용
					file_path = onlyFilename + extention; //test.txt
				}else {
					file_path = onlyFilename + "_" + count + extention; //test + _  + count값 + .txt
				}
				
				//저장경로에 들어가 파일과 같은 이름이 있는지 확인
				File checkFile = new File(savePath+file_path);
				if(!checkFile.exists()) {	//.exists() : 존재여부 확인 
					//중복 파일명이 존재하지 않을때까지 반복후 존재하지 않으면 break로 while문을 나온다.
					break; 
				}
				count++;
				
			}//파일명 중복 검사가 끝난 시점 -> 해당파일 업로드 작업
			
			try {
				//중복처리가 끝난 파일명(file_path)으로 파일을 업로드할 FileOutputStream 객체 생성
				FileOutputStream fos = new FileOutputStream(new File(savePath+file_path));
				//업로드 속도증가를 위한 보조 스트림 생성
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일업로드 처리
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (Exception e) {
			
				// TODO: handle exception
				e.printStackTrace();
			} 
			//서버 파일 업로드 작업 끝(파일 1개 단위)
			ServiceFileDTO fDto = new ServiceFileDTO();
			fDto.setService_num(sNum);
			fDto.setFile_name(file_name);
			fDto.setFile_path(file_path);
			//fileList.add(fDto);
			
			//반복적으로 서버에 추가
			this.dao.addFile(fDto);
		}
		
		System.out.println(serviceDTO.getMember_id());
			
		//새로 페이지를 이동하니까 카테고리 리스트를 보내주어야 한다. 
		List<ServiceCategoryDTO> cList = this.dao.getCategoryList();
		
		model.addAttribute("categoryList", cList);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
		
		out.println("<script>"); 
		out.println("alert('문의글이 정상적으로 등록되었습니다.')");
		out.println("location.href='user_oneQuestion.do?id="+serviceDTO.getMember_id()+"'");
		out.println("</script>");
		
		}
		

	}

//관리자 1:1 문의
	@RequestMapping("oneQuestion_list.do")
	public String admin_oneQuestion(HttpServletRequest request, Model model) {

		int page; // 현재 페이지 변수

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		} else {
			page = 1; // 처음으로 게시물 전체 목록 태그를 선택한 경우
		}

		// DB 상의 전체 게시물의 수를 확인하는 메서드 호출
		totalRecord = this.dao.adminOneQuestionListCount();
		//System.out.println(totalRecord);

		PageServDTO dto = new PageServDTO(page, rowsize, totalRecord);

		// 페이지에 해당하는 게시물을 가져오는 메서드 호출
		List<ServiceDTO> sList = this.dao.getOneServiceList(dto);
		//System.out.println(sList);

		model.addAttribute("servList", sList);
		model.addAttribute("Paging", dto);

		return "admin_oneQuestion_list";

	}

	@RequestMapping("amdin_oneQuestion_content.do")
	public String amdin_oneQuestionContent(@RequestParam("num") int num, @RequestParam("page") int nowPage,
			Model model) {

		// 조회수증가
		this.dao.oneQviewCount(num);

		// 게시글 내용
		ServiceDTO dto = this.dao.getAdminOneQuestionContent(num);

		// 첨부파일 가져오기
		List<ServiceFileDTO> FileList = this.dao.getUserFileToAdmin(num);

		model.addAttribute("content", dto);
		model.addAttribute("Page", nowPage);
		model.addAttribute("fileList", FileList);

		return "admin_oneQuestion_content";
	}

	// replyForm 페이지로 num에 해당하는 게시글을 넘겨주어야함
	// 그래야 해당하는 정보에 답글을 설정할 수 있음
	@RequestMapping("admin_oneQuestion_reply.do")
	public String admin_oneQuestionReply(@RequestParam("num") int num, @RequestParam("page") int nowPage, Model model) {

		ServiceDTO dto = this.dao.getAdminOneQuestionContent(num);
		
		model.addAttribute("content", dto);
		model.addAttribute("Page", nowPage);

		return "admin_oneQuestion_replyForm";
	}

	@RequestMapping("fileDownload.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("no") int fileNo) throws IOException {
		
		//파일 이름과 파일 패스가 필요해서 가져옴 
		ServiceFileDTO fileDTO = this.dao.getOneUserFileToAdmin(fileNo);
		System.out.println("fileDTO = " + fileDTO);
		
		//파일과 현재 서블릿 연결
		//String root = request.getSession().getServletContext().getRealPath("/"); ///webapp
		String root = "C:\\Users\\ubg11\\git\\ONLYONE-TOUR\\ONLYONE-TOUR\\Onlyone_Tour\\src\\main\\webapp\\resources\\image_service\\upload\\";
		String downLoadFile = root + fileDTO.getFile_path();
		System.out.println(fileDTO.getFile_path());
		
		//파일을 읽어오기 위한 스트림
		FileInputStream fis = new FileInputStream(downLoadFile);
		//속도를 빠르게 하기 위해 보조스트림 생성
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		
		//읽어온 파일을 사용자에게 전달할 스트림 생성
		ServletOutputStream sos = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(sos);
		
		//파일명 처리 - 사용자가 받을 파일 : 크롬에서 파일명이 정상적으로 받아지게 처리해주는 것
		String resFilename = new String(fileDTO.getFile_name().getBytes("UTF-8"), "ISO-8859-1");
		
		//파일 다운로드를 위한 HTTP Header 설정
		response.setContentType("application/octet-stream");  //파일의 형식으로 받아라
		response.setHeader("Content-Disposition", "attachment;filename="+resFilename); //파일의 이름 알려줌
		
		//파일전송
		while(true) {
			int read = bis.read(); //read() : 데이터가 없으면 -1을 반환함
			if(read != -1) {
				bos.write(read);	//데이터가 있으면 클라이언트한테 내보냄
			}else {
				break;
			}
		}
		
		bos.close();
		bis.close();
	}

	@RequestMapping("admin_oneQuestion_replyOk.do")
	public void admin_oneQuestionReplyOk(ServiceDTO serviceDto, 
			@RequestParam("page") int nowPage, HttpServletResponse response ,
			@RequestParam("upfile")MultipartFile[] upfile) throws IOException {
		System.out.println(serviceDto);
		System.out.println(serviceDto.getService_group());
		
		//service_num의 max값을 구해오는 메소드
		//num = 원글의 group과 일치
		int num = this.dao.getMaxServiceNum();
				
		//group으로 step과 index의 max값을 가져옴
		int step = this.dao.getStep(serviceDto.getService_group());
		int indent = this.dao.getIndent(serviceDto.getService_group());
		
		serviceDto.setService_indent(indent);
		serviceDto.setService_step(step);
		serviceDto.setService_num(num);
		
		//답변등록
		int check = this.dao.addOneQuestionReply(serviceDto);
		
		//답변을 등록했으면 원글의 상태를 '답변완료'로 바꿔준다
		this.dao.updateOneQuetionOrgingSi(num);
		
		// fileDTO에 service_num의 fk 값을 주기위해 조회한다.
		int sNum = this.dao.getServiceNumValue();
		
		
		System.out.println("upfile.length///"+upfile.length);		
		//MultipartFile[] : 첨부파일의 갯수만큼 길이가 생성 (단, 첨부파일이 없어도 길이는 무조건 1)
		//input이기 때문에 일단 데이터가 넘어오기 때문
		//첨부파일이 없는 경우는 배열의 첫번째 파일이 비어있는지 체크하는 방식		
		
		
		//첨부파일이 있는 경우 파일 업로드 작업 진행
		//1. 파일업로드 경로 설정(HttpServletRequest 객체를 이용해서 경로를 가져옴)
		//request.getSession().getServletContext().getRealPath()  ->  /webapp/폴더경로
		String savePath 
		= "C:\\Users\\ubg11\\git\\ONLYONE-TOUR\\ONLYONE-TOUR\\Onlyone_Tour\\src\\main\\webapp\\resources\\image_service\\upload\\";
		
		//request.getSession().getServletContext().getRealPath("/resources/image_service/upload/");
		//패스 경로 위에처럼 해야하는데 안돼서 직접 복사
		
		
		//2. 반복문을 이용한 파일 업로드 처리
		for(MultipartFile file : upfile) {
			//넘어온 파일이 비어있을 경우 for문을 continue함 (실행하지 않고 빠져나가 다음 것을 실행함)
			if(file ==null || file.isEmpty()) {continue;}
			
			//파일명이 기존 파일과 겹치는 경우 기존 파일을 삭제하고 새 파일만 남는 현상이 생김(덮어쓰기)
			//파일명 중복처리 (겹치면 넘버링 처리)
			//사용자가 업로드한 파일 이름(원본파일이름) 
			String file_name = file.getOriginalFilename();
			
			//test.txt 중복일 경우 -> test_1.txt -> test_2.txt
			//업로드한 파일명이 test.txt인 경우 -> (test) (.txt) 두 부분으로 분리 (이름과 확장자로 분리)
			//file_name.lastIndexOf(".") : file_name 중 0번째 자리부터 뒤에서 가장 가까운 인덱스 "." 까지 찾아 자른다.
			String onlyFilename = file_name.substring(0, file_name.lastIndexOf(".")); // test
			String extention = file_name.substring(file_name.lastIndexOf(".")); // .txt
			
			//실제 업로드할 파일명을 저장할 변수
			String file_path = null;
			
			//파일명 중복시 뒤에 붙일 수자 변수
			int count = 0;
			
			//중복이 안될때까지 반복해야하기 때문에 무한반복 사용
			while(true) {
				
				if(count == 0) {
					//반복 첫째회차에는 원본 파일명 그대로 적용
					file_path = onlyFilename + extention; //test.txt
				}else {
					file_path = onlyFilename + "_" + count + extention; //test + _  + count값 + .txt
				}
				
				//저장경로에 들어가 파일과 같은 이름이 있는지 확인
				File checkFile = new File(savePath+file_path);
				if(!checkFile.exists()) {	//.exists() : 존재여부 확인 
					//중복 파일명이 존재하지 않을때까지 반복후 존재하지 않으면 break로 while문을 나온다.
					break; 
				}
				count++;
				
			}//파일명 중복 검사가 끝난 시점 -> 해당파일 업로드 작업
			
			try {
				//중복처리가 끝난 파일명(file_path)으로 파일을 업로드할 FileOutputStream 객체 생성
				FileOutputStream fos = new FileOutputStream(new File(savePath+file_path));
				//업로드 속도증가를 위한 보조 스트림 생성
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				//파일업로드 처리
				byte[] bytes = file.getBytes();
				bos.write(bytes);
				bos.close();
			} catch (Exception e) {
			
				// TODO: handle exception
				e.printStackTrace();
			} 
			//서버 파일 업로드 작업 끝(파일 1개 단위)
			ServiceFileDTO fDto = new ServiceFileDTO();
			fDto.setService_num(sNum);
			fDto.setFile_name(file_name);
			fDto.setFile_path(file_path);
			//fileList.add(fDto);
			
			//반복적으로 서버에 추가
			this.dao.addFile(fDto);
		}
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if (check > 0) {

			out.println("<script>");
			out.println("alert('작성 완료')");
			out.println("location.href='oneQuestion_list.do?page=" + nowPage + "'");
			out.println("</script>");

		} else {

			out.println("<script>");
			out.println("alert('작성 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("admin_oneQuestion_delete.do")
	public void admin_oneQuestion_delete(@RequestParam("num") int num, @RequestParam("page") int nowPage,
			HttpServletResponse response) throws IOException {
		
		//group이 num인 글 모두 삭제
		int check = this.dao.deleteOneQuestion(num);
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			
			out.println("<script>");
			out.println("alert('삭제 완료')");
			out.println("location.href='oneQuestion_list.do?page=" + nowPage + "'");
			out.println("</script>");

		}
		
	}
	
	@RequestMapping("user_oneQuestion_content.do")
	public String user_oneQuestionContent(@RequestParam("num") int num, @RequestParam("page") int nowPage,
			Model model) {

		// 조회수증가
		this.dao.oneQviewCount(num);

		// 게시글 내용
		ServiceDTO dto = this.dao.getAdminOneQuestionContent(num);

		// 첨부파일 가져오기
		List<ServiceFileDTO> FileList = this.dao.getUserFileToAdmin(num);

		model.addAttribute("content", dto);
		model.addAttribute("Page", nowPage);
		model.addAttribute("fileList", FileList);

		return "user_oneQuestion_content";
	} 
	
	@RequestMapping("oneQuestion_search.do")
	public String oneQuestionSearch(@RequestParam("field") String field, @RequestParam("keyword") String keyword,
			@RequestParam("startDate") String startDate, @RequestParam("page") int nowPage,
			@RequestParam("endDate") String endDate, @RequestParam("reply") String reply , Model model ,
			@RequestParam("service_code") int service_code) {
		
		//검색기간 설정
		if(startDate == "") {
			startDate = "2000-01-01";
		}
		if(endDate == "") {
			endDate = "9999-12-12";
		}
		
		//객체 초기화 - 페이지 단위로는 못가져와서 밑에서 새로 생성해줘야함
		//토탈레코드를 가져오기 위해 사용
		//이미 해서 생성자를 또 만들기 귀찮..
		PageServDTO pDto = new PageServDTO();
		pDto.setPage(nowPage);
		pDto.setKeyword(keyword);
		pDto.setStartDate(startDate);
		pDto.setEndDate(endDate);
		pDto.setReply(reply);
		pDto.setService_code(service_code);
		pDto.setField(field);
		
		List<ServiceDTO> sList = null;
		System.out.println("keyword= " + keyword );
		//게시글의 수를 DB에서 확인하는 작업 (검색분류, 검색어, 답변유무, 검색기간에 따라 달라야함.)
		//넘어온 keyword에 따라 답변상태에 따라 나누어주어야함
		if(reply.equals("all")) { 
			//답변상태가 전체검색일 경우
			totalRecord = this.dao.searchOneQuestionAALLCount(field, pDto);
			
			//page 객체에 페이지 레코드 설정
			PageServDTO pgDto =
					new PageServDTO(nowPage, rowsize, totalRecord, field, keyword, startDate, endDate, reply, service_code);
			
			sList = this.dao.getOneQuestionSearchAllList(field, pgDto);
			System.out.println("sList = " + sList);
			
			model.addAttribute("servList", sList);
			model.addAttribute("Paging", pgDto);
		}else {	
			//답변상태가 확인중 or 답변완료일 경우
			totalRecord = this.dao.searchOneQuestionACount(field, pDto);
			
			PageServDTO pgDto =
					new PageServDTO(nowPage, rowsize, totalRecord, field, keyword, startDate, endDate, reply, service_code);
			
			sList = this.dao.getOneQuestionSearchList(field, pgDto);
			
			model.addAttribute("servList", sList);
			 model.addAttribute("Paging", pgDto);
		
		}
		
		System.out.println("totalRecord = " + totalRecord);
		
		return "admin_oneQuestionSearchList";
	}
	
	

	@RequestMapping("admin_test.do")
	public String admin_test() {
		
		return "admin_test";
	}
	
	

}
