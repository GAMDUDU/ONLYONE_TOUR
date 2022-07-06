<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/adminCss/content.css">

<style type="text/css">

	.member_list{
/* 		position: fixed;
		left: 58%;
		top: 400px;
		transform:translate(-50%,-50%);
		text-align: center;
		padding: 10px;
		margin-top:240px; */
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
</head>
<body>

	<%@include file="adminInclude/admin_top.jsp" %>
	<%@include file="adminInclude/admin_aside.jsp" %>
	
	
	<div id="content_box">
			
		<div class="member_list">
				<c:set var="cont" value="${Cont}"/>

				
				<table cellspacing="0" cellpadding="15" width="1000" class="table_main">

			
				<tr>
				<th rowspan="5" style="width: 301px;padding: 0;">
				<img src="<%=request.getContextPath() %>/resources/image_package/${cont.travel_image}" width="300" height="250">
				</th>
				</tr>
				
				<tr class="first_tr">
					<th>번호</th> <th>가격</th> <th>스펙</th>
				</tr>
				
					
				<tr class="second_tr">
				<td>${cont.travel_num }</td> <td>${cont.travel_price }</td> <td>${cont.travel_spec }</td>
				</tr>
				
				
				
				<tr class="first_tr" >
					<th colspan="3">패키지이름</th>
				</tr>
				<tr class="second_tr">
				<td colspan="3">${cont.travel_name }</td>
				</tr>
				
				<tr class="first_tr" >
					<th colspan="4">상세정보</th>
				</tr>
				
				<tr>
					<td colspan="4">${cont.travel_cont }</td>
				</tr>
				
					</table>
				
				<table cellspacing="0" cellpadding="15" width="1000" class="table_main">
				<tr class="first_tr">
					<th>출발지</th> <th>출국시간</th> <th>도착지</th> <th>도착시간</th>
				</tr>
				
				<tr class="second_tr">
				<td>${cont.travel_departure_airport }</td>
				<td>${cont.travel_departure_date }</td>
				<td>${cont.travel_arrival_airport }</td>
				<td>${cont.travel_return_date }</td>
				</tr>
				
				<tr class="first_tr">
					<th>항공사</th> <th>숙소</th> <th>미팅일시</th> <th>미팅장소</th>
				</tr>
				
				<tr class="second_tr">
				<td>${cont.travel_air}</td>
				<td>${cont.travel_room}</td>
				<td>${cont.travel_meeting_time}</td> 
				<td>${cont.travel_meeting_loc}</td>
				</tr>
				
				<tr >
					 <th class="first_tr">일정</th> <td class="second_tr">${cont.travel_calender}</td>
					 <th class="first_tr">예약현황</th> <td class="second_tr">${cont.travel_reserve_count}</td>
				</tr>
				
				
		
				
				
						
			
							
						
				
				
				
			
				
			</table>
		
		</div>
		</div>
		

</body>
</html>