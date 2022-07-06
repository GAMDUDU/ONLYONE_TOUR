<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공 예약 내역 확인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>
	<jsp:include page="include/top.jsp" />
	</div>
	<hr width="100%" color="gray">
	<br>
	
	<div class="container-fluid" style="background-color:#fff;">
	  <div class="row">
		
		<div class="col-md-8 col-md-offset-2">
		
			<div class="alert alert-warning" role="alert" style="color:#000;font-size:20px;">
				☑️ ${member_name}님의 항공 예약 목록입니다.
			</div>
			
			
			<c:set var="list" value="${ReserveList }" />
			<c:if test="${!empty list }">
	         		
         		 <c:forEach items="${list }" var="air">
         		 	<table class="table table-bordered text-center" >
	         		<tr class="info">
	         			<th class="text-center">예약 일자</th>
	         			<th class="text-center">구분</th>
	         			<th class="text-center">항공편</th>
						<th class="text-center">비행 일정</th>
						<th class="text-center"></th>
	         		</tr>
	         		 <tr>
	         		 	<td rowspan="2" style="vertical-align:middle;font-weight:bold;">${air.getRe_date().substring(0,10) }</td>
	         			<td>[가는 항공]</td> 
						<td>${air.getRe_go_air() } ${air.getRe_go_num() }편</td>
						<td>${air.getRe_go() } ${air.getRe_go_date() }</td>
						<td rowspan="2" style="vertical-align:middle;">
							<a type="button" class="btn btn-primary" 
								href="<%=request.getContextPath()%>/airport_mypage_content.do?num=${air.getRe_num() }">
									상세내역 확인
							</a>
						</td>
					</tr>
					
					<tr>
	         		 	<td>[오는 항공]</td> 
						<td>${air.getRe_back_air() } ${air.getRe_back_num() }편</td>
						<td>${air.getRe_back() } ${air.getRe_back_date() }</td>
					</tr>
					</table>	
				</c:forEach>
					
				
			</c:if>
			
			<c:if test="${empty list }"> 
				<div class="alert alert-danger" role="alert" style="font-size:20px;text-align:center;">
					<br>
					 *** 항공 예약 내역이 존재하지 않습니다. ***<br><br>
					<a class="btn btn-danger btn-lg"
		   				href="<%=request.getContextPath()%>/airport.do">
		   				항공편 예약 하러 가기
		   			</a>
		   			<br><br>
				</div>
			</c:if>
 		</div>
 	  </div>
 	 </div>
 	 
 	<br><br>
	<hr width="100%" color="gray">
	<div class="container">
	<jsp:include page="include/footer.jsp" />
	<br><br><br>
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
	
	  $(document).ready(function() {
		  
			<%
			if(session.getAttribute("member_id") == null){ 
			%>
				alert("로그인이 필요한 서비스 입니다.\n로그인을 먼저 진행해 주세요.");
				location.href="<%=request.getContextPath()%>/login.do";
			<%
				}
			%>

	  }); 
	  
	</script>
</body>
</html>