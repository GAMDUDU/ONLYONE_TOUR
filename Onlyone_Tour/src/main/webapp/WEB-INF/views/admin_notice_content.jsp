<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">

.container{
	margin-top : 300px;
	position: absolute;
	left: 55%;
	top: 50%;
	transform:translate(-50%,-50%);
	padding: 10px;
} 

.noticeText{
	position: relative;
	float:left;
	
}

input{
	
	border:0px;
}

textarea {
	border : 0;
}

</style>

</head>
<body>

	<%@include file="admin/adminInclude/admin_top.jsp" %>

	<%@include file="admin/adminInclude/admin_aside.jsp" %>
	
	<div class="container table-responsive" >
		<h4 class="noticeText"> 공지사항</h4>
		<c:set var="dto" value="${Cont }" />
		<c:set var="page" value="${Page }" />
		<table class="table" style="table-layout: fixed">
			<tr>
				<th class="col-md-2">번호</th>
				<td><input name="n_num" value="${dto.n_num }" readonly="readonly" ></td>
			</tr>
			
			<tr>
				<th>공개여부</th>
				<td>${dto.n_oc }</td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td><input name="n_name" value="${dto.n_name }" readonly="readonly" ></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input name="n_title" value="${dto.n_title }" readonly="readonly" ></td>	
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="20" cols="100" name="n_cont" readonly="readonly">${dto.n_cont }</textarea></td>
			</tr>
			
			<tr>
				<th>작성일</th>
				<td>${dto.n_date }</td>
			</tr>
			
			<tr>
				<td colspan="2">
					<a class="btn float-right "><input type="button" value="수정하기"  class="btn btn-success btn-block"
						onclick="location.href='admin_notice_modify.do?num=${dto.n_num}&page=${Page }'">
					</a>	
					<a class="btn float-right "><input type="button" value="목록으로" class="btn btn-outline-success btn-block"
						onclick="history.back()">
					</a>
				</td>
			</tr>
		</table>
		
	</div>
	
</body>
</html>