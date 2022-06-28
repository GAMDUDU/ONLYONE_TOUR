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
	
$(document).ready(function(){
	
	$("button[name=toggleButton]").click(function(){
		
		$(this).next().toggle('500');
		
	}); 
		
		
})
	
</script>
<style type="text/css">

	#bodySection p {
		display : none;
	}
	
</style>
</head>
<body>
	
	<div>
		<c:set var="list" value="${List }" />
		<c:set var="paging" value="${Paging }" />
		
		<div class="question_search">
				<form method="post"
		 			action="user_question_search.do">
		   
		    	<input name="keyword">
		    	<input type="submit" value="검색">
			</form>
		</div>
		
		<div id="bodySection">
			<c:if test="${!empty list }">
				<c:forEach	items="${list }" var="i">
					<div>
						<button name="toggleButton">${i.q_title }</button>	
						<p>${i.q_cont }</p>
					</div>	
				</c:forEach>
				
			</c:if>
		</div>
		
		<%-- 페이징 처리 부분 --%>
		<div>
		    <c:if test="${paging.getPage() > paging.getBlock() }">
		       <a href="user_question_list.do?page=1">[처음으로]</a>
		       <a href="user_question_list.do?page=${paging.getStartBlock() - 1 }">◀</a>
		    </c:if>
		   
		    <c:forEach begin="${paging.getStartBlock() }"
		          				end="${paging.getEndBlock() }" var="i">
		       <c:if test="${i == paging.getPage() }">
		          <b> <a href="user_question_list.do?page=${i }">[${i }]</a> </b>
		       </c:if>
		   
		  	   	   <c:if test="${i != paging.getPage() }">
		          <a href="user_question_list.do?page=${i }">[${i }]</a>
		       </c:if>
		    </c:forEach>
		
		    <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
		       <a href="user_question_list.do?page=${paging.getEndBlock() + 1 }">▶</a>
		       <a href="user_question_list.do?page=${paging.getAllPage() }">[마지막으로]</a>
		    </c:if>
		</div>
	</div>
	
</body>
</html>