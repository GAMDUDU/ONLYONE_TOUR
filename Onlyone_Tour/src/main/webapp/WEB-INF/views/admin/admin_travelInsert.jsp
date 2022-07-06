<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>onlyone 투어</title>
<link rel="stylesheet" type="text/css" href="../resources/css/adminCss/content.css">
<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>

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
<style type="text/css">

.tbl-view input {
	width: 100%
}
.bbs-btn_w{
margin-top:30px; 
text-align:right;
display: flex;
justify-content: center;
}

</style>
</head>
<body>

	<%@include file="adminInclude/admin_top.jsp" %>
	<%@include file="adminInclude/admin_aside.jsp" %>

<form method="post" enctype="multipart/form-data"
action="<%=request.getContextPath() %>/travel_insert_ok.do">

	<div id="content_box">
			
		<div class="member_list">
				<c:set var="cont" value="${Cont}"/>

				
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
				<input type="file" name="imgfile" multiple="multiple"></th>
				</tr>
				
				<tr>
					<th>번호</th> <th>가격</th> <th>스펙</th>
				</tr>
				
					
				<tr>
				<td><!-- <input name="travel_num"> --> </td>
				<td><input name="travel_price" placeholder="ex)650000"> </td>
				<td><input name="travel_spec" placeholder="ex)일반/신규/추천"> </td>
				</tr>
				
				
				
				<tr >
					<th colspan="3">패키지이름</th>
				</tr>
				<tr>
				<td colspan="3"><input name="travel_name" placeholder="ex)[포항특집]울릉도4일#울릉도크루즈"> </td>
				</tr>
				
				<tr >
					<th colspan="4">상세정보</th>
				</tr>
				
				<tr>
					<td colspan="4">
					<textarea rows="5" cols="100" name="travel_cont" style="width: 100%"  placeholder="ex)울릉도 최대규모 카페리 크루즈 타고 보석같은 섬 울릉도여행을 즐겨보세요"></textarea>
					</td>
				</tr>
				<tr>
					<th>출발지</th> <th>출국시간</th> <th>도착지</th> <th>도착시간</th>
				</tr>
				
				<tr>
				<td><input name="travel_departure_airport" placeholder="ex)서울 ICN"></td>
				<td><input name="travel_departure_date"placeholder="ex)2022.07.31(일) 09:00 ~ 2022.07.31(일) 11:40"></td>
				<td><input name="travel_arrival_airport"placeholder="ex)괌 GUM"></td>
				<td><input name="travel_return_date" placeholder="ex)2022.08.04(목) 13:00 ~ 2022.08.04(목) 16:00"></td>
				</tr>
				
				<tr>
					<th>항공사</th> <th>숙소</th> <th>미팅일시</th> <th>미팅장소</th>
				</tr>
				
				<tr>
				<td><input name="travel_air" placeholder="ex)대한항공"></td>
				<td><input name="travel_room" placeholder="ex)호텔앤리조트"></td>
				<td><input name="travel_meeting_time" placeholder="ex)06월 24일 오전 06:45"></td> 
				<td><input name="travel_meeting_loc" placeholder="ex)인천공항 제2여객터미널 3층 출국장"></td>
				</tr>
				
				<tr >
					 <th>일정</th> <td><input name="travel_calender" placeholder="ex)4박 5일"></td>
					 <th>예약현황</th> <td ><input name="travel_reserve_count" placeholder="ex)5"></td>
				</tr>
				</table>
				
				<div class="bbs-btn_w">
					<input type="submit" value="등록" class="btn btn-outline-secondary"> &nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시작성" class="btn btn-outline-secondary">
				</div>
				
				</div>
				</div>
				
				</form>

</body>
</html>