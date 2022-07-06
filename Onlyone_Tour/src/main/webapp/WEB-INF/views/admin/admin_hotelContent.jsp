<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="../resources/css/adminCss/content.css">

<style type="text/css">

	.member_list{
	/* 	position: fixed;
		left: 58%;
		top: 400px;
		transform:translate(-50%,-50%);
		text-align: center;
		padding: 10px;
		margin-top: 240px; */
		margin-left: 430px;
	}
	
	.member_paging{
		display:flex;
		justify-content: center;
		align-items: center;
		position: absolute;
		left: 55%;
		top: 90%;
		transform:translate(-50%,-50%);
	}
	
	.member_paging a{
		margin-left: 10px;
		text-decoration: none;
		color: white;
		background: #1895A3;
		border-radius: 3px;
		padding: 9px;
		
	}
	
	.member_list button{
		background: none;
		border: 1px solid gray;
		padding: 5px;
		border-radius: 3px;
		cursor: pointer;
		
	}
	
	.first_tr{
		background: #839ACC;
	}
	
	.table_main td{
		border: 1px solid #839ACC;
	}
	
	.total_member{
		margin-bottom: 40px;
		padding: 20px;
		background: #EBE9F3;
		border-radius: 5px;
		color: #807C7C;
		font-weight: bold;
		font-size: 25px;
	}
	
</style>
<body>

	<%@include file="adminInclude/admin_top.jsp" %>
	<%@include file="adminInclude/admin_aside.jsp" %>
	
	
	<div id="content_box">
			
		<div class="member_list">
				<c:set var="cont" value="${Cont}"/>
			

				
				<table cellspacing="0" cellpadding="15" width="1000" class="table_main">

			
				<tr>
				<th rowspan="5" style="width: 301px;padding: 0;">
				<img src="<%=request.getContextPath() %>/resources/image_hotel/${cont.hotel_image}" width="300" height="250">
				</th>
				</tr>
				
				<tr class="first_tr">
					<th>번호</th> <th>이름</th> <th>name</th>
				</tr>
				
					
				<tr class="second_tr">
				<td>${cont.hotel_num }</td> <td>${cont.hotel_hname }</td> <td>${cont.hotel_ename }</td>
				</tr>
				
				
				
				<tr class="first_tr" >
					<th colspan="3">상세정보</th>
				</tr>
				<tr class="second_tr">
				<td colspan="3">${cont.hotel_exp }</td>
				</tr>
				


				
				<table cellspacing="0" cellpadding="15" width="1000" class="table_main">
				<tr class="first_tr">
					<th>국내·해외</th> <th>객실1</th> <th>객실2</th> <th>객실3</th>
				</tr>
				
				<tr class="second_tr">
				<td>${cont.hotel_country }</td>
				<td>${cont.hotel_room1 }</td>
				<td>${cont.hotel_room2 }</td>
				<td>${cont.hotel_room3 }</td>
				</tr>
				
				<tr class="first_tr">
					<th>숙소위치</th> <th>객실1가격</th> <th>객실2가격</th> <th>객실3가격</th>
				</tr>
				
				<tr class="second_tr">
				<td>${cont.hotel_loc}</td>
				<td>${cont.hotel_price1}</td>
				<td>${cont.hotel_price2}</td> 
				<td>${cont.hotel_price3}</td>
				</tr>
				
				<tr class="first_tr">
					<th>연락처</th> <th>체크인시간</th> <th>체크아웃시간</th> <th>편의부대시설</th>
				</tr>
				
				<tr class="second_tr">
				<td>${cont.hotel_phone}</td>
				<td>${cont.hotel_chkin}</td>
				<td>${cont.hotel_chkout}</td> 
				<td>${cont.hotel_add}</td>
				</tr>

				
			</table>
		
		</div>
		</div>

</body>
</html>