<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>onlyone 투어</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/style.css">
<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>


	<style type="text/css">
	.reserve-travel-notice li{font-size: 10px}
	.txt{font-size: 4px}
	.mr{margin-right:25px;}
	.reserve-travel{	
	margin-top:10px;
	margin-bottom:60px;
	width: 100%;
	height: 50px;
	line-height:50px;
	text-align:left;
/* 	position: absolute; */
	left: 0;
	bottom: 0;}
	
	.reserve-travel ul {
	margin-left: 620px;
}

.reserve-travel ul li {
	font-size: 17px;
	/* width: 25%; */
}

.reserve-travel-main{
	 padding: 3% 8%;
}

table th{width: 200px;}
	</style>
</head>
<body>
<!-- 예약정보 reserve db로 insert 해줘야함. -->
<jsp:include page="include/top.jsp" />
	<div class="reserve-travel-main">
	<div class="reserve-travel">
		
		<h3 style="display: inline;">예약하기</h3>
		<ul style="display: inline-flex;">
			<li><a class="infor-items"   ><i class="fa-solid fa-clipboard-check">예약정보확인</i></a></li>
			<!-- <li><a class="infor-items">￦옵션정보/약관/결제</a></li> -->
			<li><a class="infor-items" style="font-weight: bold; color: blue;">☑예약완료</a></li>
		</ul>
	</div>
	
	
	<c:set var="dto" value="${Cont }" />
	<c:set var="mem" value="${Member }" />
	<c:set var="res" value="${Res }" />
	
	
	

		<div class="infor-txt">
		<h3>${mem.member_name }님
		 예약이 완료 되었습니다.</h3>
		<table border="1" cellspacing="0" width="650" class="table table-striped">
			<tr>
			<th>예약번호</th><td>${res.reserve_num }</td>
			</tr>
			<tr>
			<th>상품명</th><td>${dto.travel_name }</td>
			</tr>
			<tr>
			<th>여행기간</th><td>${dto.travel_departure_date}~${dto.travel_return_date}</td>
			</tr>
			<tr>
			<th>여행인원</th><td>${res.reserve_count }명</td>
			</tr>

			
		</table>
	
	</div>
	<div style="display: flex; justify-content:center;  ">
		<input type="button" value="홈으로" onclick="location.href='main.do'" class="btn btn-outline-secondary" style="margin-right: 15px;">
	      	<input type="button" value="예약내역 확인하기" onclick="location.href='reserve_list.do?memid=${mem.member_id}'" 
	      	class="btn btn-outline-secondary" >
	      </div>	
	      </div>
	      
	     

</body>
</html>