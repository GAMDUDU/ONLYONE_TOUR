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
	</div>
	<hr width="100%" color="gray">
	<br>
		
	<div class="container-fluid" style="background-color:#fcfcfc;">
	  <div class="row">
		
		<div class="col-md-8 col-md-offset-2">
		<c:set var="list" value="${airlist }" />
		<c:set var="departure" value="${air_departure }" />
		<c:set var="arrival" value="${air_arrival }" />
		<c:set var="adult" value="${air_adult }" />
		<c:set var="child" value="${air_child }" />
		<c:set var="baby" value="${air_baby }" />
		
		<br><br>
		<div class="panel panel-info">		
			<div class = "panel-heading"> 
         		<h3 class = "panel-title" style="font-weight:bold; font-size:20px;">
         			[${air_departure } ⇌ ${air_arrival } 왕복 항공 예약]&nbsp;&nbsp;
         			
         			[선택 인원] <label for="people_info">
         			 성인 : <label for="people_adult">${air_adult }</label>명
					<c:if test="${!empty child and child != 0}">, 소아 : <label for="people_child">${air_child }</label>명</c:if>
					<c:if test="${!empty baby and baby != 0}">, 유아 : <label for="people_baby">${air_baby }</label>명</c:if>
					</label>
					
         		</h3> 
     		</div> 
     		<div class = "panel-body"> 
				<table class="table table-bordered" style="text-align:center;">
				<tr class="active" style="font-weight:bold; font-size:16px;">
					<td colspan="3"> [가는 항공]  ${air_departure } ➜ ${air_arrival }</td>
					<td colspan="3"> [오는 항공]  ${air_arrival } ➜ ${air_departure }</td>
				</tr>
				<tr class="active" style="font-weight:bold; font-size:16px;">
					<td colspan="3" id="go_date"></td>
					<td colspan="3" id="back_date"></td>
				</tr>
				<tr class="active">
					<td>구분</td>
					<td>성인(${air_adult }인 요금)</td>
					<td>소아<c:if test="${!empty child and child != 0}">(${air_child }인 요금)</c:if></td>
					<td>구분</td>
					<td>성인(${air_adult }인 요금)</td>
					<td>소아<c:if test="${!empty child and child != 0}">(${air_child }인 요금)</c:if></td>
				</tr>
				<tr class="warning">
					<td>총운임<br>(유류할증료/<br>제세공과금 포함)</td>
					<td style="vertical-align:middle; font-size:16px; font-weight:bold;" id="go_adult"></td>
					<td style="vertical-align:middle; font-size:16px; font-weight:bold;" id="go_child"></td>
					<td>총운임<br>(유류할증료/<br>제세공과금 포함)</td>
					<td style="vertical-align:middle; font-size:16px; font-weight:bold;" id="back_adult"></td>
					<td style="vertical-align:middle; font-size:16px; font-weight:bold;" id="back_child"></td>
				</tr>	
				<tr class="warning">
					<td colspan="4">총 요금 </td>
					<td colspan="2" style="vertical-align:middle; font-size:16px; color:blue; font-weight:bold;" id="tot"></td>
				</tr>
				</table>
				<span>※ 유아(24개월 미만)는 좌석점유를 하지않으므로 비용이 발생하지 않습니다.</span>
				<span style="float:right;"></span>
				<div class="text-center"><input type="button" class="btn btn-primary btn-lg" id="reserveAirport" value="항공권 예약"></div>
			</div>
		</div>
		
		<br><br>
		
		 <ul class="nav nav-tabs" role="tablist">
		    <li role="presentation" class="active"><a href="#goAir" aria-controls="goAir" role="tab" data-toggle="tab"><b>[가는 항공편 조회]</b></a></li>
		    <li role="presentation"><a href="#backAir" aria-controls="backAir" role="tab" data-toggle="tab"><b>[오는 항공편 조회]</b></a></li>
		 </ul>
  
  	
		<div class="tab-content">
		 <c:if test="${!empty list }">
    	  <div role="tabpanel" class="tab-pane active" id="goAir">
	      	<br>
			<h3>[🛫 가는 항공]</h3>      			         
         	<table class="table table-bordered text-center" >
         		<tr class="info">
         			<th class="text-center">항공사</th>
         			<th class="text-center">항공번호</th>
         			<th class="text-center">출발지</th>
         			<th class="text-center">출발날짜</th>
         			<th class="text-center">출발시간</th>
         			<th class="text-center">도착지</th>
         			<th class="text-center">도착시간</th>
         			<th class="text-center">성인요금</th>
         			<th class="text-center">소아요금</th>
         			<th class="text-center">항공선택</th>
         		</tr>
         	<c:set var="doneLoop" value="false"/>
         	<c:forEach items="${list }" var="air">
         	  <c:if test="${not doneLoop}">
         	  <c:if test="${air.getAir_departure() == air_departure}">
	            <tr>
	               <td> ${air.getAir_airline() } </td>
	               <td> ${air.getAir_name() } </a></td>
	               <td> ${air.getAir_departure() } </td>
	               <td> ${air.getAir_date() } </td>
	               <td> ${air.getAir_departure_date() } </td>
	               <td> ${air.getAir_arrival() } </td>
	               <td> ${air.getAir_arrival_date() } </td>
	               <td> <fmt:formatNumber value="${air.getAir_adult_fare() }" pattern="#,###" />원 </td>
	               <td> <fmt:formatNumber value="${air.getAir_child_fare() }" pattern="#,###" />원 </td>
	               <td>
	               	 <label>
	               		<input type="radio" name="radio_go"
	               		 onclick="javascript:gogo('${air.getAir_airline() }', '${air.getAir_name() }', 
	               		 '${air.getAir_departure() }', '${air.getAir_date() }','${air.getAir_departure_date() }',
	               		 '${air.getAir_arrival() }','${air.getAir_arrival_date() }','${air.getAir_adult_fare() }', '${air.getAir_child_fare() }',
	               		 '${air_adult }', '${air_child }')">
						선택하기
	               	 </label>
	               </td>
 	            </tr>
 	           </c:if>
 	           
 	           <c:if test="${air.getAir_departure() != air_departure && air.getAir_arrival() != air_departure}">
 	             <tr>
	               <td colspan="8" style="text-align:center;">
	               	<h4>가는 항공편이 조회하신 일정에 존재하지 않습니다. 다른 일정으로 조회 부탁드립니다.</h4>
	               </td>
	             </tr>
	             <c:set var="doneLoop" value="true"/>
 	           </c:if>
 	           </c:if>
 	         </c:forEach>
 	        </table>
 	         		 	         
 	     </div>
 	        
 	     <br>
 	   	 <div role="tabpanel" class="tab-pane" id="backAir">
 	         <h3>[🛬 오는 항공]</h3>
 	         <table class="table table-bordered text-center">
 	         	<tr class="info">
         			<th class="text-center">항공사</th>
         			<th class="text-center">항공번호</th>
         			<th class="text-center">출발지</th>
         			<th class="text-center">출발날짜</th>
         			<th class="text-center">출발시간</th>
         			<th class="text-center">도착지</th>
         			<th class="text-center">도착시간</th>
         			<th class="text-center">성인요금</th>
         			<th class="text-center">소아요금</th>
         			<th class="text-center">항공선택</th>
         		</tr>
         	 <c:set var="doneLoop" value="false"/>
 	         <c:forEach items="${list }" var="air">
 	           <c:if test="${not doneLoop}">
 	           <c:if test="${air.getAir_arrival() == air_departure}">
	            <tr>
	               <td> ${air.getAir_airline() } </td>
	               <td> ${air.getAir_name() } </a></td>
	               <td> ${air.getAir_departure() } </td>
	                <td> ${air.getAir_date() } </td>
	               <td> ${air.getAir_departure_date() } </td>
	               <td> ${air.getAir_arrival() } </td>
	               <td> ${air.getAir_arrival_date() } </td>
	        	   <td> <fmt:formatNumber value="${air.getAir_adult_fare() }" pattern="#,###" />원 </td>
	               <td> <fmt:formatNumber value="${air.getAir_child_fare() }" pattern="#,###" />원 </td>
	               <td>
	               	 <label>
	               		<input type="radio" name="radio_back"
	               		 onclick="javascript:back('${air.getAir_airline() }', '${air.getAir_name() }', 
	               		 '${air.getAir_departure() }', '${air.getAir_date() }','${air.getAir_departure_date() }',
	               		 '${air.getAir_arrival() }','${air.getAir_arrival_date() }','${air.getAir_adult_fare() }', '${air.getAir_child_fare() }',
	               		 '${air_adult }', '${air_child }')">
						선택하기
	               	 </label>
	               </td>
 	            </tr>
 	          </c:if>
 	          
 	          <c:if test="${air.getAir_arrival() != air_departure && air.getAir_departure() != air_departure}">
 	             <tr>
	               <td colspan="8" style="text-align:center;">
	               	<h4>오는 항공편이 조회하신 일정에 존재하지 않습니다. 다른 일정으로 조회 부탁드립니다.</h4>
	               </td>
	             </tr>
	             <c:set var="doneLoop" value="true"/>
 	          </c:if>
 	          </c:if>
 	     	</c:forEach>

 	        </table>
 	        <br>
 	     </div>
 	     
 	     <div class = "well well-lg" >
			<h4 style="font-weight:bold;">항공예약 시 안내사항</h4>
			<div stlye="font-size:18px;">
			•  항공권 예약 후 일정/인원/항공시간/항공사/이름 변경이 불가하며 취소 후 재 예약 하셔야 합니다.<br>
			•  항공좌석 수와 특가/할인석 요금은 실시간으로 변동 됩니다.<br>
			•  특가/할인석은 항공사에서 좌석 예약률에 따라 실시간 할인요금을 제공해드리는 좌석으로 판매운임과 취소수수료가 상이하며 탑승하는 좌석등급의 차이는 없습니다.<br>
			•  신분할인을 선택하여 발권한 항공권은 탑승수속 시 관련 증빙 서류를 제시해주셔야 합니다.<br>
			•  특가/할인석은 개인신분할인과 중복으로 적용되지 않으며, 개인신분할인 오적용시 발생되는 차액금은 본인 부담 하셔야 합니다.<br>
			•  임산부 고객의 경우 해당 항공사로 사전에 탑승 기준을 반드시 확인 하시기 바랍니다.<br>
			•  반려동물을 동반하시는 경우 해당 항공사 예약센터로 사전에 동반 가능여부를 확인하시기 바랍니다.<br>
			•  일정은 항공사의 부득이한 사유 및 기상악화 등으로 사전예고 없이 변경될 수 있습니다. (모든 조건은 항공사 규정)<br>
			</div>
		 </div>
		 
		 <form method="post" id="airinfo"
				action="<%=request.getContextPath() %>/airport_reserve.do">
				
			<input type="hidden" name="re_people" value="">
			<input type="hidden" name="re_info" value="">
			
			<input type="hidden" name="re_go_air" value="">
			<input type="hidden" name="re_go_num" value="">
			<input type="hidden" name="re_go" value="">
			<input type="hidden" name="re_go_date" value="">
			
			<input type="hidden" name="re_back_air" value="">
			<input type="hidden" name="re_back_num" value="">
			<input type="hidden" name="re_back" value="">
			<input type="hidden" name="re_back_date" value="">
			
			<input type="hidden" name="re_mem_id" value="${member_id}">
			<input type="hidden" name="re_mem_name" value="${member_name}">
			<%-- <input type="hidden" name="re_mem_phone" value="${member_phone}">
			<input type="hidden" name="re_mem_email" value="${member_email}"> --%>
			
			<input type="hidden" name="re_go_adult" value="">
			<input type="hidden" name="re_go_child" value="">
			<input type="hidden" name="re_back_adult" value="">
			<input type="hidden" name="re_back_child" value="">
			<input type="hidden" name="re_account" value="">

		</form>
 
	    </c:if>
	

		   <c:if test="${empty list }">
		   <br><br><br>
		   	 <div class="alert alert-danger" style="text-align:center;">
		   	 <br>
		   		<h4>조회하신 일정과 일치하는 항공편이 존재하지 않습니다.</h4>
		   		<h4>다른 일정으로 조회 부탁드립니다.</h4>
		   		<a class="btn btn-danger"
		   			href="<%=request.getContextPath()%>/airport.do">
		   			항공편 다시 조회하러 가기
		   		</a>
		   	 </div>
		   </c:if>
		    
		   <br><br>
	 	</div>
	  </div>
	</div>
	
	<br><br>
	<hr width="100%" color="gray">
	<div class="container">
	<jsp:include page="include/footer.jsp" />
	<br><br><br>
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 	
	<script type="text/javascript">
	
	  $(document).ready(function() {
		  
			$('#reserveAirport').click(function(){
			<%
				if(session.getAttribute("member_id") == null){ 
			%>
					alert("로그인이 필요한 서비스 입니다.\n로그인을 먼저 진행해 주세요.");
					return;
			<%
				}else{
			%>
				if($('input:radio[name=radio_go]').is(':checked') === false){
					alert("가는 항공편을 선택해주세요");
					
				}else if($('input:radio[name=radio_back]').is(':checked') === false){
					alert("오는 항공편을 선택해주세요");
					
				}else{
					
				  var result = confirm('정말 예약하시겠습니까?');
				  
				  if(result) {
					  
					// alert("test");
					
					
					var adult = parseInt($("label[for='people_adult']").text());
					var people_info = "성인 : " + adult + "명";
					
					var child;
					if($("label[for='people_child']").text() != "") {
						child = parseInt($("label[for='people_child']").text());
						people_info = people_info + ", 소아 : " + child + "명";
					}else {
						child = 0;
					}
					
					var baby;
					if($("label[for='people_baby']").text() != "") {
						baby = parseInt($("label[for='people_baby']").text());
						people_info = people_info + ", 유아 : " + baby + "명";
					}else {
						baby = 0;
					}
					
					var people = adult + child + baby;
					
					$('input[name="re_people"]').attr('value', people);
					$('input[name="re_info"]').attr('value', people_info);
					
					$("#airinfo").submit();	  
				  } 
				}
			<%
				}
			%>
			});
	  	});
	  
		$('#myTab a').click(function (e) {
		  e.preventDefault()
		  $(this).tab('show')
		});
		
		// 가는 항공편
		function gogo(air, air_name, start, start_date, start_time,
					end, end_time, adult_fare, child_fare, adult, child){
			
			$('#go_date').text("[" + air +"] [" + air_name + "]  " + start_date + " (" + start_time 
								+ " ~ " + end_time + ")");
			
			$('#go_adult').text("");
			
			var go_adult = adult_fare * adult;
			$('#go_adult').text(numberWithCommas(go_adult) +"원");
			
			var go_child = child_fare * child;
			$('#go_child').text(numberWithCommas(go_child) +"원");
			
			var back_adult;
			var back_child;
			
			if(isNaN(parseInt($('#back_adult').text().split("원")[0]))) {
				back_adult = 0;
			}else {
				back_adult = $('#back_adult').text().split("원")[0].toString().replace(/,/g, '');
			}
			
			if(isNaN(parseInt($('#back_child').text().split("원")[0]))) {
				back_child = 0;
			}else {
				back_child = $('#back_child').text().split("원")[0].toString().replace(/,/g, '');
			}
			
			
			var tot = parseInt(go_adult) + parseInt(go_child) + parseInt(back_adult) + parseInt(back_child);
			$('#tot').text(numberWithCommas(tot)+"원");
			
			$('input[name="re_go_air"]').attr('value', air);
			$('input[name="re_go_num"]').attr('value', air_name);
			$('input[name="re_go"]').attr('value', start + "-" + end);
			$('input[name="re_go_date"]').attr('value', start_date + " (" + start_time + " ~ " + end_time + ")");
			$('input[name="re_go_adult"]').attr('value', numberWithCommas(go_adult) +"원");
			$('input[name="re_go_child"]').attr('value', numberWithCommas(go_child) +"원");
			$('input[name="re_account"]').attr('value', numberWithCommas(tot) +"원");
			
			
		} 
	
		
		// 오는 항공편
		function back(air, air_name, start, start_date, start_time,
				end, end_time, adult_fare, child_fare, adult, child){
		
			$('#back_date').text("[" + air +"] [" + air_name + "]  " + start_date + " (" + start_time 
								+ " ~ " + end_time + ")");
			
			$('#back_adult').text("");
			
			var back_adult = adult_fare * adult;
			$('#back_adult').text(numberWithCommas(back_adult) +"원");
			
			var back_child = child_fare * child;
			$('#back_child').text(numberWithCommas(back_child) +"원");
			
			var go_adult;
			var go_child
			if(isNaN(parseInt($('#go_adult').text().split("원")[0]))) {
				go_adult = 0;
			}else {
				go_adult = $('#go_adult').text().split("원")[0].toString().replace(/,/g, '');
			}
			
			if(isNaN(parseInt($('#go_child').text().split("원")[0]))) {
				go_child = 0;
			}else {
				go_child = $('#go_child').text().split("원")[0].toString().replace(/,/g, '');
			}

			var tot = parseInt(go_adult) + parseInt(go_child) + parseInt(back_adult) + parseInt(back_child);
			$('#tot').text(numberWithCommas(tot)+"원");

			
			$('input[name="re_back_air"]').attr('value', air);
			$('input[name="re_back_num"]').attr('value', air_name);
			$('input[name="re_back"]').attr('value', start + "-" + end);
			$('input[name="re_back_date"]').attr('value', start_date + " (" + start_time + " ~ " + end_time + ")");
			$('input[name="re_back_adult"]').attr('value', numberWithCommas(back_adult) +"원");
			$('input[name="re_back_child"]').attr('value', numberWithCommas(back_child) +"원");
			$('input[name="re_account"]').attr('value', numberWithCommas(tot) + "원");

		}
		
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
		
	</script>
</body>
</html>