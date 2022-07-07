<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">


<style>
.container{
	margin-top : 525px;
	width : 1000px;
	position: relative;
	left: 30%;
	top: 50%;
	transform:translate(-50%,-50%);
	padding: 10px;
} 

.noticeText{
	position: relative;
	float:left;
	
}

input{
	width : 600px;
	border : none;
	
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
	
	<c:set value="${content }" var="c" />
	<c:set value="${Page }" var="page" />
	<c:set value="${fileList }" var="file"/>
	<div class="container" >
		<h4 class="noticeText">1:1 문의 관리</h4>
		<table  class="table" style="table-layout: fixed">
			<tr>
				<th width="15%">번호</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_num }"> </td>
			</tr>
			
			<tr>
				<th width="15%">답변상태</th>
				<td><input name="service_check" readonly="readonly" value="${c.service_check}" ></td>
			</tr>
			
			<tr>
				<th width="15%">카테고리</th>
				<td><input name="service_code" readonly="readonly" value="${c.c_name }"></td>
			</tr>
			
			<tr>
				<th width="15%">아이디</th>
				<td><input name="service_id" readonly="readonly" value="${c.member_id }"></td>
			</tr>
			<tr>
				<th width="15%">작성자</th>
				<td><input name="service_name" readonly="readonly" value="${c.service_name }"></td>
			</tr>
			
			<tr>
				<th width="15%">제목</th>
				<td><input name="service_title" readonly="readonly" value="${c.service_title }"></td>
			</tr>
			
			<tr>
				<th width="15%">내용</th>
				<td><textarea rows="15" cols="100" name="service_cont" readonly="readonly">${c.service_cont }</textarea></td>
			</tr>
			
			<tr>
				<th width="15%">첨부파일</th>
				<td>
					<c:if test="${empty file }">
						첨부파일이 없습니다.
					</c:if>
				
					<c:if test="${!empty file }">
						<c:forEach items="${file }" var="f">
							<input type="hidden" name="paths" value="${f.file_path }">
							<a href="<%=request.getContextPath() %>/fileDownload.do?no=${f.file_no }">
								${f.file_name }
							</a>
							<br/>
						</c:forEach>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<th width="15%">작성일자</th>
				<td><input name="service_date" readonly="readonly" value="${c.service_date }"></td>
			</tr>
			
			<tr>
				<th width="15%">조회수</th>
				<td><input name="service_view" readonly="readonly" value="${c.service_view }"></td>
			</tr>
			
		</table>
		<div>
			<a class="btn float-right ">
			<input type="button" value="답변하기" class="btn btn-success btn-block"
				onclick="location.href='admin_oneQuestion_reply.do?num=${c.service_num}&page=${Page }'">
			</a>
			
			<a class="btn float-right ">
			<input type="button" value="목록으로" class="btn btn-outline-success btn-block"
				onclick="history.back()">
			</a>	
		</div>	
	</div>
		
</body>
</html>