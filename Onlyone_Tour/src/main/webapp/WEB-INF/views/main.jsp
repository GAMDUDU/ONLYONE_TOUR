<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<title>온리원투어</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/style.css">
<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>

	
<jsp:include page="include/top.jsp" />
	
 <main class="mt-3">
	<div class="container">
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
		
		<div>
			<p>해외여행</p>

			 <a href="#">
			  <div class="card" style="width: 18rem;">
			  <img src="${path }/resources/image/제주도2.jpg" class="card-img-top">
			   <div class="card-body">
			    <h5 class="card-title">[추천여행]</h5>
			    <p class="card-text"><fmt:formatNumber>1000000</fmt:formatNumber>원</p>
			  </div>
			 </div>
			</a>
		</div>
		
		<div>
			<p>해외여행</p>

			 <a >
			  <div class="card" style="width: 18rem;">
			  <img src="${path }/resources/image/제주도2.jpg" class="card-img-top">
			   <div class="card-body">
			    <h5 class="card-title"></h5>
			    <p class="card-text"><fmt:formatNumber>1000000</fmt:formatNumber>원</p>
			  </div>
			 </div>
			</a>
		</div>
	</div>
 </main>
 
 
  <jsp:include page="include/footer.jsp" />
</body>
</html>
