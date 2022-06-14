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

</head>
<body>

<c:set var="dto" value="${Member}"/>
	<div class="container">
	 <div id="total" class="total">
	  <div class="middle">
	   <div class="login_top">
	   <div class="a1"></div>
	   <div class="a2">
	   <c:if test="${dto == null}">
		<ul>
			<li><a href="<%=request.getContextPath()%>/login.do">로그인</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">고객센터</a></li>
		</ul>
		</c:if>
		<c:if test="${dto != null}">
			<ul>
				<li><a href="#">로그아웃</a></li>
				<li><a href="#">고객센터</a></li>
			</ul>
		</c:if>	
	   </div>
	  </div>	
	 </div>
	 
	 <div class="middle">
	 	<div class="img_menu">
	 	 <div class="a1">
	 	  <h1 class="logo">
	 		<a href="#">
	 		<img src="resources/image/onlyonetour.jpg">
	 		</a></h1>
	 			
	 	<!-- 검색 -->
	 	 <div class="search">
	 		<form method="post"
	 			action="<%=request.getContextPath() %>/검색">
	 		 <fieldset class="fid_search">
	 		 	<legend class="legend"></legend>
	 		 	<div class="search_a deletable">
	 		 	<input class="keyword" placeholder="검색어를 입력해 주세요.">
	 		 	<span class="s-span" style="position: absolute;
	 		 	 cursor: pointer; default;">X</span>
	 		 	<button class="btn_search"><i class="fa-solid fa-magnifying-glass"></i>검색</button>
	 		 	</div>
	 		 </fieldset>
	 		</form>
	 	 </div>
	 	</div>
	 	</div>
	 	
	 	<div class="a2">
	 	 <div class="my_menu">
	 		<ul>
	 			<li><a href="#"><i class="fa-solid fa-plane fa-2xl"></i><br>
	 			<b>찜</b></a></li>
	 			<li><a href="#"><i class="fa-solid fa-clipboard-check fa-2xl"></i><br>
	 			<b>예약내역</b></a></li>
	 			<li><a href="#"><i class="fa-solid fa-user fa-2xl"></i><br>
	 			<b>마이메뉴</b></a></li>
	 		</ul>
	 	</div>

	 	</div>
    </div>
    </div>
	 	
	 	<div class="middle">
	 		<div class="navi">
	 			<div class="full_menu">
	 			<a href="#">
	 			전체메뉴</a></div>
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

</body>
</html>