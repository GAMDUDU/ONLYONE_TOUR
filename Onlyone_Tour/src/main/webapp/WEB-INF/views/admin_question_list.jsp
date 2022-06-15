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
	<h2>자주 찾는 질문 리스트</h2>
	<br>
	<br>
	
	<c:set var="list" value="${List }" />
	<c:set var="paging" value="${Paging }" />
		
	<div class="question_search">
		<form method="post"
	      action="<%=request.getContextPath() %>/question_search.do">
	   
	   	  <input type="hidden" name="page" value="${paging.getPage() }">
	   	  
	      <select name="field">
	         <option value="title">제목</option>
	         <option value="cont">내용</option>
	      </select>
	      
	      <input name="keyword">
	      <input type="submit" value="검색">
	   </form>
	</div>
	
	<div class="question_table">
		<table>
			<tr>	
				<th>번호</th><th>제목</th><th>작성일</th><th>삭 제</th>
			</tr>
			
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="i">
					<tr>
						<td>${i.q_num }</td>
						<td>
							<a href="<%=request.getContextPath() %>/admin_question_content.do?num=${i.getQ_num() }&page=${paging.page }">
								${i.q_title }
							</a> 
						</td>
						<td>${i.q_date.substring(0, 10) }</td>
						<td>
							<input type="button" value="삭 제"
								onclick="if(confirm('삭제하시겠습니까?')){
									location.href='admin_question_delete.do?num=${i.q_num }&page=${paging.page }'
							}">
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty list }">
		        <tr>
		           <td colspan="4" align="center">
		              <h3>질문 목록이 없습니다.....</h3>
		           </td>
		         </tr>
	    	</c:if>
		</table>
		
		<div>
			<input type="button" value="글쓰기" 
				onclick="location.href='question_write.do'">
		</div>
		
		<%-- 페이징 처리 부분 --%>
	    <c:if test="${paging.getPage() > paging.getBlock() }">
	       <a href="question_list.do?page=1">[처음으로]</a>
	       <a href="question_list.do?page=${paging.getStartBlock() - 1 }">◀</a>
	    </c:if>
	   
	    <c:forEach begin="${paging.getStartBlock() }"
	          				end="${paging.getEndBlock() }" var="i">
	       <c:if test="${i == paging.getPage() }">
	          <b> <a href="question_list.do?page=${i }">[${i }]</a> </b>
	       </c:if>
	   
   	   	   <c:if test="${i != paging.getPage() }">
	          <a href="question_list.do?page=${i }">[${i }]</a>
	       </c:if>
	    </c:forEach>

	    <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
	       <a href="question_list.do?page=${paging.getEndBlock() + 1 }">▶</a>
	       <a href="question_list.do?page=${paging.getAllPage() }">[마지막으로]</a>
	    </c:if>
	</div>
	
	
</body>
</html>