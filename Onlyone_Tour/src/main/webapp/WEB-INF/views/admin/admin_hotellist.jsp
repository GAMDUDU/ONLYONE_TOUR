<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
<link rel="stylesheet" type="text/css" href="/resources/css/adminCss/add.css">


</head>
<body>
	<%@include file="adminInclude/admin_top.jsp" %>
	<%@include file="adminInclude/admin_aside.jsp" %>
	
		
	<div id="content_box">
			
		<div>
				<c:set var="list" value="${List}"/>
				<c:set var="paging" value="${Paging}"/>
				<c:set var="total" value="${total}"/>
				
				<table class="tbl-st1">
				<thead>
				<tr>
					<th>숙소 번호</th> <th>숙소이름</th>
					<th>지역</th> <th>지역</th> <th>삭제</th>
				</tr>
				</thead>
				
				<tbody>
				<c:if test="${!empty list}">
					<c:forEach items="${list }" var="u">
						<tr class="second_tr">
							<td>${u.hotel_num }</td>
			<td>
							<a href="<%=request.getContextPath() %>/hotel_content.do?num=${u.hotel_num}">
							${u.hotel_hname }</a></td>
							
							<td>${u.hotel_country }</td>
							<td>${u.hotel_loc }</td>
						
					 		<td><button type="button" 
								onclick="if(confirm('정말로 삭제하시겠습니까?')){
									location.href='hotel_delete.do?num=${u.hotel_num}&page=${paging.getPage()}'
								}else{return;}"><i class="fa-solid fa-trash-can fa-lg"></i></button>
							</td>  
						
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty list }">
					<tr> 
						<td colspan="5" align="center">
							<h3>전체 게시물 목록이 없습니다......</h3>
						</td>
					</tr>
				</c:if>			
				</tbody>
			</table>
		
			
			<br>
			
			
			<!-- 페이징 처리 부분 -->
			<div class="travel_paging">
				<c:if test="${paging.getPage() > paging.getBlock()}">
					<a href="admin_hotel_list.do?page=1">처음으로</a>
					<a href="admin_hotel_list.do?page=${paging.getStartBlock() - 1}">◀</a>
				</c:if>
				
				<c:forEach begin="${paging.getStartBlock() }"
					end="${paging.getEndBlock() }" var="i">
					
					<c:if test="${i == paging.getPage() }">
						<b><a href="admin_hotel_list.do?page=${i}">${i}</a></b>
					</c:if>
					
					<c:if test="${i != paging.getPage() }">
						<a href="admin_hotel_list.do?page=${i}">${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${paging.getEndBlock() < paging.getAllPage()}">
					<a href="admin_hotel_list.do?page=${paging.getEndBlock() + 1}">▶</a>
					<a href="admin_hotel_list.do?page=${paging.getAllPage()}">마지막으로</a>
				</c:if>
			</div>
			<div  class="bbs-btn_w">
				<input type="button" value="호텔/숙소 등록" class="btn btn-outline-secondary"
				 onclick="location.href='hotel_insert.do'"  >
			</div>
		</div>
	</div>

</body>
</html>