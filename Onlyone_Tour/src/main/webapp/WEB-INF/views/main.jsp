<%@page import="com.travel.model.TravelDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.travel.model.TravelDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
	
<title>온리원투어</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/main.css?after">
<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">
	$(function() {
		 $("input[id='제주도']").on({
			    'click': function(){
			        $('#one').attr('src','${path }/resources/image/제주여행1.jpg');
			        $('#two').attr('src','${path }/resources/image/제주여행2.jpg');
			        $('#three').attr('src','${path }/resources/image/제주여행3.jpg');
			        $('#one1').text('제주 3일 #노형슈퍼마켙 #성이시돌목장 #사려니숲길');
			        $('#one2').text('#가파도#노팁노옵션#노형슈퍼마켙');
			        $('#one3').html('<fmt:formatNumber>439000</fmt:formatNumber>원~');
			        $('#two1').text('[에어카텔] 제주 3일 메종글래드 #중형렌트카 #2인1실');
			        $('#two2').text('#특1급#제주시내#에어카텔');
			        $('#two3').html('<fmt:formatNumber>432900</fmt:formatNumber>원~');
			        $('#three1').text('[골프/제주] 2일 #36홀라운드 #동일골프장 18홀*2회');
			        $('#three2').text('#1박2일골프텔#서귀포골프');
			        $('#three3').html('<fmt:formatNumber>355000</fmt:formatNumber>원~');
			        
			    	// 종엽 링크 추가
			    	$('#a1').attr('href','<%=request.getContextPath() %>/travel_cont.do?num=13');
			    	$('#a2').attr('href','<%=request.getContextPath() %>/travel_cont.do?num=14');
			    	$('#a3').attr('href','<%=request.getContextPath() %>/travel_cont.do?num=15');
			    }
			});
		 $("input[id='울릉도']").on({
			    'click': function(){
			        $('#one').attr('src','${path }/resources/image/울릉도여행1.jpg');
			        $('#two').attr('src','${path }/resources/image/울릉도여행2.jpg');
			        $('#three').attr('src','${path }/resources/image/울릉도여행3.jpg');
			        $('#one1').text('[강릉항개별집결] 울릉도 3일 #독도포함 #비치온관광호텔 #울릉도별미식포함 #나물세트제공');
			        $('#one2').text('#프리미엄급호텔#나물세트제공#독도관광포함');
			        $('#one3').html('<fmt:formatNumber>479000</fmt:formatNumber>원~');
			        $('#two1').text('[고품격] 울릉도 3일 #프리미엄급호텔 #특식제공 #노쇼핑 #단독차량육로관광');
			        $('#two2').text('#프리미엄급호텔#하나투어단독상품');
			        $('#two3').html('<fmt:formatNumber>507000</fmt:formatNumber>원~');
			        $('#three1').text('[포항신항개별집결] 울릉도 4일 #크루즈1박');
			        $('#three2').text('#울릉도2박 #비치온 #관음도포함');
			        $('#three3').html('<fmt:formatNumber>359000</fmt:formatNumber>원~');
			        
			    	// 종엽 링크 추가
			    	$('#a1').attr('href','<%=request.getContextPath() %>/travel_cont.do?num=16');
			    	$('#a2').attr('href','<%=request.getContextPath() %>/travel_cont.do?num=17');
			    	$('#a3').attr('href','<%=request.getContextPath() %>/travel_cont.do?num=18');
			    }
			});
		 $("input[id='통영']").on({
			    'click': function(){
			        $('#one').attr('src','${path }/resources/image/통영여행1.jpg');
			        $('#two').attr('src','${path }/resources/image/통영여행2.jpg');
			        $('#three').attr('src','${path }/resources/image/통영여행3.jpg');
			        $('#one1').text('[내나라여행] 남해안일주 4일 #베스트셀러 #여수/남해/거제/부산 #VIP전담가이드&기사배정');
			        $('#one2').text('#프리미엄#고품격#효도여행');
			        $('#one3').html('<fmt:formatNumber>870000</fmt:formatNumber>원~');
			        $('#two1').text('거제 3일#내차로자유여행#거제삼성호텔#거제씨월드#통영루지체험포함');
			        $('#two2').text('#자유여행#언택트여행#커플맞춤여행');
			        $('#two3').html('<fmt:formatNumber>245000</fmt:formatNumber>원~');
			        $('#three1').text('[KTX-2박] 한려수도 3일 #남해안 완전일주');
			        $('#three2').text('#거제/통영/남해/여수');
			        $('#three3').html('<fmt:formatNumber>339000</fmt:formatNumber>원~');
			        
			    	// 종엽 링크 추가
			    	$('#a1').attr('href','<%=request.getContextPath() %>/travel_cont.do?num=19');
			    	$('#a2').attr('href','<%=request.getContextPath() %>/travel_cont.do?num=20');
			    	$('#a3').attr('href','<%=request.getContextPath() %>/travel_cont.do?num=21');
			    }
			});
	});
	
