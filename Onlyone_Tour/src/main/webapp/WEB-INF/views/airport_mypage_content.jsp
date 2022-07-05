<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공 예약 내역 확인</title>
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
	
	<div class="container-fluid" style="background-color:#fff;">
	  <div class="row">
		
		<div class="col-md-8 col-md-offset-2">
		
			<div class="alert alert-warning" role="alert" style="color:#000;font-size:24px;">
				☑️ ${member_name}님의 항공예약 상세내역 입니다.
			</div>
			
			<c:set var="list" value="${ReserveList }" />
			<c:set var="rdto" value="${ReserveOne }" />
			<c:if test="${!empty list }">
			
				<br>					
				<div class="panel panel-info">		
					<div class = "panel-heading"> 
		         		<h3 class = "panel-title" style="font-weight:bold; font-size:20px;">
		         			[항공권 가격 정보]
		         		</h3> 
		     		</div>
	     		 
		     		<div class="panel-body">
		     		
						<table class="table table-bordered" style="text-align:center;">
							<tr class="active" style="font-weight:bold;">
								<td colspan="3">[가는 항공]</td>
								<td colspan="3">[오는 항공]</td>
							</tr>
							<tr class="active" style="font-weight:bold;">
								<td>구분</td>
								<td>성인</td>
								<td>소아</td>
								<td>구분</td>
								<td>성인</td>
								<td>소아</td>
							</tr>
							<tr>
								<td>총운임<br>(유류할증료/<br>제세공과금 포함)</td>
								<td style="vertical-align:middle; font-size:16px; font-weight:bold;" id="go_adult">${rdto.getRe_go_adult() }</td>
								<td style="vertical-align:middle; font-size:16px; font-weight:bold;" id="go_child">${rdto.getRe_go_child() }</td>
								<td>총운임<br>(유류할증료/<br>제세공과금 포함)</td>
								<td style="vertical-align:middle; font-size:16px; font-weight:bold;" id="back_adult">${rdto.getRe_back_adult() }</td>
								<td style="vertical-align:middle; font-size:16px; font-weight:bold;" id="back_child">${rdto.getRe_back_adult() }</td>
							</tr>	
							<tr class="active">
								<td colspan="4" style="font-weight:bold;">총 요금 </td>
								<td colspan="2" style="vertical-align:middle; font-size:16px; color:blue; font-weight:bold;" id="tot">
									${rdto.getRe_account() }
								</td>
							</tr>
						</table>
					</div>
				</div>
	
				<br>
				<div class="panel panel-info">		
					<div class = "panel-heading"> 
		         		<h3 class = "panel-title" style="font-weight:bold; font-size:20px;">
		         			[탑승자 연락처 및 개인정보] (${rdto.getRe_info() })
		         		</h3> 
		     		</div>
	     		 
		     		<div class="panel-body"> 
					<c:forEach items="${list }" var="air" varStatus="vs">
						<label style="font-weight:bold; font-size:16px;">[탑승자${vs.count} 개인정보]</label>
						<table class="table table-bordered">
							<tr class="active">
								<th style="vertical-align:middle;">성명(한글)</th>
								<th style="vertical-align:middle;">성별</th>
								<th style="vertical-align:middle;">생년월일</th>
								<th style="vertical-align:middle;">휴대폰 번호</th>
							</tr>
							
							<tr>
								<td>${air.getRe_tour_name() }</td>
								<td>${air.getRe_tour_gender() }</td>
								<td>${air.getRe_tour_birth() }</td>
								<td>${air.getRe_tour_phone() }</td>
							</tr>
						</table>
					</c:forEach>
					</div>
				</div>	
				
				<br>
				<div class="panel panel-info">		
					<div class = "panel-heading"> 
		         		<h3 class = "panel-title" style="font-weight:bold; font-size:20px;">
		         			[항공권 비행 일정]
		         		</h3> 
		     		</div>
	     		 
		     		<div class="panel-body">
		     		
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
				 </div>							
			  </div>					 
					 
			 <br><br> 
			 <div class="row">
			  	<div class="col-md-8 col-md-offset-2">
				 	<p style="text-align:center;">
						<input type="button" value="항공권 예약 취소" class="btn btn-danger btn-lg"
	               			onclick="if(confirm('정말로 항공권을 취소 하겠습니까?')) {
	               				location.href='<%=request.getContextPath()%>/airport_delete.do?id=${member_id}&num=${rdto.getRe_num() }'
	               		    }else {  return; }">
	               		&nbsp;&nbsp;&nbsp;
	               		<a type="button" class="btn btn-default btn-lg" 
							href="<%=request.getContextPath()%>/airport_mypage.do?id=${member_id}">
								목록으로
						</a>
						
					</p>
				</div>
			  </div> 	

			</c:if>
			
			
			<c:if test="${empty list }"> 
				<div class="alert alert-danger" role="alert" style="font-size:24px;text-align:center;">
					<br>
					 *** ${member_name}님의 항공 예약 내역이 존재하지 않습니다. ***<br><br>
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
 	
	<script type="text/javascript">
	
	  $(document).ready(function() {
		  

	  }); 
	  
	</script>
</body>
</html>