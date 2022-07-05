<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공권 상세내역 확인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
	th {
		text-align:center;
	}
	
		#air_image {
		text-align:center;
		width:900px;
		height: 450px;
		background-image: url('resources/image/ticket.png');
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
	
</style>
</head>
<body>

	<%@include file="adminInclude/admin_top.jsp" %>
	<%@include file="adminInclude/admin_aside.jsp" %>
	
	<div class="container-fluid">
      <div class="col-md-8 col-md-offset-3">
      
       <div class="row">
       	   <c:set var="dto" value="${Cont }" />
		
	      <br><br><br>
	       <div class="row">
			  <div class="alert alert-info" role="alert" style="font-size:20px;">
			  	✈️ [${dto.getAir_name() }] 항공편 상세 내역 페이지</h3>
			  </div>
		   </div>			
		   
		   	<div class="row">
				<div id="air_image" class="col-md-6 col-md-offset-2">
				 <div id="air_info">
					<p style="font-size:42px;">
						${dto.getAir_departure() } &nbsp; ➜ &nbsp;  ${dto.getAir_arrival() }
					</p>
					<p style="font-size:30px;">
						${dto.getAir_airline() } ${dto.getAir_name() }편
					</p>
					<p style="font-size:24px;">
						${dto.getAir_date() } (${dto.getAir_departure_date() } ~ ${dto.getAir_arrival_date() })
					</p>
				  </div>	
				</div>
			</div>	
		   
		   <br><br>
		   <table class="table table-bordered">
		      <tr>
		         <th class="active">항공이름</th>
		         <td>${dto.getAir_name() } </td>
		      </tr>
		      
		      <tr>
		         <th class="active">항공사</th>
		         <td>${dto.getAir_airline() } </td>
		      </tr>
		      
		      <tr>
		         <th class="active">비행 일정</th>
		          <td>${dto.getAir_departure() } ➜ ${dto.getAir_arrival() }</td>
		      </tr>
		      
		      <tr>
		         <th class="active">출발날짜</th>
		         <td>${dto.getAir_date() } </td>
		      </tr>
		      
		      <tr>
		         <th class="active">비행 시간</th>
		         <td>${dto.getAir_departure_date() } ~ ${dto.getAir_arrival_date() }</td>
		      </tr>
		      		      
		      <tr>
		         <th class="active">성인요금</th>
		         <td><fmt:formatNumber value="${dto.getAir_adult_fare() }" pattern="#,###" />원 </td>
		      </tr>
		      
		      <tr>
		         <th class="active">소아요금</th>
		         <td><fmt:formatNumber value="${dto.getAir_child_fare() }" pattern="#,###" />원 </td>
		         
		      </tr> 
		      
		      <c:if test="${empty dto }">
		         <tr>
		            <td colspan="2" align="center">
		               <h3>조회된 항공권 상세 내역이 없습니다.....</h3>
		            </td>
		         </tr>
		      </c:if>
		   
		      <tr>
		         <td colspan="2" align="center">
		            <input type="button" value="항공권 수정" class="btn btn-info"
		               onclick="location.href='admin_air_modify.do?no=${dto.getAir_num() }&page=${Page }'">
		               &nbsp;
		            <input type="button" value="항공권 삭제" class="btn btn-danger"
		               onclick="if(confirm('정말로 항공권을 삭제하겠습니까?')) {
		               				location.href='admin_air_delete.do?no=${dto.getAir_num() }&page=${Page }'
		               		    }else {  return; }">
		               &nbsp;
		            <input type="button" value="전체목록" class="btn btn-default"
		               onclick="location.href='admin_air.do?page=${Page }'">
		         </td>
		      </tr>
		   </table>
       
       	<br><br><br><br>
        </div>
        
     </div>
   </div>
   
	
   <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
   <script type="text/javascript">
   
     $(document).ready(function() {

     });
     
   </script>
</body>
</html>