</script>
</head>
<body>

	

<jsp:include page="include/top.jsp" />
	
 <main id="main">

	<div class="container wide">
	  <div class="contents">
	  
		<div data-system-property-type="children" data-component="system-container"
			class="children-slot sys-container root-container"
			style="width: 100%;position: relative;" data-v-4de19cca data-v-e9ab604c data-v-77a28786>
		
		<div data-component="theme-container" data-v-77a28786 style="position: relative; display: block;">
		  <div data-system-property-type="children" data-v-4de19cca class="children-slot sys-container" style="width: 100%;">	
			 <div class="submain" style="position: relative;">
				
		<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="${path }/resources/image/자유의여신상1.jpg" class="d-block w-100" width="500" height="500">
		    </div>
		    <div class="carousel-item">
		      <img src="${path }/resources/image/유럽-베니스1.jpg" class="d-block w-100" width="500" height="500">
		    </div>
		    <div class="carousel-item">
		      <img src="${path }/resources/image/제주도1.jpg" class="d-block w-100" width="500" height="500" >
		    </div>
		    <div class="carousel-item">
		      <img src="${path }/resources/image/비행기1.jpg" class="d-block w-100" width="500" height="500" >
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
		</div>
	 			
	 <div class="submain mt100" data-v-4de19cca style="position: relative;">
		<div class="package big">
			<strong class="tit">여름 휴가로가기 좋은 해외여행지!</strong>
			 <div class="package1 mt30">
			  <div class="item_list package2 swiper-container swiper-container-pointer-events">
				<div class="card1" style="width: 18rem;">
					<a href="<%=request.getContextPath() %>/travel_cont.do?num=10" class="card-link">
					  <img src="${path }/resources/image/다낭.jpg" class="card-img-top">
					  <div class="card-body">
					    <h5 class="card-title"><b>다낭/호이안 4~6일 #베스트셀러 #시내호텔 #바나산</b></h5>
					     <span class="badge rounded-pill bg-light text-dark">#바나산</span>
					     <span class="badge rounded-pill bg-light text-dark">#호이안야경투어</span> 
					     <br>
	   					 <strong> <fmt:formatNumber>1149900</fmt:formatNumber>원~</strong>
					  </div>
				  	</a>
				</div>
				
				<div class="card2" style="width: 18rem;">
					<a href="<%=request.getContextPath() %>/travel_cont.do?num=11" class="card-link">
					  <img src="${path }/resources/image/보라카이.jpg" class="card-img-top">
					  <div class="card-body">
					    <h5 class="card-title"><b>보라카이 4,5,6일 #헤난라군</b></h5>
					     <span class="badge rounded-pill bg-light text-dark">#세일링보트</span>
					     <span class="badge rounded-pill bg-light text-dark">#호핑투어</span> 
					     <br>
	   					 <strong> <fmt:formatNumber>1041000</fmt:formatNumber>원~</strong>
				 	 </div>
				  </a>
				</div>
				
				<div class="card3" style="width: 18rem;">
					<a href="<%=request.getContextPath() %>/travel_cont.do?num=3" class="card-link">
					  <img src="${path }/resources/image/괌.jpg" class="card-img-top">
					  <div class="card-body">
					    <h5 class="card-title"><b>괌 4~6일 #두짓타니리조트 #투몬시내중심 #미니바</b></h5>
					    
					     <span class="badge rounded-pill bg-light text-dark">#럭셔리 호캉스</span>
					     <span class="badge rounded-pill bg-light text-dark">#오션뷰</span> 
					     <br>
					     
	   					 <strong> <fmt:formatNumber>3690000</fmt:formatNumber>원~</strong>
   					 	</div>
   					 </a>
				</div>
				
				
				<div class="card4" style="width: 18rem;">
				<a href="<%=request.getContextPath() %>/travel_cont.do?num=12" class="card-link">
					  <img src="${path }/resources/image/푸켓.jpg" class="card-img-top">
					  <div class="card-body">
					    <h5 class="card-title"><b>푸껫 5~6일#힐링여행 #1일1마사지</b></h5>
					    
					     <span class="badge rounded-pill bg-light text-dark">#미식여행</span>
					     <span class="badge rounded-pill bg-light text-dark">#힐링여행</span> 
					     <br>
					     
	   					 <strong> <fmt:formatNumber>1389000</fmt:formatNumber>원~</strong>
	   					 
					  </div>
				  </a>
				</div>
			</div>
			</div>
		 </div>		
		</div>
	   </div>
	  </div>	
	  </div>
	  
			<div data-component="theme-container" data-v-77a28786 style="position: relative; display: block;">
			  <div data-v-4de19cca data-system-property-type="children" class="children-slot sys-container" style="width: 100%;">	
				 <div class="submain" data-v-4de19cca style="position: relative;">
					<div class="item item6">
						<div class="a1" style="background: url('${path }/resources/image/무지개.jpg') 0px 0px no-repeat;" >
							<div class="text_title big">
								<strong class="tit">꼭 가봐야 하는 <br>국내 여행지!</strong>
							</div>
							<div class="photo_tab">
								<span class="photo_holder text">
									<input type="radio" id="제주도" name="tab_prod" class="input_radio">
									<label for="제주도" class="label_radio" style="cursor: pointer;">
										제주도
									</label>
								</span>	
							</div>
							
							<div class="photo_tab">
								<span class="photo_holder text">
									<input type="radio" id="울릉도" name="tab_prod" class="input_radio">
									<label for="울릉도" class="label_radio" style="cursor: pointer;">
										울릉도
									</label>
								</span>	
							</div>
							
							<div class="photo_tab">
								<span class="photo_holder text">
									<input type="radio" id="통영" name="tab_prod" class="input_radio">
									<label for="통영" class="label_radio" style="cursor: pointer;">
										통영
									</label>
								</span>	
							</div>
						</div>	
							
							<div class="a2">
								<div class="prod_list row">
									<ul class="type">
										<li style="cursor: pointer;" class="li">
											<a href="<%=request.getContextPath() %>/travel_cont.do?num=13" id="a1">
											<div class="img">
												<img src="${path }/resources/image/제주여행1.jpg" class="img1" id="one">
											</div>
											<div class="ht1">
												<div class="name_wrap">
													<strong class="item_title" id="one1">제주 3일 #노형슈퍼마켙 #성이시돌목장 #사려니숲길</strong>
													<p class="item_text" id="one2">#가파도#노팁노옵션#노형슈퍼마켙</p>
												</div>
												<div class="price">
												 	<strong class="price_1" id="one3"><fmt:formatNumber>439000</fmt:formatNumber>원~</strong>
												</div>
											</div>
											</a>
										</li>
										
										<li style="cursor: pointer;" class="li">
											<a href="<%=request.getContextPath() %>/travel_cont.do?num=14" id="a2">
											<div class="img">
												<img src="${path }/resources/image/제주여행2.jpg" class="img1" id="two">
											</div>
											<div class="ht1">
												<div class="name_wrap">
													<strong class="item_title" id="two1">[에어카텔] 제주 3일 메종글래드 #중형렌트카 #2인1실</strong>
													<p class="item_text" id="two2">#특1급#제주시내#에어카텔</p>
												</div>
												<div class="price">
												 	<strong class="price_1" id="two3"><fmt:formatNumber>432900</fmt:formatNumber>원~</strong>
												</div>
											</div>
											</a>
										</li>
										
										<li style="cursor: pointer;" class="li">
											<a href="<%=request.getContextPath() %>/travel_cont.do?num=15" id="a3">
											<div class="img">
												<img src="${path }/resources/image/제주여행3.jpg" class="img1" id="three">
											</div>
											<div class="ht1">
												<div class="name_wrap">
													<strong class="item_title" id="three1">[골프/제주] 2일 #36홀라운드 #동일골프장 18홀*2회</strong>
													<p class="item_text" id="three2">#1박2일골프텔#서귀포골프</p>
												</div>
												<div class="price">
												 	<strong class="price_1" id="three3"><fmt:formatNumber>355000</fmt:formatNumber>원~</strong>
												</div>
											</div>
											</a>
										</li>										
									</ul>
								</div>
							</div>						
						</div>
					</div>
				</div>
			  </div> <!-- 두번째 마지막 -->
	
	<!-- 세번째  -->
	<div data-component="theme-container" data-v-77a28786 style="position: relative; display: block;">
	  <div data-v-4de19cca data-system-property-type="children" class="children-slot sys-container" style="width: 100%;">	
	  </div>
	</div>
	
	<div data-component="theme-container" data-v-77a28786 style="position: relative; display: block;">
	  <div data-v-4de19cca data-system-property-type="children" class="children-slot sys-container" style="width: 100%;">	
	  <div class="submain" data-v-77a28786  data-v-4de19cca style="position: relative;">
		<div class="inr co">
			<div>
				<div class="text_title big">
					<strong class="tit">온리원 투어가 추천하는 여행지</strong>
				</div>
				
				<div class="prod_slide">
				<div class="prod_list row swiper-container col4 prevNext v-swiper2 swiper-container-initialized swiper-container-horizontal swiper-container-pointer-events">
				<ul class="type swiper" id="slides" aria-live="polite">
				
				<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next"style="cursor: pointer; width: 282px; margin-right: 24px;" role="group">
					<a href="<%=request.getContextPath() %>/travel_cont.do?num=24">
						<div class="img">
						 <img src="${path }/resources/image/busan.jpg" class="img1" id="three">
						</div>
						<div class="ht1">
							<div class="name_wrap">
								<strong class="item_title" id="three1">[KTX-2박] 부산/거제/통영/남해로 떠나는 쪽빛바다 휴(休) 감성여행</strong>
							</div>
						<div class="price">
							<strong class="price_1" id="three3"><fmt:formatNumber>319000</fmt:formatNumber>원~</strong>
						</div>
						</div>
					</a>
				</li>
				
				<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" style="cursor: pointer; width: 282px; margin-right: 24px;" role="group">
					<a href="<%=request.getContextPath() %>/travel_cont.do?num=15">
						<div class="img">
						 <img src="${path }/resources/image/제주여행3.jpg" class="img1" id="three">
						</div>
						<div class="ht1">
							<div class="name_wrap">
								<strong class="item_title" id="three1">[골프/제주] 2일 #36홀라운드 #동일골프장 18홀*2회</strong>
							</div>
						<div class="price">
							<strong class="price_1" id="three3"><fmt:formatNumber>355000</fmt:formatNumber>원~</strong>
						</div>
						</div>
					</a>
				</li>
				
				<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" style="cursor: pointer; width: 282px; margin-right: 24px;" role="group">
					<a href="<%=request.getContextPath() %>/travel_cont.do?num=23">
						<div class="img">
						 <img src="${path }/resources/image/ulsan.jpg" class="img1" id="three">
						</div>
						<div class="ht1">
							<div class="name_wrap">
								<strong class="item_title" id="three1">[대구출발] 울산/밀양 당일투어</strong>
							</div>
						<div class="price">
							<strong class="price_1" id="three3"><fmt:formatNumber>59000</fmt:formatNumber>원~</strong>
						</div>
						</div>
					</a>
				</li>
				
				<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" style="cursor: pointer; width: 282px; margin-right: 24px;" role="group">
					<a href="<%=request.getContextPath() %>/travel_cont.do?num=22">
						<div class="img">
						 <img src="${path }/resources/image/yeosu.jpg" class="img1" id="three">
						</div>
						<div class="ht1">
							<div class="name_wrap">
								<strong class="item_title" id="three1">[연합상품] 여수/남해 2일 #오동도 #향일암 #여수해상케이블카</strong>
							</div>
						<div class="price">
							<strong class="price_1" id="three3"><fmt:formatNumber>147000</fmt:formatNumber>원~</strong>
						</div>
						</div>
					</a>
				</li>
				
				<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" id="swiper-slide" style="cursor: pointer; width: 282px; margin-right: 24px;" role="group">
					<a href="<%=request.getContextPath() %>/travel_cont.do?num=16">
						<div class="img">
						 <img src="${path }/resources/image/울릉도여행1.jpg" class="img1" id="three">
						</div>
						<div class="ht1">
							<div class="name_wrap">
								<strong class="item_title" id="three1">[강릉항개별집결] 울릉도 3일 #독도포함 #비치온관광호텔 #울릉도별미식포함 #나물세트제공</strong>
							</div>
						<div class="price">
							<strong class="price_1" id="three3"><fmt:formatNumber>479000</fmt:formatNumber>원~</strong>
						</div>
						</div>
					</a>
				</li>
				
				<li class="swiper-slide swiper-slide-duplicate swiper-slide-duplicate-next" style="cursor: pointer; width: 282px; margin-right: 24px;" role="group">
					<a href="<%=request.getContextPath() %>/travel_cont.do?num=20">
						<div class="img">
						 <img src="${path }/resources/image/통영여행2.jpg" class="img1" id="three">
						</div>
						<div class="ht1">
							<div class="name_wrap">
								<strong class="item_title" id="three1">거제 3일#내차로자유여행#거제삼성호텔#거제씨월드#통영루지체험포함</strong>
							</div>
						<div class="price">
							<strong class="price_1" id="three3"><fmt:formatNumber>245000</fmt:formatNumber>원~</strong>
						</div>
						</div>
					</a>
				</li>
				
				</ul>
				<a href="#none" class="prev" tabindex="0" role="button"><span class="blind">이전</span></a>
				<a href="#none" class="next" tabindex="0" role="button"><span class="blind">다음</span></a>
				<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
				</div>
				</div>
				
			</div>		
		</div>
	   </div>
	   </div>
	  </div>

	<div data-component="theme-container" data-v-77a28786 style="position: relative; display: block;">
	  <div data-v-4de19cca data-system-property-type="children" class="children-slot sys-container" style="width: 100%;">	
	  <div class="submain" data-v-77a28786  data-v-4de19cca style="position: relative;">
	  	<div class="item p10">
	  		<div class="inr"><ul></ul></div>
	  	</div>
	  	<div class="item p11">
	  		<div class="inr">
	  			<div class="ly_wrap">
	  				<div class="inr a">
	  					<div class="text_title big">
							<strong class="tit">온리원 투어 <br>고객센터</strong>
						</div>
						 	<strong class="tel">0000-0000</strong>
						 <a href="#" class="txt qu">자주 찾는 질문 <i class="fa-solid fa-angle-right"></i></a>
	  				</div>
	  				<div class="inr b">
	  					<ul>
	  						<li><strong>해외여행 문의</strong></li>
	  						<ul>
	  							<li>평일: 09:00~18:00</li>
	  						</ul>
	  					</ul>
	  					<ul>
	  						<li><strong>상담번호 안내</strong></li>
	  						<ul>
	  						<li>1번 예약상담 및 조회</li>
	  						<li>2번 마일리지,제휴카드,상품권 및 기타문의</li>
	  						</ul>
	  					</ul>
	  				</div>
	  				<div class="inr c">
	  					<ul>
	  						<li><strong>국내여행/기업출장 단체문의</strong></li>
	  						<ul>
	  							<li>평일: 09:00~18:00</li>
	  						</ul>
	  					</ul>
	  				</div>
	  			</div>
	  		</div>
	  	</div>
	  </div>
	 </div>
    </div>
	  
	  
	  </div>
	</div>
   </div>
 </main>
	
 
 <jsp:include page="include/footer.jsp" />
 

<script type="text/javascript" src="/resources/js/slide.js"></script> 


</body>
</html>