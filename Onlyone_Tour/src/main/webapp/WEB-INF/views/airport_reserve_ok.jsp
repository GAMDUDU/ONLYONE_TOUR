<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공 예약 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
	
	#air_image {
		text-align:center;
		width:900px;
		height: 450px;
		background-image: url('resources/image/ticket_1.png');
		background-size: cover;
	}
	
	#air_info {
		text-align:center;
		background-color:000;
		width:550px;
		height: 180px;
		margin-top:180px;
		margin-left:280px;
		font-weight:bold;
	}
	
	#air_image2 {
		text-align:center;
		width:900px;
		height: 450px;
		background-image: url('resources/image/ticket_2.png');
		background-size: cover;
	}
	
	#air_info2 {
		text-align:center;
		background-color:000;
		width:550px;
		height: 180px;
		margin-top:180px;
		margin-left:280px;
		font-weight:bold;
	}	
</style>
</head>
<body>
	<jsp:include page="include/top.jsp" />
	</div>
	<hr width="100%" color="gray">
	<br>
	
	<div class="container-fluid">
		
		<div class="col-md-8 col-md-offset-2" style="text-algin:center;">
		
		 <div class="row">
		  <div class="col-md-9 col-md-offset-2 alert alert-info" role="alert" style="color:#000;font-size:20px;">
		  	☑️ ${member_name}님 예약이 완료되었습니다.
		  </div>
		 </div>	
		 <br><br>
		  
		  <c:set var="rdto" value="${AirReserve }" />
			<c:if test="${!empty rdto }">
			
			  <div class="row">
				<div id="air_image" class="col-md-6 col-md-offset-2">
				 <div id="air_info">
					<p style="font-size:48px;">
						${fn:split(rdto.getRe_go(),'-')[0]} &nbsp; ➜ &nbsp; ${fn:split(rdto.getRe_go(),'-')[1]}
					</p>
					<p style="font-size:30px;">
						${rdto.getRe_go_air() } ${rdto.getRe_go_num() }편
					</p>
					<p style="font-size:24px;">
						${rdto.getRe_go_date() }
					</p>
				  </div>	
				</div>
			  </div>
			  
			  <br><br><br>
			  <div class="row">
				<div id="air_image2" class="col-md-6 col-md-offset-2">
				 <div id="air_info2">
					<p style="font-size:48px;">
						${fn:split(rdto.getRe_back(),'-')[0]} &nbsp; ➜ &nbsp; ${fn:split(rdto.getRe_back(),'-')[1]}
					</p>
					<p style="font-size:30px;">
						${rdto.getRe_back_air() } ${rdto.getRe_back_num() }편
					</p>
					<p style="font-size:24px;">
						${rdto.getRe_back_date() }
					</p>
				  </div>	
				</div>
			  </div>			  
			  
			  
		</c:if>

		 <c:if test="${empty rdto }">
		 	<h3>예약 내역이 존재하지 않습니다. 다시 확인 부탁드립니다.</h3>
		 </c:if>		  
		 
		  <br><br><br>
		  <div class="row">
		  	<div class="col-md-8 col-md-offset-2">
			 	<p style="text-align:center;">
					<a type="button" class="btn btn-info btn-lg" 
						href="<%=request.getContextPath()%>/airport_mypage.do?id=${member_id}">
							예약내역 상세보기
					</a>
				</p>
			</div>
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
 	
	<script type="text/javascript">
	
	  $(document).ready(function() {

	  });
	  
	</script>
	
</body>
</html>