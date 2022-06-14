<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>onlyone 투어</title>
<style type="text/css">
.infor-txt table{font-size: 13px;}
</style>
</head>
<body>
<!-- 예약정보 reserve db로 insert 해줘야함. -->

	<div class="reserve-travel">
		<h2>예약하기</h2>
		<ul>
			<li><a class="infor-items"><i class="fa-solid fa-clipboard-check">예약정보확인</i></a></li>
			<li><a class="infor-items">￦옵션정보/약관/결제</a></li>
			<li><a class="infor-items" style="font-weight: bold; color: blue">☑예약완료</a></li>
		</ul>
	</div>
	<c:set var="dto" value="${Cont }" />
<c:set var="mem" value="${Member }" />
	
	
		<div class="infor-txt">
		<h3>${mem.member_name }님<br>
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
			<th>여행인원</th><td>여행인원정보</td>
			</tr>

			
		</table>
	
	</div>
	
	
		<input type="button" value="홈으로">
	      
	      	<input type="button" value="예약내역 확인하기">

</body>
</html>