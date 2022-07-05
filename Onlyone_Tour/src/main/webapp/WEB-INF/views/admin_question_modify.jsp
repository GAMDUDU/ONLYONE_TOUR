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
	margin-top : 450px;
	
	position: relative;
	left: 30%;
	top: 50%;
	transform:translate(-50%,-50%);
	
} 

.noticeText{
	position: relative;
	float:left;
	
}



.selectBox{
	width: 150px; 
	padding: .3em .3em; 
	border: 1px solid #999;
	font-family: inherit;  
	background: url('./resources/image_service/source/selectArrow.png') no-repeat 95% 50%; 
	border-radius: 2px; 
	-webkit-appearance: none; 
	-moz-appearance: none;
	appearance: none;
}
	

</style>
</head>
<body>
	<%@include file="admin/adminInclude/admin_top.jsp" %>

	<%@include file="admin/adminInclude/admin_aside.jsp" %>

	<div class="container">
	<h4 class="noticeText">자주 찾는 질문 관리</h4>
		<c:set var="dto" value="${Cont }" />
		<form method="post"
			action="<%=request.getContextPath() %>/admin_question_modifyOk.do">
			
			
			<input type="hidden" name="q_num" value="${dto.q_num }">
			<input type="hidden" name="page" value="${Page }">
			<table class="table" style="table-layout: fixed">
				<tr>
					<th width="15%">공개여부</th>
					<td>
						<select name="q_oc">
							<option value="공개">공개</option>
							<option value="비공개">비공개</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th width="15%" >질문</th>
					<td><input name="q_title" value="${dto.q_title }" ></td>	
				</tr>
				
				<tr>
					<th width="15%">답변</th>
					<td><textarea rows="20" cols="100" name="q_cont" >${dto.q_cont }</textarea></td>
				</tr>
			
				<tr>
					<td colspan="2">
						<a class="btn float-right "><input type="submit" value="작성완료" class="btn btn-success btn-block">
						</a>
						<a class="btn float-right "><input type="button" value="뒤로가기" class="btn btn-outline-success btn-block" 
							onclick="history.back()">
						</a>
					</td>
				</tr>
			</table>
		
		</form>
	</div>
</body>
</html>