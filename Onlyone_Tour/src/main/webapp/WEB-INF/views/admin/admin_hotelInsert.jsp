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
<style type="text/css">

	.member_list{
		/* position: absolute;
		left: 58%;
		top: 40%;
		transform:translate(-50%,-50%);
		text-align: center;
		padding: 10px;
		margin-top: 250px; */
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
	
	<form method="post" enctype="multipart/form-data"
action="<%=request.getContextPath() %>/hotel_insert_ok.do">

	<div id="content_box">
			
		<div class="member_list">
				<c:set var="cont" value="${Cont}"/>

					<table cellspacing="0" cellpadding="15" width="1000" class="table_main">

			
				<tr>
				<th rowspan="5" style="width: 300px">
				<input type="file" name="imgfile" multiple="multiple"></th>
				</th>
				</tr>
				
				<tr class="first_tr">
					<th>번호</th> <th>이름</th> <th>name</th>
				</tr>
				
					
				<tr class="second_tr">
				<td></td>
				<td>${cont.hotel_hname }<input name="hotel_hname"></td>
				<td>${cont.hotel_ename }<input name="hotel_ename"></td>
				</tr>
				
				
				
				<tr class="first_tr" >
					<th colspan="3">상세정보</th>
				</tr>
				<tr class="second_tr">
				<td colspan="3">
				<textarea rows="5" cols="70" name="hotel_exp"></textarea>
				</td>
				</tr>
				


				
				<table cellspacing="0" cellpadding="15" width="1000" class="table_main">
				<tr class="first_tr">
					<th>국내·해외</th> <th>객실1</th> <th>객실2</th> <th>객실3</th>
				</tr>
				
				<tr class="second_tr">
				<td><input name="hotel_country"></td>
				<td><input name="hotel_room1"></td>
				<td><input name="hotel_room2"></td>
				<td><input name="hotel_room3"></td>
				</tr>
				
				<tr class="first_tr">
					<th>숙소위치</th> <th>객실1가격</th> <th>객실2가격</th> <th>객실3가격</th>
				</tr>
				
				<tr class="second_tr">
				<td><input name="hotel_loc"></td>
				<td><input name="hotel_price1"></td>
				<td><input name="hotel_price2"></td> 
				<td><input name="hotel_price3"></td>
				</tr>
				
				<tr class="first_tr">
					<th>연락처</th> <th>체크인시간</th> <th>체크아웃시간</th> <th>편의부대시설</th>
				</tr>
				
				<tr class="second_tr">
				<td><input name="hotel_phone"></td>
				<td><input name="hotel_chkin"></td>
				<td><input name="hotel_chkout"></td> 
				<td><input name="hotel_add"></td>
				</tr>

				
			</table>
				
				<tr>
					<td colspan="4" align="center">
					<input type="submit" value="등록" class="btn btn-outline-secondary">&nbsp;&nbsp;&nbsp;
					<input type="reset" value="다시작성" class="btn btn-outline-secondary">
				</tr>
				
				</table>
				</div>
				</div>
				
				</form>

</body>

</body>
</html>