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
	<meta
      name="viewport"
      content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1"
    />
    <!-- swiper -->
	<link  rel="stylesheet"  href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
	<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>	
	
    <!-- Link Swiper's CSS -->
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    
	<style type="text/css">
	
   	  html, body {
        position: relative;
        height: 80%;
      }

      body {
        background: #eee;
        font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
        font-size: 14px;
        color: #000;
        margin: 0;
        padding: 0;
      }

      .swiper {
        width: 100%;
        height: 100%;
      }

      .swiper-slide {
        text-align: center;
        font-size: 18px;
        background: #fff;

        /* Center slide text vertically */
        display: -webkit-box;
        display: -ms-flexbox;
        display: -webkit-flex;
        display: flex;
        -webkit-box-pack: center;
        -ms-flex-pack: center;
        -webkit-justify-content: center;
        justify-content: center;
        -webkit-box-align: center;
        -ms-flex-align: center;
        -webkit-align-items: center;
        align-items: center;
      }

      .swiper-slide img {
        display: block;
        width: 100%;
        height: 600px;
        object-fit: cover;
      }

      .swiper {
        margin-left: auto;
        margin-right: auto;
      }
      
     #search_package {
	    position: absolute;
	    left: 25%;
	    width: 600px;
	    bottom: 80px;
	    background: #fff;
	    padding: 10px 20px;
	    z-index: 2;
	    display: inline-block;
	    border-radius: 5px;
	    
	}
	
	.input {
		width: 80%;
		height: 50px;
		margin: 10px;
		padding: 10px;
		border: 0;
		border-radius: 5px;
		background-color: #eee;
	}
	
	.redbtn {
		width: 15%;
		height: 50px;
	    border-radius: 8px 0 8px 8px;
	    background: #ee006b;
	    color: #fff !important;
	    border: none;
	}
	</style>
	
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

	<!-- Swiper -->
    <div class="swiper mySwiper">
    	<form method="post" id="search_package" action="<%=request.getContextPath() %>/travel_search.do">
    		<input name="keyword" class="input" placeholder="어디로 여행가세요?">
    		<input type="submit" value="검색" class="redbtn">    	
    	</form>
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_package/europe.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_package/europe2.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_package/dongnama.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_package/hawaii.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_package/monggol.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_package/vietnam.jpg"></div>
      </div>
      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>
      <div class="swiper-pagination"></div>
    </div>


    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <!-- Initialize Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        slidesPerView: 1,
        spaceBetween: 30,
        loop: true,
        pagination: {
          el: ".swiper-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
    
	<div class="container">
		
	    <div class="row" style="height: 100%; width: 100%;">
	        <div class="col-xs-12">
	        	
	        </div>
	    </div>
	    <br><br><br><br>
	    
	    <div class="row" >
	    	<h5><b>따끈따끈 신규 상품</b></h5><br><br>
	    	<c:if test="${!empty newList }">
				<c:forEach items="${newList }" var="dto" begin="0" end="3">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/travel_cont.do?num=${dto.getTravel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_package/${dto.getTravel_image() }"
										width="300" height="200" style="margin-bottom: 10px;">
							<br>
							<span style="font-size: 16px;"><b>${dto.getTravel_name().substring(0, 20)}...</b></span>
							<br>
							<span style="font-size: 13px;">${dto.getTravel_cont().substring(0, 25)}...</span>
							<br>
							<span style="font-size: 20px;"><b><fmt:formatNumber value="${dto.getTravel_price() }" /></b></span>
							<span style="font-size: 16px;">원~</span>
						</a>
			        </div>
			    </c:forEach>
			</c:if>
	    </div>
	    <br><hr><br>
	    
	    <div class="row">
	    	<h5><b>베스트 상품</b></h5><br><br>
	    	<c:if test="${!empty hitList }">
				<c:forEach items="${hitList }" var="dto" begin="0" end="3">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/travel_cont.do?num=${dto.getTravel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_package/${dto.getTravel_image() }"
										width="300" height="200" style="margin-bottom: 10px;">
							<br>
							<span style="font-size: 16px;"><b>${dto.getTravel_name().substring(0, 20)}...</b></span>
							<br>
							<span style="font-size: 13px;">${dto.getTravel_cont().substring(0, 25)}...</span>
							<br>
							<span style="font-size: 20px;"><b><fmt:formatNumber value="${dto.getTravel_price() }" /></b></span>
							<span style="font-size: 16px;">원~</span>
						</a>
			        </div>
			    </c:forEach>
			</c:if>
	    </div>
	    <br><hr><br>
	    
	    <div class="row">
	    	<h5><b>온리원투어 추천 상품</b></h5><br><br>
	        <c:if test="${!empty recommendList }">
				<c:forEach items="${recommendList }" var="dto" begin="0" end="3">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/travel_cont.do?num=${dto.getTravel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_package/${dto.getTravel_image() }"
										width="300" height="200" style="margin-bottom: 10px;">
							<br>
							<span style="font-size: 16px;"><b>${dto.getTravel_name().substring(0, 20)}...</b></span>
							<br>
							<span style="font-size: 13px;">${dto.getTravel_cont().substring(0, 25)}...</span>
							<br>
							<span style="font-size: 20px;"><b><fmt:formatNumber value="${dto.getTravel_price() }" /></b></span>
							<span style="font-size: 16px;">원~</span>
						</a>
			        </div>
			    </c:forEach>
			</c:if>
	    </div>
	    <br><hr><br>
	    
	    <div class="row">
	    	<h5><b>패키지 여행 둘러보기</b>&nbsp;&nbsp;&nbsp;<a id="all_a" style="height: 10px; font-size: 13px;" href="<%=request.getContextPath() %>/travel_list_all.do">전체보기</a></h5>
	    	
	    	<br><br>
	        <c:if test="${!empty travelList }">
				<c:forEach items="${travelList }" var="dto" begin="0" end="3">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/travel_cont.do?num=${dto.getTravel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_package/${dto.getTravel_image() }"
										width="300" height="200" style="margin-bottom: 10px;">
							<br>
							<span style="font-size: 16px;"><b>${dto.getTravel_name().substring(0, 20)}...</b></span>
							<br>
							<span style="font-size: 13px;">${dto.getTravel_cont().substring(0, 25)}...</span>
							<br>
							<span style="font-size: 20px;"><b><fmt:formatNumber value="${dto.getTravel_price() }" /></b></span>
							<span style="font-size: 16px;">원~</span>
						</a>
			        </div>
			    </c:forEach>
			    
			    <c:forEach items="${travelList }" var="dto" begin="4" end="7">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/travel_cont.do?num=${dto.getTravel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_package/${dto.getTravel_image() }"
										width="300" height="200" style="margin-top: 30px; margin-bottom: 10px;">
							<br>
							<span style="font-size: 16px;"><b>${dto.getTravel_name().substring(0, 22)}...</b></span>
							<br>
							<span style="font-size: 13px;">${dto.getTravel_cont().substring(0, 25)}...</span>
							<br>
							<span style="font-size: 20px;"><b><fmt:formatNumber value="${dto.getTravel_price() }" /></b></span>
							<span style="font-size: 16px;">원~</span>
						</a>
			        </div>
			    </c:forEach>
			</c:if>
	        <br>
	        
	    </div>
	</div>
	<br>
	
	<jsp:include page="include/footer.jsp" />
	

</body>
</html>