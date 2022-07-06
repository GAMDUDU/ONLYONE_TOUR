<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.member_list button{
	background: none;
	border: 1px solid gray;
	padding: 5px;
	border-radius: 3px;
	cursor: pointer;
}
.first_tr{background: #839ACC;}
.table_main td{border: 1px solid #839ACC;}
.total_member{
	margin-bottom: 40px;
	padding: 20px;
	background: #EBE9F3;
	border-radius: 5px;
	color: #807C7C;
	font-weight: bold;
	font-size: 25px;
}

/* 추가 소스 */
#content_box{position:relative; padding: 0 50px 0 250px}/* 필수 */

.tbl-st1{border-top:1px solid #000; position:relative; text-align:center; border-collspace:collapse; border-spacing:0; width:100%}
.tbl-st1:before{position:absolute; left:0; top:0; width:1px; background:#fff; content:''}
.tbl-st1 th,.tbl-st1 td{text-align:center; padding:15px; 5px;}
.tbl-st1 th{border-bottom:1px solid #777}
.tbl-st1 td{border-bottom:1px solid #ccc}
.tbl-st1 .tit{text-align:left}
.tbl-st1 a{color:inherit; text-decoration:none}
.tbl-st1 tr:hover{background:#f1f1f1}
.tbl-st1 a:hover{text-decoration: underline}

.no_data{padding:150px 0}

.travel_paging{text-align: center; margin-top:40px}
.travel_paging a{
	margin: 0 5px;
	text-decoration: none;
	color: #333;
	border-radius: 3px;
	padding: 5px 10px;
	display: inline-block
}
.travel_paging .page-link{background: #1895A3; color: #fff}

.bbs-btn_w{margin-top:30px; text-align:right}
.tbl-view{table-layout:fixed; position:relative; text-align:center; border-collspace:collapse; border-spacing:0; width:100%}
.tbl-view th,.tbl-view td{padding: 15px 10px; border-bottom:1px solid #ccc;}
.tbl-view .img{display: block; margin:0 auto; width:100%; height:auto !important}
</style>
</head>
<body>

	<%@include file="adminInclude/admin_top.jsp" %>
	<%@include file="adminInclude/admin_aside.jsp" %>
	
	
	<div id="content_box">
			
		<div class="member_list">
				<c:set var="cont" value="${Cont}"/>
				<!-- <table cellspacing="0" cellpadding="15" width="1000" class="table_main"> -->
				<table class="tbl-view">
				<colgroup>
					<col style="width:25%">
					<col style="width:25%">
					<col style="width:25%">
					<col style="width:25%">
				</colgroup> 
				<tbody>
					<tr>
						<th rowspan="5">
							<img src="<%=request.getContextPath() %>/resources/image_package/${cont.travel_image}" style="max-width:300px;" class="img">
						</th>
					</tr>
					<tr>
						<th>번호</th>
						<th>가격</th>
						<th>스펙</th>
					</tr>
					<tr>
						<td>${cont.travel_num }</td> <td>${cont.travel_price }</td> <td>${cont.travel_spec }</td>
					</tr>
					<tr>
						<th colspan="3">패키지이름</th>
					</tr>
					<tr>
						<td colspan="3">${cont.travel_name }</td>
					</tr>
					<tr >
						<th colspan="4">상세정보</th>
					</tr>
					<tr>
						<td colspan="4">${cont.travel_cont }</td>
					</tr>
					<tr>
						<th>출발지</th>
						<th>출국시간</th>
						<th>도착지</th>
						<th>도착시간</th>
					</tr>
					<tr>
						<td>${cont.travel_departure_airport }</td>
						<td>${cont.travel_departure_date }</td>
						<td>${cont.travel_arrival_airport }</td>
						<td>${cont.travel_return_date }</td>
					</tr>
					<tr >
						<th>항공사</th> <th>숙소</th> <th>미팅일시</th> <th>미팅장소</th>
					</tr>
					<tr >
						<td>${cont.travel_air}</td>
						<td>${cont.travel_room}</td>
						<td>${cont.travel_meeting_time}</td> 
						<td>${cont.travel_meeting_loc}</td>
					</tr>
					<tr>
					 <th>일정</th>
					 <td>${cont.travel_calender}</td>
					 <th>예약현황</th>
					 <td >${cont.travel_reserve_count}</td>
					</tr>
				</tbody>
			</table>
		
		</div>
		</div>
		

</body>
</html>