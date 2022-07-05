<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<meta charset="UTF-8">
	<title>온리원투어 숙소</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/hotel_list.css">
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
	
	/* 3칸 탭 */
	#content article:nth-child(3) h2 {
		text-align : center;
		padding : 50px 0 50px 0;
		margin: 400px 0 0 0;
	}
	
	.main input[type=radio] {
		display: none;
	}
	
	#tab-1:checked ~ .tab label:nth-child(1),
	#tab-2:checked ~ .tab label:nth-child(2),
	#tab-3:checked ~ .tab label:nth-child(3){
		background-color: blueviolet;
		box-shadow: none;
		color: white;
	}
	
	.content > div {
		display: none;
	}
	
	#tab-1:checked ~ .content div:nth-child(1),
	#tab-2:checked ~ .content div:nth-child(2),
	#tab-3:checked ~ .content div:nth-child(3){
		display: block;
	}
	
	.main {
		margin: 0 auto;
		main-width:1200px;
		max-width: 90%;
		font-family: Nanum Gothic;
	}
	
	.tab {
		overflow: hidden;
	}	
	
	.tab label {
		font-size: 18px;
		cursor: pointer;
		float: left;
		width: calc(100% / 3);
		text-align: center;
		padding: 15px 0;
		font-weight: bold;
		letter-spacing: 2px;
		user-select: none;
		-webkit-user-select: none;
	}
	
	.content {
		background-color: white;
		min-height: 400px;
	}
	
	.content > div{
		padding: 50px;
		line-height: 1.5;
		font-size: 15px;
		line-height: 30px;
		margin-left: 50px;
	}
	
	.content > div h4 {
		font-size: 20px;
	}
	
	.content #tabimg1 {
		float: right;
		margin: -200px -30px 0 0;
	}
	
	.content #tabimg2 {
		float: right;
		margin: -210px 100px 0 0;
	}
	
	.content #tabimg3 {
		float: right;
		margin: -220px 40px 0 0;
	}
	</style>
	
	<!-- bootstrap css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
	
</head>
<body>
	<c:set var="allList" value="${List }" />
	<c:set var="domList" value="${DomList }" />
	<c:set var="overList" value="${OverList }" />
	<c:set var="hotelList" value="${HotelList }" />
	<c:set var="pensionList" value="${PensionList }" />

	<jsp:include page="include/top.jsp" />

	<!-- Swiper -->
    <div class="swiper mySwiper">
    	<form method="post" id="search_package" action="<%=request.getContextPath() %>/hotel_search.do">
    		<input name="search_package_input" class="input" placeholder="어디로 여행가세요?">
    		<input type="submit" value="검색" class="redbtn">    	
    	</form>
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_hotel/경주 서남산한옥스테이 펜션.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_hotel/그랜드 조선 제주.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_hotel/신라 모노그램 꽝남 다낭.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_hotel/여수 밤바다 힐링파크.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_hotel/하와이 하얏트 플레이스.jpg"></div>
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

	    
	    <section id="content">
		    <article>
			    <h2>
					<h5><b>전국 방방곡곡 BEST 숙소✨</b></h5>
				</h2>
				<br>
				<div class="main">
					<input type="radio" id="tab-1" name="show" checked/>
					<input type="radio" id="tab-2" name="show" />
					<input type="radio" id="tab-3" name="show" />
					<div class="tab">
						<label for="tab-1">제주인기숙소</label>
						<label for="tab-2">도심근교호캉스</label>
						<label for="tab-3">해외감성숙소</label>
					</div>
					<div class="content">
						<div class="content-dis">
							<h4>Example</h4>
							explanation<br>
							explanation<br>
							<br>
							something : something<br>
							something : something
							<img id="tabimg1" src="<%=request.getContextPath() %>/resources/image/AC.jpg" title="Data Flow Diagram 일부" 
									width="380px" height="290px">
						</div>
						
						<div class="content-dis">
							<h4>Example</h4>
							explanation<br>
							explanation<br>
							<br>
							something : something<br>
							something : something
							<img id="tabimg1" src="<%=request.getContextPath() %>/resources/image/AC.jpg" title="Data Flow Diagram 일부" 
									width="380px" height="290px">
						</div>
						
						<div class="content-dis">
							<h4>Example</h4>
							explanation<br>
							explanation<br>
							<br>
							something : something<br>
							something : something
							<img id="tabimg1" src="<%=request.getContextPath() %>/resources/image/AC.jpg" title="Data Flow Diagram 일부" 
									width="380px" height="290px">						
						</div>
					</div>
				</div>
		    </article>
	    </section>
	    
	    <br><hr><br>
	    <div class="row">
	    	<h5><b>분위기 낼땐 호텔</b></h5><br><br>
	    	<c:if test="${!empty hotelList }">
				<c:forEach items="${hotelList }" var="dto" begin="0" end="3">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=${dto.getHotel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_hotel/${dto.getHotel_image() }"
										width="300" height="200" style="margin-bottom: 10px;">
							<br>
							<span style="font-size: 16px;"><b>${dto.getHotel_hname()}</b></span>
							<br>
							<span style="font-size: 13px;">${dto.getHotel_ename()}</span>
							<br>
							<span style="font-size: 20px;"><b><fmt:formatNumber value="${dto.getHotel_price1() }" /></b></span>
							<span style="font-size: 16px;">원~</span>
						</a>	
			        </div>
			    </c:forEach>
			</c:if>
	    </div>
	    <br><hr><br>
	    
	    <div class="row">
	    	<h5><b>감성은 펜션</b></h5><br><br>
	    	<c:if test="${!empty PensionList }">
				<c:forEach items="${PensionList }" var="dto" begin="0" end="3">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=${dto.getHotel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_hotel/${dto.getHotel_image() }"
										width="300" height="200" style="margin-bottom: 10px;">
							<br>
							<span style="font-size: 16px;"><b>${dto.getHotel_hname()}</b></span>
							<br>
							<span style="font-size: 13px;">${dto.getHotel_ename()}</span>
							<br>
							<span style="font-size: 20px;"><b><fmt:formatNumber value="${dto.getHotel_price1() }" /></b></span>
							<span style="font-size: 16px;">원~</span>
						</a>
			        </div>
			    </c:forEach>
			</c:if>
	    </div>
	    <br><hr><br>
	    
	   <%--  <div class="row">
	    	<h5><b>온리원투어 추천 상품</b></h5><br><br>
	        <c:if test="${!empty recommendList }">
				<c:forEach items="${recommendList }" var="dto" begin="0" end="3">
			        <div class="col-md-3">
			        	<a href="<%=request.getContextPath() %>/travel_cont.do?num=${dto.getTravel_num()}">
			        		<img src="<%=request.getContextPath() %>/resources/image_package/${dto.getTravel_image() }"
										width="300" height="200" style="margin-bottom: 10px;">
							<br>
							<span style="font-size: 16px;"><b>${dto.getTravel_name()}</b></span>
							<br>
							<span style="font-size: 13px;">${dto.getTravel_cont()}</span>
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
	        
	    </div> --%>
	    
	</div>
	<br>
	
	<jsp:include page="include/footer.jsp" />
	

</body>
</html>