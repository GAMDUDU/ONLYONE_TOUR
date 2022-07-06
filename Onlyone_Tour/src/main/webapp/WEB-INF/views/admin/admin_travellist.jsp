<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
<style type="text/css">

	.member_list{
	/* 	position: absolute;
		left: 58%;
		top: 40%;
		transform:translate(-50%,-50%);
		text-align: center;
		padding: 10px;
		margin-top: 100px; */
		margin-left: 730px;
	}
	
	.travel_paging{
		display:flex;
		justify-content: center;
		align-items: center;
		position: absolute;
		left: 55%;
		top: 90%;
		transform:translate(-50%,-50%);
	}
	
	.travel_paging a{
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
		border-bottom: 1px solid black;
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
				<c:set var="list" value="${List}"/>
				<c:set var="paging" value="${Paging}"/>
				<c:set var="total" value="${total}"/>
				
				
				<table cellspacing="0" cellpadding="15" width="1000" class="table_main">
				<tr class="first_tr">
					<th>패키지번호</th> <th>패키지이름</th>
					<th>패키지가격</th> <th>패키지일정</th> <th>항공사</th>
					<th>회원탈퇴</th>
				</tr>
				
				
				<c:if test="${!empty list}">
					<c:forEach items="${list }" var="u">
						<tr class="second_tr">
							<td>${u.travel_num }</td>
							<td>
							<a href="<%=request.getContextPath() %>/travel_content.do?num=${u.travel_num}">
							${u.travel_name }</a></td>
							
							<td>${u.travel_price }</td>
							<td>${u.travel_calender }</td>
							<td>${u.travel_air }</td>
							
							
						
					 		<td><button type="button" 
								onclick="if(confirm('정말로 삭제하시겠습니까?')){
									location.href='travel_delete.do?num=${u.travel_num}&page=${paging.getPage()}'
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
				
			</table>
		
			
			<br>
			
			
			<!-- 페이징 처리 부분 -->
			<div class="travel_paging" style="margin-top: -60px">
				<c:if test="${paging.getPage() > paging.getBlock()}">
					<a href="admin_travel_list.do?page=1">처음으로</a>
					<a href="admin_travel_list.do?page=${paging.getStartBlock() - 1}">◀</a>
				</c:if>
				
				<c:forEach begin="${paging.getStartBlock() }"
					end="${paging.getEndBlock() }" var="i">
					
					<c:if test="${i == paging.getPage() }">
						<b><a href="admin_travel_list.do?page=${i}" class="page-link">${i}</a></b>
					</c:if>
					
					<c:if test="${i != paging.getPage() }">
						<a href="admin_travel_list.do?page=${i}" >${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${paging.getEndBlock() < paging.getAllPage()}">
					<a href="admin_travel_list.do?page=${paging.getEndBlock() + 1}">▶</a>
					<a href="admin_travel_list.do?page=${paging.getAllPage()}">마지막으로</a>
				</c:if>
			</div>
			
					<tr>
			<td colspan="4" align="right">
				<input type="button" value="패키지 등록" class="btn btn-outline-secondary"
				 onclick="location.href='travel_insert.do'" style="display: block;">
			</td>
		</tr>
		</div>
	</div>

</body>
</html>