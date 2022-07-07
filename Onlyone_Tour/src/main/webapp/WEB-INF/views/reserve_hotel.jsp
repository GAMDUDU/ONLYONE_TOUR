<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	display: flex;
	margin-left: 500px;
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

<c:set var="dto" value="${Cont }" />
<c:set var="mem" value="${Member }" />
<c:set var="res" value="${Res }" />

<jsp:include page="include/top.jsp" />

<div class="reserve-travel-main">
	<div class="reserve-travel">
		<h3 style="display: inline;">예약하기</h3>
		<ul style="display: inline-flex;">
			<li><a class="infor-items" style="font-weight: bold; color: blue" ><i class="fa-solid fa-clipboard-check">예약정보확인</i></a></li>
			<!-- <li><a class="infor-items">￦옵션정보/약관/결제</a></li> -->
			<li><a class="infor-items">☑예약완료</a></li>
		</ul>
	</div>
	
	
	<form method="post" action="<%=request.getContextPath()%>/reserve_hotel_ok.do?no=${dto.hotel_num}">
	
	<div class="reserve-travel-cont">
		<h3>${dto.hotel_hname }</h2>
		<table border="1" cellspacing="0" width="650" class="table table-striped">
		
			<tr>
				<th>도시</th>
				<td>(${dto.hotel_country})${dto.hotel_loc}</td>
			</tr>
		
			<tr>
				<th>체크인/체크아웃</th>
				<td>2022.07.08~2022.07.09</td>
			</tr>

			<tr>
				<th>객실정보</th>
				<td>${dto.hotel_room1 }</td>
			</tr>
			
			<tr>
				<th>금액</th>
				<td><input name="price_account" value=" ${dto.hotel_price1 }"></td>
			</tr>

		</table>
	</div>
	
	<div class="reserve-hotel-member-cont">
		<h2>여행자 정보</h2>
		
		<input type="hidden" value="${mem.member_id }" name="id">

			<div id="hotel-member-info">
				<table border="1" cellspacing="0" width="650" class="table table-striped">
					<tr>
					<th>성명(한글)</th>
					<td colspan="3">${mem.member_name }</td>
					</tr>
					
					<tr>
					<th>생년월일</th>
					<td>${mem.member_birth }</td>
			 		<th>성별</th>
					<td>
							${mem.member_gender }
					</td>
					</tr>
										
					<tr>
					<th>휴대폰번호</th> <td>${mem.member_phone }</td>
					
					<th>이메일</th> <td>${mem.member_email }</td>
					</tr>
				</table>
			</div>
	</div>
	
	
	<div class="reserve-travel-member-cont">
		<h2>투숙자 정보</h2>

			<div id="travel-member-info">
				<table border="1" cellspacing="0" width="650" class="table table-striped">
					<tr>
					<th>성명(한글)</th>
					<td colspan="3"><input name="reserve_name" placeholder="홍길동"></td>
					</tr>
					
					<tr>
					<th>생년월일</th>
					<td><input name="reserve_date" placeholder="ex)20220705"></td>
			 		<th>성별</th>
					<td>
						<input type="radio" name="reserve_gender" value="male">
						<label for="male">남자</label>
						<input type="radio" name="reserve_gender" value="female">
						<label for="female">여자</label>
					</td>
					</tr>
										
					<tr>
					<th>휴대폰번호</th> <td><input name="reserve_phone" placeholder="ex)01012345555"></td>
					
					<th>이메일</th> <td><input name="reserve_email" placeholder="onlyone@onlyone.com"></td>
					</tr>
				</table>
			</div>
	
	<input type="submit" value="다음단계" class="btn btn-outline-secondary" style="margin: auto;display: block;" >
	
	</form>
	
<script type="text/javascript" defer="defer">
	$(document).ready(function() {
	    
	    <%
	    if(session.getAttribute("member_id") == null){ 
	    %>
	       alert("로그인이 필요한 서비스 입니다.\n로그인을 먼저 진행해 주세요.");
	       location.href="<%=request.getContextPath()%>/login.do";
	    <%
	       }
	    %>
	
	}); 
</script>

</body>
</html>