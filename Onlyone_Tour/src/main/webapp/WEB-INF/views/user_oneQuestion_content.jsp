<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">

.container2{
	margin-top : 100px;
	margin-left : 300px;
	position: relative;
	width : 80%;
	padding: 10px;
	
} 

.noticeText{
	position: relative;
	float:left;
	
}

input{
	
	border:0px;
}

.table tr th{
	width: 10%;
}

.table tr td{
	width: 50%;
}

textarea{
	border: 0;
}

.foooooooter{
	
	position: relative;
	margin-top: 10%;
	bottom : 0;
}
a{
	text-decoration: none;
	color : black; 
	font-weight: bold;
}	

a:hover{
	text-decoration: none;
	color : #9046cf; 
}
</style>

<body>
	<jsp:include page="include/top.jsp" />
	<%@include file="./include/service_oneQSidebar.jsp" %>
	
	
	<c:set value="${content }" var="c" />
	<c:set value="${Page }" var="page" />
	<c:set value="${fileList }" var="file"/>
	<div div class="container2">
		<h4 class="noticeText"> 내 문의 내역</h4>
		<table class="table" >
			<tr>
				<th>번호</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_num }"> </td>
			</tr>
			
			<tr>
				<th>답변상태</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_check}" ></td>
			</tr>
			
			<tr>
				<th>카테고리</th>
				<td><input name="service_num" readonly="readonly" value="${c.c_name }"></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_title }"></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_title }"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="100" name="service_cont" readonly="readonly">${c.service_cont }</textarea></td>
			</tr>
			
			<tr>
				<th>첨부파일</th>
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
				<th>작성일자</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_date }"></td>
			</tr>
			
			<tr>
				<th>조회수</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_view }"></td>
			</tr>
			
		</table>
	</div>
	<div>
		
		<a class="btn float-right "> <input type="button" value="목록으로" class="btn btn-success btn-block"
			onclick="history.back()">
		</a>
	</div>	
		
	<div class="foooooooter">
	
		<jsp:include page="include/footer.jsp" />
	</div>
		
</body>
</html>