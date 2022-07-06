<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

.member_info th{
	color: blue;
}
	</style>
</head>
<body>


<c:set var="dto" value="${Reserve }" />
<c:set var="hdto" value="${Hotel }" />


<div class="reserve-travel-cont">
		<jsp:include page="include/top.jsp" />
		
		<div style="margin-top: 50px">
		
		<table border="1" cellspacing="0" width="650" class="table table-striped">
		<h5>패키지 예약정보</h5>
		<tr>
			<th style="width: 30px">No.</th>
			<th style="width: 30px">예약자</th>
			<th style="width: 30px">예약인원</th>
			<th style="width: 150px">탑승자정보</th>
			<th style="width: 30px">토탈금액</th>
		</tr>
		<c:if test="${!empty dto }">
			<c:forEach items="${Reserve }" var="i">
				<tr>
					<td>${i.reserve_num }</td>
					<td>${member_id }</td>

					<td>${i.reserve_count }</td>
					<td>
					<details>
					<summary>탑승자정보</summary>
					<table class="member_info">
					<c:if test="${i.reserve_count == 1 }" >
					<tr>
					<th>이름</th><td>${i.reserve_name_1 }</td>
					<th>나이</th><td>${i.reserve_date_1 }</td>
					<th>이메일</th><td>${i.reserve_email_1 }</td>
					<th>연락처</th><td>${i.reserve_phone_1 }</td>
					<th>성별</th><td>${i.reserve_gender_1 }</td>
					</tr>
					</c:if>
					
					<c:if test="${i.reserve_count == 2 }" >
					<tr>
					<th>이름</th><td>${i.reserve_name_1 }</td>
					<th>나이</th><td>${i.reserve_date_1 }</td>
					<th>이메일</th><td>${i.reserve_email_1 }</td>
					<th>연락처</th><td>${i.reserve_phone_1 }</td>
					<th>성별</th><td>${i.reserve_gender_1 }</td>
					</tr>
					<tr>
					<th>이름</th><td>${i.reserve_name_2 }</td>
					<th>나이</th><td>${i.reserve_date_2 }</td>
					<th>이메일</th><td>${i.reserve_email_2 }</td>
					<th>연락처</th><td>${i.reserve_phone_2 }</td>
					<th>성별</th><td>${i.reserve_gender_2 }</td>
					</tr>
					</c:if>
					
					<c:if test="${i.reserve_count == 3 }" >
										<tr>
					<th>이름</th><td>${i.reserve_name_1 }</td>
					<th>나이</th><td>${i.reserve_date_1 }</td>
					<th>이메일</th><td>${i.reserve_email_1 }</td>
					<th>연락처</th><td>${i.reserve_phone_1 }</td>
					<th>성별</th><td>${i.reserve_gender_1 }</td>
					</tr>
					<tr>
					<th>이름</th><td>${i.reserve_name_2 }</td>
					<th>나이</th><td>${i.reserve_date_2 }</td>
					<th>이메일</th><td>${i.reserve_email_2 }</td>
					<th>연락처</th><td>${i.reserve_phone_2 }</td>
					<th>성별</th><td>${i.reserve_gender_2 }</td>
					</tr>
					<tr>
					<th>이름</th><td>${i.reserve_name_3 }</td>
					<th>나이</th><td>${i.reserve_date_3 }</td>
					<th>이메일</th><td>${i.reserve_email_3 }</td>
					<th>연락처</th><td>${i.reserve_phone_3 }</td>
					<th>성별</th><td>${i.reserve_gender_3 }</td>
					
					</tr>
					</c:if>
					</table>
					</details>
					</td>
					
					<td>${i.price_account }

				</tr>
				
			</c:forEach>
		</c:if>
</table>
</div>
		<table border="1" cellspacing="0" width="650" class="table table-striped">
		<h5>호텔 예약정보</h5>
		<tr>
			<th>No.</th>
			<th>아이디</th>
			<th>인원</th>
			<th>이름</th>
			<th>나이</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>성별</th>
			<th>금액</th>
		</tr>
		
		
		<c:if test="${!empty hdto }">
			<c:forEach items="${Hotel }" var="u">
				<tr>
					<td>${u.reserve_num }</td>
					<td>${member_id }</td>
					<td>${u.reserve_count }</td>
					<td>${u.reserve_name }</td>
					<td>${u.reserve_date }</td>
					<td>${u.reserve_email }</td>
					<td>${u.reserve_phone }</td>
					<td>${u.reserve_gender }</td>
					<td>${u.price_account }</td>
					</tr>
					</c:forEach>
					</c:if>

</table>
</div>

<input type="button" value="홈으로" onclick="location.href='main.do'" class="btn btn-outline-secondary" style="margin: auto;display: block;"><br>

</body>
</html>