<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<style type="text/css">

.container2{
	margin-top : 100px;
	margin-left : 300px;
	position: relative;
	width : 40%;
	padding: 10px;
	
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

.foooooooter{
	
	position: relative;
	bottom : 0;
}

</style>




<body>
	
	<jsp:include page="include/top.jsp" />
	<%@include file="./include/service_oneQSidebar.jsp" %>
	
	<div class="container2" >
		<h4 class="noticeText"> 공지사항</h4>
		<c:set var="dto" value="${Cont }" />
		<table  class="table" >
			<tr>
				<th>번호</th>
				<td><input name="n_num" value="${dto.n_num }" readonly="readonly" ></td>
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
				<th>조회수</th>
				<td>${dto.n_view }</td>
			</tr>
			
			<tr>
				<th>작성일</th>
				<td>${dto.n_date }</td>
			</tr>
			
			<tr>
				<td>
					<a class="btn float-right "><input type="button" value="목록으로"  class="btn btn-success btn-block"
						onclick="location.href='user_notice_list.do?page=${Page }'">
					</a>
				</td>
			</tr>	
		</table>
		
	</div>
	
	<div class="foooooooter">
	
		<jsp:include page="include/footer.jsp" />
	</div>
</body>
</html>