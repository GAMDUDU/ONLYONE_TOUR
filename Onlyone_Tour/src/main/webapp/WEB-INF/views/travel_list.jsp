<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<meta charset="UTF-8">
	<title>온리원투어 패키지</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/travel_list.css">
	
	<!-- bootstrap css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
	
</head>
<body>
	<c:set var="travelList" value="${List }" />
	<c:set var="normalList" value="${NormalList }" />
	<c:set var="hitList" value="${HitList }" />
	<c:set var="recommendList" value="${RecommendList }" />
	<c:set var="newList" value="${NewList }" />

	<jsp:include page="include/top.jsp" />
	
	<div class="container">
	    <div class="row">
	        <div class="col-xs-12">
	        swiper 시도
	        </div>
	    </div>
	    <br><br><br><br>
	    <div class="row">
	    	<h5><b>따끈따끈 신규 상품</b></h5><br><br>
	    	<c:if test="${!empty newList }">
				<c:forEach items="${newList }" var="dto" begin="0" end="3">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/travel_cont.do?num=${dto.getTravel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_package/${dto.getTravel_image() }"
										width="300" height="200">
						</a>
			        </div>
			    </c:forEach>
			    
			</c:if>
	    </div>
	    <br><hr><br>
	    <div class="row">
	    	<h5><b>베스트 상품</b></h5><br><br>
	        <div class="col-md-3"></div>
	        <div class="col-md-3"></div>
	        <div class="col-md-3"></div>
	        <div class="col-md-3"></div>
	    </div>
	    <br><hr><br>
	    <div class="row">
	    	<h5><b>온리원투어 추천 상품</b></h5><br><br>
	        <div class="col-md-3"></div>
	        <div class="col-md-3"></div>
	        <div class="col-md-3"></div>
	        <div class="col-md-3"></div>
	    </div>
	    <br><hr><br>
	    <div class="row">
	    	<h5><b>패키지 여행 둘러보기</b></h5><br><br>
	        <c:if test="${!empty travelList }">
				<c:forEach items="${travelList }" var="dto" begin="0" end="3">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/travel_cont.do?num=${dto.getTravel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_package/${dto.getTravel_image() }"
										width="300" height="200">
						</a>
			        </div>
			    </c:forEach>
			    
			    <c:forEach items="${travelList }" var="dto" begin="4" end="7">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/travel_cont.do?num=${dto.getTravel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_package/${dto.getTravel_image() }"
										width="300" height="200" style="margin-top: 30px;">
						</a>
			        </div>
			    </c:forEach>
			</c:if>
	        <br>
	        <div align="right">
	        <a id="all_a" style="height: 10px;" href="<%=request.getContextPath() %>/travel_list_all.do">전체보기</a>
	        </div>
	    </div>
	</div>
	
	

	

</body>
</html>