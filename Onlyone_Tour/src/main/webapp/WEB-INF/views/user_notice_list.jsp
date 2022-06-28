<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>공지사항</h2>
	<br><br>
	
	<c:set var="list" value="${List }" />
	<c:set var="paging" value="${Paging }" />
	
	
	<div>
		<form method="post" action="<%=request.getContextPath() %>/notice_search.do">
			
			<input type="hidden" name="page" value="1">
			
			<select name="field">
				<option value="n_num">글번호</option>
				<option value="n_title">제목</option>
				<option value="n_cont">내용</option>
			</select>
			
			<input name="keyword">	
			<input type="submit" value="검색">
		
		</form>
		
		<div>
			<table>	
				<tr>
					<th>번호</th><th>제목</th><th>작성자</th>
					<th>조회수</th><th>날짜</th>
				</tr>
				
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="i">
						<tr>
							
							<td>${i.n_num }</td>
							
							<td>
								<a href="<%=request.getContextPath() %>/user_notice_content.do?num=${i.n_num }&page=${paging.page }">
									${i.n_title }
								</a>	
							</td>
						
							<td>${i.n_name }</td>
						
							<td>${i.n_view }</td>
						
							<td>${i.n_date.substring(0, 10) }</td>
							
						</tr>
						
					</c:forEach>
				
				</c:if>
				
				<c:if test="${empty list }">
					 <tr>
		          		 <td colspan="6" align="center">
		         		     <h3>공지사항 목록이 없습니다.....</h3>
		       		    </td>
		       		 </tr>
				</c:if>
			</table>
			
		</div>
		
		<div>
			<%-- 페이징 처리 부분 --%>
		    <c:if test="${paging.getPage() > paging.getBlock() }">
		       <a href="user_notice_list.do?page=1">[처음으로]</a>
		       <a href="user_notice_list.do?page=${paging.getStartBlock() - 1 }">◀</a>
		    </c:if>
		   
		    <c:forEach begin="${paging.getStartBlock() }"
		          				end="${paging.getEndBlock() }" var="i">
		       <c:if test="${i == paging.getPage() }">
		          <b> <a href="user_notice_list.do?page=${i }">[${i }]</a> </b>
		       </c:if>
		   
		  	   	   <c:if test="${i != paging.getPage() }">
		          <a href="user_notice_list.do?page=${i }">[${i }]</a>
		       </c:if>
		    </c:forEach>
		
		    <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
		       <a href="user_notice_list.do?page=${paging.getEndBlock() + 1 }">▶</a>
		       <a href="user_notice_list.do?page=${paging.getAllPage() }">[마지막으로]</a>
		    </c:if>
		</div>
	</div>
	
</body>
</html>