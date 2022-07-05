<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>항공 예약 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
	#container{
		display:flex;
		flex-direction: column;
		align-items: center;
		margin: 100px 0;
		background-color:skyblue;
	}
	
	#air_image {
		height: 600px;
		background-image: url('resources/image/airport.jpg');
		background-size: cover;
	}
	
	from {
		height: 200px;
		border-radius: 10px;
	}
	
	#people {
		width: 95%;
		height: 50px;
		margin: 10px;
		padding: 10px;
		border: 0;
		border-radius: 5px;
		background-color: #eee;
	}
	
	.input {
		width: 95%;
		height: 50px;
		margin: 10px;
		padding: 10px;
		border: 0;
		border-radius: 5px;
		background-color: #eee;
	}
	
	
	.inputDate {
		width: 46%;
		height: 50px;
		margin-left: 10px;
		padding: 10px;
		border: 0;
		border-radius: 5px;
		background-color: #eee;
	}
	
	.modal-body input[type=button] {
		border: 0;
		border-radius: 100%;
	}
	
	#air_product {
		font-size:20px;
		font-weight:bold;
		margin-bottom: 5px;
		margin-top: 5px;
	}
	
	a { text-decoration:none !important }
	a:hover { text-decoration:none !important }

</style>

</head>
<body>

	<jsp:include page="include/top.jsp" />
	</div>
	<hr width="100%" color="gray">
	
	<div class="container-fluid">
	<c:set var="nlist" value="${nList }" />
	
		<div class="row">
			<div id="air_image" class="col-md-12">
				
				<div class="col-md-8 col-md-offset-2" style="margin-top:350px; height:200px;">
					<form method="post" id="airinfo" class="form-control" style="height:200px;"
							action="<%=request.getContextPath() %>/airport_list.do">
						<br>
						<input type="hidden" name="air_adult_fare">
						<input type="hidden" name="air_child_fare">
						<input type="hidden" name="air_baby_fare">
						
						<table style="width: 100%;">
						<colgroup>
							<col width="40%">
							<col width="5%">
							<col width="40%">
							<col width="15%">
						</colgroup>
							<tr>
								<td>
									<select class="input" name="air_departure">
					                     <c:if test="${empty nlist }">
					                        <option value="">:::국가 목록 없음:::</option>
					                     </c:if>
					                     				                     
					                     <c:if test="${!empty nlist }">
					                     	<option value="">출발지</option>
					                        <c:forEach items="${nlist }" var="ndto">
					                           <option value="${ndto.getAir_nation_val() }">
					                           		${ndto.getAir_nation() }
					                           </option>
					                        </c:forEach>
					                     </c:if>
				                  </select>
								</td>
								<td class="text-center" style="font-size:30px; font-weight:bold;"> ⇌ </td>
								<td>
									<select class="input" name="air_arrival">
										<c:if test="${empty nlist }">
				                        	<option value="">:::국가 목록 없음:::</option>
					                     </c:if>
					                     				                     
					                     <c:if test="${!empty nlist }">
					                     	<option value="">도착지</option>
					                        <c:forEach items="${nlist }" var="ndto">
					                           <option value="${ndto.getAir_nation_val() }">
					                           		${ndto.getAir_nation() }
					                           </option>
					                        </c:forEach>
					                     </c:if>
									</select>
								</td>
								<td rowspan="2" class="text-center">
									<input type="button" class="btn btn-primary btn-lg" id="searchAirport" value="항공권 검색">
								</td>
							</tr>
							<tr>
								<td>
									<input name="air_departure_date" type="date" placeholder="출발날짜" class="inputDate">
									<input name="air_arrival_date" type="date" placeholder="도착날짜" class="inputDate">
								</td>
								<td></td>
								<td>
									<input type="text" id="people" name="people" placeholder="인원수" class="input" 
											data-toggle="modal" data-target="#myModal" readonly>
								</td>				
							</tr>						
						</table>
					</form>
				</div>
				
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				        <h4 class="modal-title text-center" id="myModalLabel">예약 인원 선택 ✈️</h4>
				      </div>
				      <div class="modal-body">
				      	<table style="width: 100%; font-size:18px;">
				      		<tr>
				      			<td class="text-right" style="padding: 20px;">성인</td>
				      			<td>
				      				<input type="button" id="minusAd" value="−"> 
				        			<span id="numberPeople1" style="padding: 10px;">1</span>
				        			<input type="button" id="plusAd" value="+">
				        		</td>
				        	</tr>
				        	
				        	<tr>
				        		<td class="text-right" style="padding: 20px;">소아</td>
				        		<td>
				        			<input type="button" id="minusCh" value="−">
				        			<span id="numberPeople2" style="padding: 10px;">0</span>
				        			<input type="button" id="plusCh" value="+">
				        		</td>
				        	</tr>
				        	
				        	<tr>
				        		<td class="text-right" style="padding: 20px;">유아</td>
				        		<td>
				        			<input type="button" id="minusBa" value="−">
				        			<span id="numberPeople3" style="padding: 10px;">0</span>
				        			<input type="button" id="plusBa" value="+">
				        		</td>
				        	</tr>
				        </table>
				        
				      	 <div class="text-left">
				      	 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      	 	☑️ 예약 가능 최대 인원은 9명이며, 유아는 성인 인원 내에서 선택 가능합니다.<br>
				      	 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      	 	☑️ 성인 : 만 12세 이상, 소아 : 만 2세 ~ 12세 미만, 유아 : 만2 세 미만
				      	 </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary" id="peopleOk">선택완료</button>
				        <button type="button" class="btn btn-default" data-dismiss="modal" id="peopleClose">닫기</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- Modal End -->
								
			</div>
		</div>
		
		<br><br><br><br>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h3>OnlyOneTour Pick! 국내 항공 특가 👓</h3>
				
				<c:set var="alist" value="${aList }" />
				<c:if test="${!empty alist }">
	         		<c:forEach items="${alist }" var="air">
	         			<c:if test="${air.getAir_pnum() == 2}">
							<div class="col-md-3">
							 	<a href="javascript:goAir('${air.getAir_departure() }','${air.getAir_departure_date() }',
							 								'${air.getAir_arrival() }','${air.getAir_arrival_date() }');">
									<img width="280px;" height="210px;" style="margin-bottom:10px; margin-left:10px;"
										src="resources/image/${air.getAir_image() }">
									<div id="air_product">${air.getAir_departure() } ↔ ${air.getAir_arrival() }</div>
									
									${fn:split(air.getAir_departure_date(),'-')[1]}월 ${fn:split(air.getAir_departure_date(),'-')[2]}일
									~
									${fn:split(air.getAir_arrival_date(),'-')[1]}월 ${fn:split(air.getAir_arrival_date(),'-')[2]}일
									<br>
									
									<div id="air_product">${air.getAir_price() }~</div>
								</a>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
			
				
			</div>
		</div>
		
		<br><br><br><br>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h3>항공사 추천 해외 항공 특가 ✈️</h3>
								
				<c:if test="${!empty alist }">
	         		<c:forEach items="${alist }" var="air">
	         			<c:if test="${air.getAir_pnum() == 1}">
							<div class="col-md-3">
							 	<a href="javascript:goAir('${air.getAir_departure() }','${air.getAir_departure_date() }',
							 								'${air.getAir_arrival() }','${air.getAir_arrival_date() }');">
									<img width="280px;" height="210px;" style="margin-bottom: 10px;"
										src="resources/image/${air.getAir_image() }">
									<div id="air_product">${air.getAir_departure() } ↔ ${air.getAir_arrival() }</div>
									
									${fn:split(air.getAir_departure_date(),'-')[1]}월 ${fn:split(air.getAir_departure_date(),'-')[2]}일
									~
									${fn:split(air.getAir_arrival_date(),'-')[1]}월 ${fn:split(air.getAir_arrival_date(),'-')[2]}일
									<br>
									
									<div id="air_product">${air.getAir_price() }~</div>
								</a>
							</div>
						</c:if>
					</c:forEach>
				</c:if>
				
			</div>
		</div>
	</div>
	
	<br><br><br>
	<hr width="100%" color="gray">
	<div class="container">
	<jsp:include page="include/footer.jsp" />
	<br><br><br>
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 	
	<script type="text/javascript">
	
	  	function goAir(go, goDate, back, backDate) {
	  		
	  		$('select[name=air_departure]').val(go);
	  		$('input[name=air_departure_date]').val(goDate);

	  		$('select[name=air_arrival]').val(back);
	  		$('input[name=air_arrival_date]').val(backDate);
	  			  		
	  		$('input[name=air_adult_fare]').attr('value', 1);
	  		$('input[name=air_child_fare]').attr('value', 0);
	  		
	  		$("#airinfo").submit();
	  		
	  	}
	
		$(document).ready(function() {
			 
			$('#myModal').on('shown.bs.modal', function () {
				  $('#myInput').focus()
			});	
			

			// 항공 예약 인원 up/down 
			$('#minusAd').click(function(e) {
				e.preventDefault();

				var num1 = parseInt($('#numberPeople1').text());
				var num2 = parseInt($('#numberPeople2').text());
				var num3 = parseInt($('#numberPeople3').text());
				num1--;
				
				if(num1 <= 0) {
					alert("예약 최소 인원은 성인 1명 이상 입니다.");
					num1 = 1;
				}else if(num1<num3) {
					alert("성인1명에 유아1명만을 예약하실수 있으며, 나머지 유아는 소아로 예약하셔야 합니다.");
					num1++;
				}else {
					$('#numberPeople1').text(num1);
				}
			});
			
			
			$('#plusAd').click(function(e) {
				e.preventDefault();
				
				var num1 = parseInt($('#numberPeople1').text());
				var num2 = parseInt($('#numberPeople2').text());
				var num3 = parseInt($('#numberPeople3').text());
				num1++;
				
				if(num1 >= 10) {
					alert("예약 가능 최대 인원은 9명 입니다.");
					num1 = 9;
				}else if(num1+num2+num3 >= 10) {
					alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
					num1--;
				}else {
					$('#numberPeople1').text(num1);
				}
			});
			
			
			$('#minusCh').click(function(e) {
				e.preventDefault();

				var num2 = parseInt($('#numberPeople2').text());
				num2--;
				
				if(num2 < 0) {
					num2 = 0;
				}else {
					$('#numberPeople2').text(num2);
				}
			});
			
			
			$('#plusCh').click(function(e) {
				e.preventDefault();
				
				var num1 = parseInt($('#numberPeople1').text());
				var num2 = parseInt($('#numberPeople2').text());
				var num3 = parseInt($('#numberPeople3').text());
				num2++;
				
				if(num2 >= 10) {
					alert('예약 가능 최대 인원은 9명 입니다.');
					num2 = 9;
				}else if(num1+num2+num3 >= 10) {
					alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
					num2--;
				}else {
					$('#numberPeople2').text(num2);
				}
			});
			

			$('#minusBa').click(function(e) {
				e.preventDefault();

				var num3 = parseInt($('#numberPeople3').text());
				num3--;
				
				if(num3 < 0) {
					num3 = 0;
				}else {
					$('#numberPeople3').text(num3);
				}
			});
			
			
			$('#plusBa').click(function(e) {
				e.preventDefault();
				
				var num1 = parseInt($('#numberPeople1').text());
				var num2 = parseInt($('#numberPeople2').text());
				var num3 = parseInt($('#numberPeople3').text());
				num3++;
				
				if (num3 >= 10) {
					alert('예약 가능 최대 인원은 9명 입니다.');
					num3 = 9;
				}else if(num1+num2+num3 >= 10) {
					alert("성인/소아/유아 합이 최대 9명까지 가능합니다.");
					num3--;
				}else if(num1<num3) {
					alert("성인1명에 유아1명만을 예약하실수 있으며, 나머지 유아는 소아로 예약하셔야 합니다.");
					num3--;
				}else {
					$('#numberPeople3').text(num3);
				}
			});
			
			
			// 항공 예약 인원 OK버튼
			$('#peopleOk').click(function(e) {
				e.preventDefault();
				
				var num1 = $('#numberPeople1').text();
				var adNum = "성인: " + parseInt(num1);

				var num2 = $('#numberPeople2').text();
				var chNum = parseInt(num2);
				
				if(chNum == 0) {
					chNum = "";
				}else {
					chNum = ", 소아: " + parseInt(num2);
				}

				var num3 = $('#numberPeople3').text();
				var baNum = parseInt(num3);
				
				if(baNum == 0) {
					baNum = "";
				}else {
					baNum = ", 유아: " + parseInt(num3);
				}

				$('#people').val(adNum + chNum + baNum);
				$('#peopleClose').click();
			});
			
			
			// [항공권 검색] 클릭 했을 때
			$("#searchAirport").click(function() {
				
				if ($("select[name='air_departure']").val() == "") {
					alert("출발지를 선택해 주세요.");
					$("select[name='air_departure']").focus();
					return;
				}
				
				if ($("select[name='air_arrival']").val() == "") {
					alert("도착지를 선택해 주세요.");
					$("select[name='air_arrival']").focus();
					return;
				}
				
				if ($("select[name='air_departure']").val() == $("select[name='air_arrival']").val()) {
					alert("출발지와 도착지를 동일하게 선택하실 수 없습니다.");
					$("select[name='air_departure']").focus();
					return;
				}
				
				if ($("input[name='air_departure_date']").val() == "") {
					alert("출발날짜를 선택해 주세요.");
					$("input[name='air_departure_date']").focus();
					return;
				}
				
				if ($("input[name='air_arrival_date']").val() == "") {
					alert("도착날짜를 선택해 주세요.");
					$("input[name='air_arrival_date']").focus();
					return;
				}
				
				
				var today = new Date();

				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);

				var dateString = year + '-' + month  + '-' + day;
				
				
				if (dateString > $("input[name='air_departure_date']").val()) {
					alert("출발날짜는 오늘날짜 이후로 선택해주세요.");
					$("#input[name='air_departure_date']").focus();
					return;
				}
				
				if (dateString > $("input[name='air_arrival_date']").val()) {
					alert("도착날짜는 오늘날짜 이후로 선택해주세요.");
					$("#input[name='air_arrival_date']").focus();
					return;
				}				

				
				if ($("input[name='air_departure_date']").val() >= $("input[name='air_arrival_date']").val()) {
					alert("도착날짜는 출발날짜 이후로 선택해주세요.");
					$("#input[name='air_arrival_date']").focus();
					return;
				}				
				
				
				if ($("input[name='people']").val() == "") {
					alert("인원을 선택해 주세요.");
					$("input[name='people']").focus();
					return;
				}
				
				
				
				var people = $('#people').val();
				var people1 = parseInt(people.substring(4,5));
				var people2 = parseInt(people.substring(11,12));
				var people3 = parseInt(people.substring(18,19));
				
				$('input[name=air_adult_fare]').attr('value', people1);
				
				if(isNaN(people2)) {
					$('input[name=air_child_fare]').attr('value', 0);
				}else {
					$('input[name=air_child_fare]').attr('value', people2);
				}
				
				if(isNaN(people3)) {
					$('input[name=air_baby_fare]').attr('value', 0);
				}else {
					$('input[name=air_baby_fare]').attr('value', people3);
				}
				
				$("#airinfo").submit();
				
			});
			
		});

	</script>
	
</body>
</html>