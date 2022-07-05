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

	<div class="reserve-travel">
		<h2>예약하기</h2>
		<ul>
			<li><a class="infor-items"><i class="fa-solid fa-clipboard-check">예약정보확인</i></a></li>
			<li><a class="infor-items">￦옵션정보/약관/결제</a></li>
			<li><a class="infor-items" style="font-weight: bold; color: blue">☑예약완료</a></li>
		</ul>
	</div>
	
	<%-- <c:set var="dto" value="${Cont }" />
	<c:set var="mem" value="${Member }" />
	<c:set var="res" value="${Res }" />


	<div>
	<div class="infor-txt">
		<h3>${mem.member_Name }님<br>
		 예약이 완료 되었습니다.</h3>
		<table border="1" cellspacing="0" width="650">
			<tr>
			<th>예약번호</th><td>예약번호어쩌구저쩌구</td>
			</tr>
			<tr>
			<th>상품명</th><td>${dto.travel_name }</td>
			</tr>
			<tr>
			<th>여행기간</th><td>${dto.travel_departure_date.substring(0,20) }~${dto.travel_return_date.substring(25,41) }</td>
			</tr>
			<tr>
			<th>여행인원</th><td>${res.reserve_count }명${res.reserve_num }</td>
			</tr>

			
		</table>
	
	</div> --%>

</body>
</html>