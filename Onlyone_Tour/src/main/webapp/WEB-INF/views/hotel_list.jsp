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
		margin-left: -23px;
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
		margin: -200px -30px 0 0;
	}
	
	.content #tabimg3 {
		float: right;
		margin: -200px -30px 0 0;
	}
	
	.hashbox {
		height: 24px;
	    padding: 2px 8px;
	    border: 1px solid #666;
	    background: #fff;
	    line-height: 22px;
	    font-size: 12px;
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
    		<input name="keyword" class="input" placeholder="어디로 여행가세요?">
    		<input type="submit" value="검색" class="redbtn">    	
    	</form>
      <div class="swiper-wrapper">
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_hotel/hotel_europe.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_hotel/hotel_one.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_hotel/moldive.jpg"></div>
        <div class="swiper-slide"><img src="<%=request.getContextPath() %>/resources/image_hotel/gwam.jpg"></div>
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
						    <div class="row">
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=7">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/제주 해비치 호텔.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">서귀포</span>
										<br>
										<span style="font-size: 16px;"><b>해비치 호텔 & 리조트 제주</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="580800" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">서울시내중심</span>
									</a>	
						        </div>
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=8">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/그랜드 하얏트 제주.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">제주</span>
										<br>
										<span style="font-size: 16px;"><b>그랜드 하얏트 제주</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="558800" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">올인원호캉스</span>
									</a>	
						        </div>
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=9">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/롯데 호텔 제주.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">서귀포</span>
										<br>
										<span style="font-size: 16px;"><b>롯데호텔 제주</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="601200" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">낭만휴양지</span>
									</a>	
						        </div>
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=10">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/라마다 플라자 제주.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">제주</span>
										<br>
										<span style="font-size: 16px;"><b>라마다 플라자 제주 오션 프론트</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="300000" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">갓성비호캉스</span>
									</a>	
						        </div>
						    </div>
						</div>
						
						<div class="content-dis">
							<div class="row">
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=11">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/서울 신라호텔.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">서울</span>
										<br>
										<span style="font-size: 16px;"><b>신라 호텔 서울</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="470400" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">럭셔리호캉스</span>
									</a>	
						        </div>
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=12">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/신라스테이 광화문.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">서울</span>
										<br>
										<span style="font-size: 16px;"><b>신라스테이 광화문</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="138000" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">서울중심위치</span>
									</a>	
						        </div>
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=13">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/라마다 앙코르 해운대.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">부산</span>
										<br>
										<span style="font-size: 16px;"><b>라마다 앙코르 해운대</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="161000" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">갓성비호캉스</span>
									</a>	
						        </div>
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=14">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/파라다이스 시티 인천.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">인천</span>
										<br>
										<span style="font-size: 16px;"><b>파라다이스 시티 인천</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="755440" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">꿈의 휴양지</span>
									</a>	
						        </div>
						    </div>
						</div>
						
						<div class="content-dis">
							<div class="row">
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=15">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/호텔 토스카나.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">서귀포</span>
										<br>
										<span style="font-size: 16px;"><b>토스카나호텔</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="460880" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">이탈리아무드</span>
									</a>	
						        </div>
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=16">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/쏠비치 삼척.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">삼척</span>
										<br>
										<span style="font-size: 16px;"><b>쏠비치 삼척</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="171500" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">한국의산토리니</span>
									</a>	
						        </div>
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=17">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/동강시스타 리조트.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">영월</span>
										<br>
										<span style="font-size: 16px;"><b>동강시스타 리조트</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="219450" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">유러피안리조트</span>
									</a>	
						        </div>
						        <div class="col-md-3" style="float: left; width: 25%; padding:20px;">
						        	<a href="<%=request.getContextPath() %>/hotel_cont.do?num=18">
						        		<img src="<%=request.getContextPath() %>/resources/image_hotel/한신마리나호텔.jpg"
													width="250" height="170" style="margin-bottom: 10px;">
										<br>
										<span style="font-size: 13px; color: gray">통영</span>
										<br>
										<span style="font-size: 16px;"><b>한신마리나호텔&리조트</b></span>
										<br>
										<span style="font-size: 20px; line-height: 1.7em;"><b><fmt:formatNumber value="244320" /></b></span>
										<span style="font-size: 16px;">원~</span><br>
										<span class="hashbox">한국의발리</span>
									</a>	
						        </div>
						    </div>					
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