<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="top" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${top}/resources/css/top.css">
<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function () {
		$('#my_menu_1').hide;
		$('#my_menu_li').hover(function() {
			$(this).parent().find('#my_menu_1').slideDown();
			$(this).parent().hover(function() {
				
			},function(){
				$(this).parent().find('#my_menu_1').slideUp(0);
			})
		});
	});
	
	
	$(function () {
		$('#list_total_menu').hide;
		$('#click').click(function() {
			$(this).parent().find('#list_total_menu').slideToggle();
			$(this).parent().hover(function() {
				
			},function(){
				$(this).parent().find('#list_total_menu').slideUp(300);
			})
		});
	});	
	
	
	
</script>

</head>
<body>

	<div class="container">
	 <div id="total" class="total">
	  
	  <div class="middle">
	   <div class="login_top">
	   <div class="a1"></div>
	   <div class="a2">
		
		<%
		if(session.getAttribute("member_id") == null){ 
		%>
		<ul>
			<li><a href="<%=request.getContextPath()%>/login.do">로그인</a></li>
			<li><a href="<%=request.getContextPath()%>/join.do">회원가입</a></li>
			<li><a href="<%=request.getContextPath()%>/user_notice_list.do">고객센터</a></li>
		</ul>
		<%}else if(session.getAttribute("member_id") != null && (int)session.getAttribute("verify") == 9){%>
		<ul>
			<li><a href="<%=request.getContextPath()%>/admin.do">관리자 화면</a>
			<li><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>		
		</ul>
		<%}else{%>
		<ul>
			<li><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
			<li><a href="<%=request.getContextPath()%>/user_notice_list.do">고객센터</a></li>
		</ul>
	   	<% } %>
	   
	   </div>
	  </div>	
	 </div>
	 
	  <div class="middle">
	 	<div class="img_menu">
	 	 <div class="a1">
	 	  <h1 class="logo">
	 		<a href="/">
	 		<img src="resources/image/onlyonetour.jpg">
	 		</a></h1>
	 			
	 	<!-- 검색 -->
	 	 <div class="search">
	 		<form method="post"
	 			action="<%=request.getContextPath() %>/search_product.do">
	 		 <fieldset class="fid_search">
	 		 	
	 		 	<legend class="legend">통합 검색어 입력폼</legend>
	 		 	
	 		 	<div class="search_a deletable">
	 		 	<input type="text" id="keyword" placeholder="검색어를 입력해 주세요."
	 		 	 maxlength="30" class="keyword" name="search_product">
	 		 	
	 		 	<span class="s-span" style="position: absolute;
	 		 	 cursor: pointer; default;">X</span>
	 		 	
	 		 	<button class="btn_search" type="submit"> 		 	
	 		 		<span><i class="fa-solid fa-magnifying-glass"></i></span>
	 		 	</button>
	 		 	
	 		 	</div>
	 		 </fieldset>
	 		</form>
	 	 </div>
	 	</div>


	 	<div class="a2">
	 	 <div class="my_menu" id="my_menu">
	 	 <c:set var="mem" value="member_id"/>
	
	 		<ul>
	 			<li style="text-align: center" id="my_menu_li"><a href="#"><i class="fa-solid fa-user fa-2xl"></i><br><br>
	 				<b>마이메뉴</b></a>			
			 		
			 		<%
					if(session.getAttribute("member_id") == null){ 
					%>
			 			<div class="my_menu_1" id="my_menu_1">
			 			 <div class="middle">
			 			  <p class="tit">
			 			  로그인을 해주세요.
			 			  </p>
			 			  <a href="login.do" class="btn">로그인</a>
			 			  <a href="join.do" class="btn">회원가입</a>
			 			 </div>
			 			</div>
			 		<%}else{%>
			 		<div class="my_menu_1" id="my_menu_1">
			 			 <div class="middle">
			 			  <p class="tit">
			 			  ${member_name} 님 반갑습니다.
			 			  </p>
			 			  <ul>
			 			  	<li><a href="<%=request.getContextPath()%>/reserve_list.do?memid=${member_id}">여행/숙박예약</a></li>
			 			  	<li><a href="<%=request.getContextPath()%>/airport_mypage.do?id=${member_id}">항공예약내역</a></li>
			 			  </ul>
			 			  <ul>
			 			  	<li><a href="<%=request.getContextPath() %>/update_info.do?memid=${member_id}">개인정보수정</a></li>
			 			  	<li><a href="<%=request.getContextPath() %>/user_oneQuestion.do?id=${member_id}">1:1문의 내역</a></li>
			 			  	<li><a href="<%=request.getContextPath() %>/delete_user.do?memid=${member_id}">회원탈퇴</a></li>
			 			  </ul>
			 			 </div>
			 			</div>
			 	<% } %>
	 			</li>

	 			
	 			<li style="text-align: center"><a href="<%=request.getContextPath()%>/reserve_list.do?memid=${member_id}"><i class="fa-solid fa-clipboard-check fa-2xl"></i>
	 			<br><br>
	 				<b>여행/숙박예약내역</b></a></li>
	 			
	 			<li style="text-align: center"><a href="<%=request.getContextPath()%>/airport_mypage.do?id=${member_id}"><i class="fa-solid fa-plane fa-2xl"></i><br><br>
	 				<b>항공예약내역</b></a>
	 			</li>
	 		
	 		</ul>

	 	</div>
	 	</div>
       </div>
    </div>
	 	
	 	<div class="middle">
	 		<div class="navi">
	 			<div class="full_menu">
	 			<div>
	 			 <div class="full_menu">
	 		   <a href="#" class="btn_menu on" id="click">
	 			<i class="fa-solid fa-bars"></i> 전체메뉴</a>
	 			 
	 		<div class="list_total_menu n_total on" id="list_total_menu"
	 			 style="display: none;">
	 			<div class="middle">
	 				<a href="#" class="btn_cls" id="x">
					<i class="fa-solid fa-xmark"></i></a>
	 				<div class="ly_wrap">
	 					<div class="middle bundle">
	 					 <div class="group_list">
	 					 	<dl>
	 					 		<dt><a href="#">여행</a></dt>
	 					 		<dd>
	 					 			<ul>
	 					 				<li>해외 여행</li>
	 					 				<li>국내 여행</li>
	 					 			</ul>
	 					 		</dd>
	 					 	</dl>
	 					 </div>
	 					 <div class="group_list">
	 					    <dl>
	 					 		<dt><a href="#">호텔/숙박</a></dt>
	 					 		<dd>
	 					 			<ul>
	 					 				<li>호텔</li>
	 					 				<li>펜션</li>
	 					 				<li>풀빌라</li>
	 					 			</ul>
	 					 		</dd>
	 					 	</dl>
	 					 </div>
	 					 <div class="group_list">
	 					    <dl>
	 					 		<dt><a href="#">항공</a></dt>
	 					 		<dd>
	 					 			<ul>
	 					 				<li>항공예약</li>
	 					 			</ul>
	 					 		</dd>
	 					 	</dl>
	 					 </div>
	 					 
	 					</div>
	 				</div>
	 			</div>
	 		</div>
	 	  </div>
	 	</div>
	 			<div class="full_menu_cont">
	 				<ul class="full_navi_ui">
	 					<li><a href="<%=request.getContextPath() %>/travel_list.do">여행</a></li>
	 					<li><a href="<%=request.getContextPath() %>/hotel_list.do">호텔/숙박</a></li>
	 					<li><a href="<%=request.getContextPath()%>/airport.do">항공</a></li>
	 				</ul>
	 			</div>	
	 	  </div>
	 	</div>
	 	</div>
	 
	  </div>