<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	
$(document).ready(function(){
	
	$("button[name=toggleButton]").click(function(){
		
		$(this).next().toggle('500');
		
	}); 
	
		
})

	
items.forEach(item => item.addEventListener('click', openCloseBar));
	
</script>
<style type="text/css">

#bodySection p {
	display : none;
}

.noticeText{
	position: relative;
	float:left;
	
}

	
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



.table tr th{
	width: 10%;
}

.table tr td{
	width: 50%;
}

.foooooooter{
	
	position : relative;
	bottom : 0;
}	
	
.text-center{
	width: 30%; 
	float:none; 
	margin:100px auto;
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
	
.faq-content { 

	border-bottom: 1px solid #e0e0e0; 

}
.question { 
	font-size: 19px;
	font-weight :bold; 
	padding: 30px 20px;  
	cursor: pointer; 
	border-bottom: 1px solid black; 
	border-top : none;
	border-left : none;
	border-right : none;
	outline: none; 
	background: none;  
	width: 100%;  
	text-align: left; 
	background-color:#f1f1f1;
	border-radius: 15px;
}
.question:hover { 
	color: #9046cf; 
}

.answerr{
	font-size: 19px; 
	padding-top : 30px;
	padding: 30px 20px;  
	
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

.text-center{
	width: 50%; 
	float:none; 
	
}


</style>
</head>
<body>
	<jsp:include page="include/top.jsp" />
	<%@include file="./include/service_oneQSidebar.jsp" %>	
		
	<div class="container2">
		<c:set var="list" value="${List }" />
		<c:set var="paging" value="${Paging }" />
		<h4 class="noticeText"> 자주 찾는 질문</h4>
	
		
		<div id="bodySection" class="tth">
			<c:if test="${!empty list }">
				<c:forEach	items="${list }" var="i">
					<div>
						<button class="question" name="toggleButton">
						<span id="que-1-toggle">Q.   </span>
						${i.q_title }
						</button>	
						
						<p class="answerr">A. ${i.q_cont }</p>
					</div>	
				</c:forEach>
				
			</c:if>
		</div>
		
		<%-- 페이징 처리 부분 --%>
		<div class="text-center">
			<ul class="pagination">
			    <c:if test="${paging.getPage() > paging.getBlock() }">
			       <li class="page-item"><a class="page-link" href="user_question_list.do?page=1">처음으로</a></li>
			       <li class="page-item"><a class="page-link" href="user_question_list.do?page=${paging.getStartBlock() - 1 }">◀</a></li>
			    </c:if>
			   
			    <c:forEach begin="${paging.getStartBlock() }"
			          				end="${paging.getEndBlock() }" var="i">
			       <c:if test="${i == paging.getPage() }">
			          <li class="page-item"><a class="page-link" href="user_question_list.do?page=${i }">${i }</a></li>
			       </c:if>
			   
			  	   	   <c:if test="${i != paging.getPage() }">
			          <li class="page-item"><a class="page-link" href="user_question_list.do?page=${i }">${i }</a></li>
			       </c:if>
			    </c:forEach>
			
			    <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
			       <li class="page-item"><a class="page-link" href="user_question_list.do?page=${paging.getEndBlock() + 1 }">▶</a></li>
			       <li class="page-item"><a class="page-link" href="user_question_list.do?page=${paging.getAllPage() }">마지막으로</a></li>
			    </c:if>
		    </ul>
		</div>
	</div>
	
	<div class="foooooooter">
		<jsp:include page="include/footer.jsp" />
	</div>
	
</body>
</html>