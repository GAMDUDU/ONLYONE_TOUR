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
.container{
	position: absolute;
	left: 55%;
	top: 65%;
	transform:translate(-50%,-50%);
	padding: 10px;
} 

.text-center{
	width: 50%; 
	float:none; 
	margin:0 auto
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
	text-indent: 
	
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
</style>
<body>
	
	<%@include file="admin/adminInclude/admin_top.jsp" %>

	<%@include file="admin/adminInclude/admin_aside.jsp" %>
	
	<c:set var="list" value="${searchQuestionList }" />
	<c:set var="paging" value="${Paging }" />
	<div class="container table-responsive" >	
		<h4 class="noticeText">자주 찾는 질문</h4>
		<div class="talbe float-right">
			
			<form method="post"
		      action="<%=request.getContextPath() %>/question_search.do">
		   
		   	  <input type="hidden" name="page" value="1">
		   	  
		      <select name="field" class="selectBox">
		         <option value="title">제목</option>
		         <option value="cont">내용</option>
		      </select>
		      
		      <input name="keyword" class="searchBox">
		      <input type="submit" value="검색" class="sButton">
		   </form>
		</div>
		
		<div class="tth">
			<table class="table table-hover" style="table-layout: fixed">
				<tr>	
					<th width="8%">번호</th><th>공개여부</th><th width="40%">제목</th><th>작성일</th><th width="8%">삭 제</th>
				</tr>
				
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="i">
						<tr>
							<td width="8%">${i.q_num }</td>
							<td>${i.q_oc }</td>
							<td width="40%">
								<a href="<%=request.getContextPath() %>/admin_question_content.do?num=${i.getQ_num() }&page=${paging.page }">
									${i.q_title }
								</a> 
							</td>
							<td>${i.q_date.substring(0, 10) }</td>
							<td width="8%">
								<input type="button" value="삭 제"  class="btn btn-outline-danger"
									onclick="if(confirm('삭제하시겠습니까?')){
										location.href='admin_question_delete.do?num=${i.q_num }&page=${paging.page }'
								}">
							</td>
						</tr>
					</c:forEach>
				</c:if>
				
				<c:if test="${empty list }">
			        <tr>
			           <td colspan="5" align="center">
			              <h3>검색된 게시글이 없습니다</h3>
			           </td>
			         </tr>
		    	</c:if>
			</table>
			
			<div>
				<a class="btn float-right "><input type="button" value="글쓰기" class="btn btn-success btn-block"
					onclick="location.href='question_write.do'">
				</a>
				<a class="btn float-right "><input type="button" value="전체목록으로"  class="btn btn-outline-success btn-block"
					onclick="location.href='question_list.do'">
				</a>
			</div>
			
			<div class="text-center">
				<ul class="pagination">
					<%-- 검색 페이징 처리 부분 --%>
				    <c:if test="${paging.getPage() > paging.getBlock() }">
				       <li class="page-item"><a class="page-link" href="question_search.do?page=1&${paging.field }&keyword=${paging.keyword }">[처음으로]</a></li>
				       <li class="page-item"><a class="page-link" href="question_search.do?page=${paging.getStartBlock() - 1 }&field=${paging.field }&keyword=${paging.keyword }">◀</a></li>
				    </c:if>
				   
				    <c:forEach begin="${paging.getStartBlock() }"
				          				end="${paging.getEndBlock() }" var="i">
				       <c:if test="${i == paging.getPage() }">
				          <li class="page-item"><a class="page-link" href="question_search.do?page=${i }&field=${paging.field }&keyword=${paging.keyword }">${i }</a></li>
				       </c:if>
				   
			   	   	   <c:if test="${i != paging.getPage() }">
				          <li class="page-item"><a class="page-link" href="question_search.do?page=${i }&field=${paging.field }&keyword=${paging.keyword }">${i }</a></li>
				       </c:if>
				    </c:forEach>
			
				    <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
				       <li class="page-item"><a class="page-link" href="question_search.do?page=${paging.getEndBlock() + 1 }&field=${paging.field }&keyword=${paging.keyword }">▶</a></li>
				       <li class="page-item"><a class="page-link" href="question_search.do?page=${paging.getAllPage() }&field=${paging.field }&keyword=${paging.keyword }">[마지막으로]</a></li>
				    </c:if>
				</ul>
		    </div>
		    
		</div>
	</div>
	
</body>
</html>