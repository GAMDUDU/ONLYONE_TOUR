<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<style>

.container2{
	position: absolute;
	left: 57%;
	top: 60%;
	transform:translate(-50%,-50%);
	padding: 10px;
	width: 900px;
	padding-bottom: 100px;
	margin-top: 10px;
} 

.foooooooter{
	
	position: absolute;
	top: 80%;
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
	
.searchBox{
	width: 300px; 
	padding: .3em .3em; 
	border: 1px solid #999;
	font-family: inherit;  
	border-radius: 2px; 
	-webkit-appearance: none; 
	-moz-appearance: none;
	appearance: none;
}
	
.sButton{
	width: 80px; 
	padding: .3em .3em; 
	border: 1px solid #999;
	font-family: inherit;  
	border-radius: 2px; 
	-webkit-appearance: none; 
	-moz-appearance: none;
	appearance: none;
}
	
.sButton:focus {
	outline:0;

}
.sButton:hover{
	background: #d5d5d5;
	cursor: pointer;
	
}
.noticeText{
	position: absolute;
	float:left;
	
	
}

.text-center{
	width: 50%; 
	float:none; 
	margin : 50px auto;
	padding-bottom: 50px;
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

.tth{
	margin-top: 60px;
}
</style>

<body>
	<jsp:include page="include/top.jsp" />
	<%@include file="./include/service_oneQSidebar.jsp" %>

	
	<c:set var="list" value="${List }" />
	<c:set var="paging" value="${Paging }" />
	
	
	<div class="container2 table-responsive" >
		
		<h4 class="noticeText">공지사항</h4>
		
		<div class="talbe float-right">
			<form method="post" action="<%=request.getContextPath() %>/user_notice_search.do">
				
				<input type="hidden" name="page" value="1">
				
				<select name="field" class="selectBox">
					<option value="n_num">글번호</option>
					<option value="n_title">제목</option>
					<option value="n_cont">내용</option>
				</select>
				
				<input name="keyword" class="searchBox">	
				<input type="submit" value="검색" class="sButton">
			
			</form>
		</div>
		
		<div class="tth">
			<table class="table table-hover" style="table-layout: fixed">	
				<tr>
					<th width="8%">번호</th><th width="40%">제목</th><th width="20%">작성자</th>
					<th width="10%">조회수</th><th width="20%">날짜</th>
				</tr>
				
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="i">
						<tr>
							
							<td width="8%">${i.n_num }</td>
							
							<td width="40%"> 
								<a href="<%=request.getContextPath() %>/user_notice_content.do?num=${i.n_num }&page=${paging.page }">
									${i.n_title }
								</a>	
							</td>
						
							<td width="20%">${i.n_name }</td>
						
							<td width="10%">${i.n_view }</td>
						
							<td width="20%">${i.n_date.substring(0, 10) }</td>
							
						</tr>
						
					</c:forEach>
				
				</c:if>
				
				<c:if test="${empty list }">
					 <tr>
		          		 <td colspan="5" align="center">
		         		     <h3>공지사항 목록이 없습니다.....</h3>
		       		    </td>
		       		 </tr>
				</c:if>
			</table>
			
		</div>
		
		<div class="text-center">
			<ul class="pagination">
				<%-- 페이징 처리 부분 --%>
			    <c:if test="${paging.getPage() > paging.getBlock() }">
			       <li class="page-item"><a class="page-link" href="user_notice_list.do?page=1">처음으로</a></li>
			       <li class="page-item"><a class="page-link" href="user_notice_list.do?page=${paging.getStartBlock() - 1 }">◀</a></li>
			    </c:if>
			   
			    <c:forEach begin="${paging.getStartBlock() }"
			          				end="${paging.getEndBlock() }" var="i">
			       <c:if test="${i == paging.getPage() }">
			          <li class="page-item"><a class="page-link" href="user_notice_list.do?page=${i }">${i }</a></li>
			       </c:if>
			   
			  	   <c:if test="${i != paging.getPage() }">
			          <li class="page-item"><a class="page-link" href="user_notice_list.do?page=${i }">${i }</a></li>
			       </c:if>
			    </c:forEach>
			
			    <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
			       <li class="page-item"><a class="page-link" href="user_notice_list.do?page=${paging.getEndBlock() + 1 }">▶</a></li>
			       <li class="page-item"><a class="page-link" href="user_notice_list.do?page=${paging.getAllPage() }">마지막으로</a></li>
			    </c:if>
		    </ul>
		</div>
	</div>
	
	<div class="foooooooter">
		<jsp:include page="include/footer.jsp" />
	</div>
	
</body>
</html>