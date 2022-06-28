<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공 예약 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
</head>
<body>

	<jsp:include page="include/top.jsp" />
	<hr width="100%" color="gray">
	
	<div class="container-fluid">
	  <div class="row">
		
		<div class="col-md-8 col-md-offset-2">
		<c:set var="list" value="${airlist }" />
		<c:set var="departure" value="${air_departure }" />
		<c:set var="arrival" value="${air_arrival }" />
		<c:set var="adult" value="${air_adult }" />
		<c:set var="child" value="${air_child }" />
				
		<h4>[선택 인원] 성인 : ${air_adult }명
		<c:if test="${!empty child and child != 0}">, 소아 : ${air_child }명</c:if></h4>
		 
		      <c:if test="${!empty list }">
				<h3>[✈️ 가는 항공]</h3>      			         
	         	<table class="table table-bordered">
	         		<tr>
	         			<th>항공사</th>
	         			<th>항공번호</th>
	         			<th>출발지</th>
	         			<th>출발시간</th>
	         			<th>도착지</th>
	         			<th>도착시간</th>
	         			<th>성인요금</th>
	         			<th>소아요금</th>
	         		</tr>
	         	<c:forEach items="${list }" var="air">
	         	<c:if test="${air.getAir_departure() == air_departure}">
		            <tr>
		               <td> ${air.getAir_airline() } </td>
		               <td> ${air.getAir_name() } </a></td>
		               <td> ${air.getAir_departure() } </td>
		               <td> ${air.getAir_departure_date() } </td>
		               <td> ${air.getAir_arrival() } </td>
		               <td> ${air.getAir_arrival_date() } </td>
		               <td> ${air.getAir_adult_fare() }원 </td>
		               <td> ${air.getAir_child_fare() }원 </td>
	 	            </tr>
	 	            </c:if>
	 	         </c:forEach>
	 	         </table>
	 	         		 	         
	 	         
	 	         <br><br><br>
	 	         <h3>[✈️ 오는 항공]</h3>
	 	         <table class="table table-bordered">
	 	         	<tr>
	         			<th>항공사</th>
	         			<th>항공번호</th>
	         			<th>출발지</th>
	         			<th>출발시간</th>
	         			<th>도착지</th>
	         			<th>도착시간</th>
	         			<th>성인요금</th>
	         			<th>소아요금</th>
	         		</tr>
	 	         <c:forEach items="${list }" var="air">
	 	         <c:if test="${air.getAir_arrival() == air_departure}">
		            <tr>
		               <td> ${air.getAir_airline() } </td>
		               <td> ${air.getAir_name() } </a></td>
		               <td> ${air.getAir_departure() } </td>
		               <td> ${air.getAir_departure_date() } </td>
		               <td> ${air.getAir_arrival() } </td>
		               <td> ${air.getAir_arrival_date() } </td>
		               <td> ${air.getAir_adult_fare() }원 </td>
		               <td> ${air.getAir_child_fare() }원 </td>
	 	            </tr>
	 	            </c:if>
	 	     	</c:forEach>
	 	        </table>
		 	         
		      </c:if>
		      
		 	</div>
		</div>
	</div>
	
	<br><br><br>
	<hr width="100%" color="gray">
	<jsp:include page="include/footer.jsp" />
	
</body>
</html>