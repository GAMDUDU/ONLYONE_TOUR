<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>onlyone 투어</title>
</head>
<body>
<c:set var="dto" value="${Cont }" />
<c:set var="mem" value="${Member }" />
<c:set var="res" value="${Res }" />

	<div class="reserve-travel">
		<h2>예약하기</h2>
		<ul>
			<li><a class="infor-items"><i class="fa-solid fa-clipboard-check">예약정보확인</i></a></li>
			<li><a class="infor-items" style="font-weight: bold; color: blue">￦옵션정보/약관/결제</a></li>
			<li><a class="infor-items">☑예약완료</a></li>
		</ul>
	</div>
	
	<hr>
	
	<form method="post" action="<%=request.getContextPath() %>/reserve_travel_ok.do?no=${res.reserve_num}">
	
	
	<div><!-- 인클루드? 지금껄로해도되나... -->
		<h3>약관동의</h3>
		<ul>
			<li>국내여행 특별약관(필수)	</li>
			<details style="background-color: #F4F2F2;text-decoration: none;">
			<summary></summary>
			<h4>제1조(목적)</h4>
			<p>이 약관은 ㈜하나투어(이하 ‘당사’라 함)와 여행자가 체결한 국내여행계약의 세부이행 및 준수사항을 정함을 목적으로 합니다.</p>
			</details>

			<li>개인정보 수집 및 이용 동의(필수)</li>
			<li>개인정보 제3자 제공 동의(필수)</li>
			<li>민감정보 수집 및 이용(필수)</li>
			<li>위치정보 이용약관(선택)</li>
		
		</ul>
	
	</div>
	<input type="submit" value="예약하기">
		
<%-- 	<input type="button" value="예약하기" 
	      onclick="location.href='reserve_travel_ok.do?no=${dto.travel_num}'">
 --%>	


</body>
</html>