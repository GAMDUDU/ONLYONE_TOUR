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
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">




function dateCheckSubmit(){
	
	var startDate = $("input[name=startDate]").val();
	var endDate = $("input[name=endDate]").val();
	
	if(startDate > endDate){
		swal("검색 시작 날짜와 종료 날짜를 정확히 선택해 주세요.");
		return false;
	} 
	
	document.searchForm.submit();
	
	
}


</script>

<style>
	
#replyImg{
	width: 12px;
	height: 12px;
}
	
.container{
	position: absolute;
	left: 55%;
	top: 60%;
	transform:translate(-50%,-50%);
	padding: 10px;
} 

.text-center{
	width: 50%; 
	float:none; 
	margin:0 auto;
}

.selectBox{
	width: 120px; 
	padding: .3em .3em; 
	border: 1px solid #999;
	font-family: inherit;  
	background: url('./resources/image_service/source/selectArrow.png') no-repeat 95% 50%; 
	border-radius: 2px; 
	-webkit-appearance: none; 
	-moz-appearance: none;
	appearance: none;
}

.selectBox2{
	width: 100px; 
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
	width: 250px; 
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
	
a{
	text-decoration: none;
	color : black; 
	font-weight: bold;
}	

a:hover{
	text-decoration: none;
	color : black; 
}

.tth{
	margin-top: 60px;
}
	
.oneText{
	padding-bottom: 40px;
}	
	


input[type=date]{
	height: 34px; 
	
	
}
	
</style>

<body>

	

	<%@include file="admin/adminInclude/admin_top.jsp" %>

	<%@include file="admin/adminInclude/admin_aside.jsp" %>
	
	<c:set var="list" value="${servList }" />
	<c:set var="paging" value="${Paging }" />
	
	
	
	<div class="container table-responsive" >
		
	<div class="oneText">
		<h4 class="noticeText">1:1문의 관리</h4>
	</div>	
		
		<div class="talbe float-right">
			<form method="post" name="searchForm"
		      action="oneQuestion_search.do">
		   
		   	  <input type="hidden" name="page" value="1">
		   	  
		   	  
		   	  <input type="date" name="startDate" placeholder="기간선택" >
		   	  - <input type="date" name="endDate" placeholder="기간선택" >
		   	  
		   	  
		   	  <select name="reply" class="selectBox">
		   	  	 <option value="all">전체보기</option>		
		   	  	 <option value="확인중">미답변</option>		
		   	  	 <option value="답변완료">답변완료</option>		
		   	  </select>
		   	  
		   	   <select name="service_code" class="selectBox">
		   	  	 <option value="20220001">국내여행</option>		
		   	  	 <option value="20220002">해외여행</option>		
		   	  	 <option value="20220003">결제문의</option>		
		   	  	 <option value="20220004">기타상담</option>		
		   	  </select>
		   	  
		      <select name="field" class="selectBox2">
		         <option value="name">이름</option>
		         <option value="id">아이디</option>
		      </select>
		      
		      <input name="keyword"  class="searchBox">
		      <input type="button" onclick="dateCheckSubmit()" value="검색" class="sButton">
		   </form>
		</div>
		
		<div  class="tth">
			<table class="table table-hover" style="table-layout: fixed">
				<tr>
					<th  width="8%">번호</th><th  width="10%">카테고리</th><th width="35%">제목</th><th width="8%">작성자</th>
					<th>아이디</th><th>답변상태</th><th  width="14%">작성일자</th><th  width="8%">삭제</th>
				</tr>
							
				<c:if test="${!empty list }">
					<c:forEach items="${list}" var="dto">
						
						<tr>
							<td width="8%">${dto.service_num }</td>
							<td  width="10%">${dto.c_name }</td>
							<td width="35%">
								<!-- indent가 0이 아니면 댓글인 경우이다  -->
								<c:if test="${dto.service_indent != 0 }">
									<img id="replyImg" src="./resources/image_service/source/829.png">
								</c:if>
							
								<a href="amdin_oneQuestion_content.do?num=${dto.service_num }&page=${paging.page }">
								${dto.service_title }
								</a>
							</td>
							<td width="8%">${dto.service_name }</td>
							<td>${dto.member_id }</td>
							<td>${dto.service_check }</td>
							<td width="14%">${dto.service_date.substring(0, 15) }</td>
							<td width="8%">
								<input type="button" value="삭 제"  class="btn btn-outline-danger"
									onclick="if(confirm('삭제하시겠습니까?')){
										location.href='admin_oneQuestion_delete.do?num=${dto.service_num }&page=${paging.page }'
									}">	
							</td>
						</tr>
						
						</c:forEach>
					</c:if>
					
					<c:if test="${empty list }">
						 <tr>
			          		 <td colspan="8" align="center">
			         		     <h4>검색된 게시글이 없습니다</h4>
			       		    </td>
			       		 </tr>
					</c:if>
				</table>
			</div>
		
			<div  class="text-center">
				<ul class="pagination">
					<%-- 페이징 처리 부분 --%>
				    <c:if test="${paging.getPage() > paging.getBlock() }">
				       <li class="page-item"><a class="page-link" href="oneQuestion_list.do?page=1">처음으로</a></li>
				       <li class="page-item"><a class="page-link" href="oneQuestion_list.do?page=${paging.getStartBlock() - 1 }">◀</a></li>
				    </c:if>
				   
				    <c:forEach begin="${paging.getStartBlock() }"
				          				end="${paging.getEndBlock() }" var="i">
				       <c:if test="${i == paging.getPage() }">
				          <li class="page-item"><a class="page-link" href="oneQuestion_list.do?page=${i }">${i }</a></li>
				       </c:if>
				   
				  	   	   <c:if test="${i != paging.getPage() }">
				          <li class="page-item"><a class="page-link" href="oneQuestion_list.do?page=${i }">${i }</a></li>
				       </c:if>
				    </c:forEach>
				
				    <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
				       <li class="page-item"><a class="page-link" href="oneQuestion_list.do?page=${paging.getEndBlock() + 1 }">▶</a></li>
				       <li class="page-item"><a class="page-link" href="oneQuestion_list.do?page=${paging.getAllPage() }">마지막으로</a></li>
				    </c:if>
				</ul>	    
			</div>
		
	</div>		
	
</body>
</html>