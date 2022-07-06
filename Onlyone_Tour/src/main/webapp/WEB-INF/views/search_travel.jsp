<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/searchProduct.css">
<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="include/top.jsp" />
	
	<c:set var="find" value="${Find}"/>
	<c:set var="search" value="${search}"/>
	<c:set var="hotel" value="${hotelFind}"/>
	
	
	<div id="search_main">
		<c:if test="${!empty find || !empty hotel}">
			<div class="search_top_bar">
				<span class="search_data">${search}</span>
				<span class="search_input">검색결과</span>
			</div>	
		</c:if>
		
		<c:if test="${empty find && empty hotel}">
			<div class="search_top_bar">
				<span class="search_input">${search}에 대한 검색결과가 없습니다.</span>
			</div>	
		</c:if>
		
		<hr width="60%" color="gray">
		
		<div class="row">
	        <c:if test="${!empty find }">
	        	<div class="search_main_name"><h5>여행 상품</h5></div>
	        	<span class="search_count">총 ${find.size()}개의 검색결과가 있습니다.</span>
	        	<br><br>
				
				<c:forEach items="${find}" var="dto" begin="0" end="3">
			        <div class="package_main">
		        		<img src="<%=request.getContextPath() %>/resources/image_package/${dto.getTravel_image() }"
								width="300" height="200" style="margin-bottom: 10px;">
						
						<div class="right_package">
							<div><span class="package_box">여행상품</span></div>
							<div class="travel_name"><span>${dto.getTravel_name().substring(0, 30)}...</span></div>
							
							<div class="travel_price">
								<span><fmt:formatNumber value="${dto.getTravel_price() }" /></span>
								<span>원~</span>
							</div>
							
							<div class="travel_subname"><strong>${dto.getTravel_cont().substring(0, 35)}...</strong></div>
							
							<div>
							<button type="button" class="move_product"
								onclick="location.href='<%=request.getContextPath() %>/travel_cont.do?num=${dto.getTravel_num()}'">
								상품보러가기
							</button>
							</div>
						</div>
			        </div>
			        <hr class="bottom_hr">
			    </c:forEach>
			</c:if>
			
			<c:if test="${!empty hotel }">
	        	<div class="search_main_name"><h5>호텔 상품</h5></div>
	        	<span class="search_count">총 ${hotel.size()}개의 검색결과가 있습니다.</span>
	        	<br><br>
				
				<c:forEach items="${hotel}" var="dto" begin="0" end="3">
			        <div class="package_main">
		        		<img src="<%=request.getContextPath() %>/resources/image_hotel/${dto.getHotel_image() }"
									width="300" height="200" style="margin-bottom: 10px;">
						
						<div class="right_package">
							<div><span class="package_box">호텔상품</span></div>
							<div class="travel_name"><span>${dto.getHotel_hname()}</span></div>
							
							<div class="travel_price">
								<span><fmt:formatNumber value="${dto.getHotel_price1()}" /></span>
								<span>원~</span>
							</div>
							
							<div class="travel_subname"><strong>${dto.getHotel_ename()}</strong></div>
							
							<div>
							<button type="button" class="move_product"
								onclick="location.href='<%=request.getContextPath() %>/hotel_cont.do?num=${dto.getHotel_num()}'">
								상품보러가기
							</button>
							</div>
						</div>
			        </div>
			        <hr class="bottom_hr">
			    </c:forEach>
			</c:if>
			
			
			<c:if test="${empty find && empty hotel}">
				<div class="not_find">
					<p class="not_find_icon"><i class="fa-solid fa-circle-exclamation fa-4x"></i></p>
					<p class="not_find_text1">입력한 검색어가 정확한지 확인해주세요.</p>
					<p>다른 검색어로 다시 검색해 주세요.</p>
					<p>단어의 철자가 정확한지 확인해 주세요.</p>
					<p>한글을 영어로 또는 영어를 한글로 입력하셨는지 확인해주세요.</p>
				</div>
			</c:if>
			
	    </div>
	</div>
	
	
</body>
</html>