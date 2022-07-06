<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
action="<%=request.getContextPath() %>/hotel_insert_ok.do">

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
				</th>
				</tr>
				
				<tr>
					<th>번호</th> <th>이름</th> <th>name</th>
				</tr>
				
					
				<tr>
				<td></td>
				<td>${cont.hotel_hname }<input name="hotel_hname" placeholder="ex)한글 이름을 적어주세요"></td>
				<td>${cont.hotel_ename }<input name="hotel_ename" placeholder="ex)eng plz:)"></td>
				</tr>
				
				
				
				<tr>
					<th colspan="3">상세정보</th>
				</tr>
				<tr>
				<td colspan="3">
				<textarea rows="5" cols="70" name="hotel_exp"  style="width: 100%" placeholder="ex)상세 설명을 적어주세요"></textarea>
				</td>
				</tr>

				
				<tr>
					<th>국내·해외</th> <th>객실1</th> <th>객실2</th> <th>객실3</th>
				</tr>
				
				<tr>
				<td><input name="hotel_country" placeholder="ex)국내"></td>
				<td><input name="hotel_room1" placeholder="ex)퀸"></td>
				<td><input name="hotel_room2" placeholder="ex)마운틴"></td>
				<td><input name="hotel_room3" placeholder="ex)오션"></td>
				</tr>
				
				<tr>
					<th>숙소위치</th> <th>객실1가격</th> <th>객실2가격</th> <th>객실3가격</th>
				</tr>
				
				<tr>
				<td><input name="hotel_loc" placeholder="ex)서울시 중랑구"></td>
				<td><input name="hotel_price1" placeholder="ex)38000"></td>
				<td><input name="hotel_price2" placeholder="ex)45000"></td> 
				<td><input name="hotel_price3" placeholder="ex)52000"></td>
				</tr>
				
				<tr>
					<th>연락처</th> <th>체크인시간</th> <th>체크아웃시간</th> <th>편의부대시설</th>
				</tr>
				
				<tr>
				<td><input name="hotel_phone" placeholder="ex)010-1234-5678"></td>
				<td><input name="hotel_chkin" placeholder="ex)15:00 PM"></td>
				<td><input name="hotel_chkout" placeholder="ex)11:00 PM"></td> 
				<td><input name="hotel_add" placeholder="ex)피트니스"></td>
				</tr>

				
			</table>
				<div class="bbs-btn_w">
					<input type="submit" value="등록" class="btn btn-outline-secondary">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시작성" class="btn btn-outline-secondary">
				
				</div>
				</div>
				</div>
				
				</form>

</body>

</body>
</html>