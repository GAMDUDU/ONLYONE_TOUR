<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
	
	#replyImg{
		width: 12px;
		height: 12px;
	}
	
</style>

<body>

<div>
	<c:set var="list" value="${servList }" />
	<c:set var="paging" value="${Paging }" />
	
	<div class="question_search">
		<form method="post"
	      action="notice_search.do">
	   
	   	  <input type="hidden" name="page" value="1">
	   	  
	      <select name="field">
	         <option value="title">제목</option>
	         <option value="cont">내용</option>
	      </select>
	      
	      <input name="keyword">
	      <input type="submit" value="검색">
	   </form>
	</div>
	
	<div>
		<table>
			<tr>
				<th>번호</th><th>카테고리</th><th>제목</th><th>작성자</th>
				<th>아이디</th><th>답변상태</th><th>작성일자</th><th>삭제</th>
			</tr>
						
			<c:if test="${!empty list }">
				<c:forEach items="${list}" var="dto">
					
					<tr>
						<td>${dto.service_num }</td>
						<td>${dto.c_name }</td>
						<td>
							<!-- indent가 0이 아니면 댓글인 경우이다  -->
							<c:if test="${dto.service_indent != 0 }">
								<img id="replyImg" src="./resources/image_service/source/829.png">
							</c:if>
						
							<a href="amdin_oneQuestion_content.do?num=${dto.service_num }&page=${paging.page }">
							${dto.service_title }
							</a>
						</td>
						<td>${dto.service_name }</td>
						<td>${dto.member_id }</td>
						<td>${dto.service_check }</td>
						<td>${dto.service_date }</td>
						<td>
							<input type="button" value="삭 제"
								onclick="if(confirm('삭제하시겠습니까?')){
									location.href='admin_oneQuestion_delete.do?num=${dto.service_num }&page=${paging.page }'
								}">	
						</td>
					</tr>
					
				</c:forEach>
			</c:if>
			
		</table>
	</div>
	
	<div>
		<%-- 페이징 처리 부분 --%>
	    <c:if test="${paging.getPage() > paging.getBlock() }">
	       <a href="oneQuestion_list.do?page=1">[처음으로]</a>
	       <a href="oneQuestion_list.do?page=${paging.getStartBlock() - 1 }">◀</a>
	    </c:if>
	   
	    <c:forEach begin="${paging.getStartBlock() }"
	          				end="${paging.getEndBlock() }" var="i">
	       <c:if test="${i == paging.getPage() }">
	          <b> <a href="oneQuestion_list.do?page=${i }">[${i }]</a> </b>
	       </c:if>
	   
	  	   	   <c:if test="${i != paging.getPage() }">
	          <a href="oneQuestion_list.do?page=${i }">[${i }]</a>
	       </c:if>
	    </c:forEach>
	
	    <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
	       <a href="oneQuestion_list.do?page=${paging.getEndBlock() + 1 }">▶</a>
	       <a href="oneQuestion_list.do?page=${paging.getAllPage() }">[마지막으로]</a>
	    </c:if>
	</div>
	
</div>
	
</body>
</html>