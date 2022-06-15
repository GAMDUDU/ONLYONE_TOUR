<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>onlyone 투어</title>
	<style type="text/css">
	.reserve-travel-notice li{font-size: 10px}
	.txt{font-size: 4px}
	</style>
</head>
<body>
<c:set var="dto" value="${Cont }" />
<c:set var="mem" value="${Member }" />

<form method="post" action="<%=request.getContextPath() %>/reserve_travel_ok.do?no=${dto.travel_num}">
	<!-- 패키지 예약 페이지  -->

<div>
	<div class="reserve-travel">
		<h2>예약하기</h2>
		<ul>
			<li><a class="infor-items" style="font-weight: bold; color: blue" ><i class="fa-solid fa-clipboard-check">예약정보확인</i></a></li>
			<li><a class="infor-items">￦옵션정보/약관/결제</a></li>
			<li><a class="infor-items">☑예약완료</a></li>
		</ul>
	</div>
	
	<input type="hidden" name="travel_num" value="${dto.travel_num }">
	
	
	
	
	<div class="reserve-travel-cont">
		<h2>${dto.travel_name }</h2>
		<table border="1" cellspacing="0" width="650">
			<tr>
				<th>여행기간</th>
				<td>${dto.travel_departure_date.substring(0,13)} ~ ${dto.travel_return_date.substring(0,13)} / ${dto.travel_calender }</td>
			</tr>

			<tr>
				<th>항공편</th>
				<td>${dto.travel_departure_airport } > ${dto.travel_arrival_airport }&nbsp;&nbsp;&nbsp;&nbsp;${dto.travel_air }<br>
				한국출발 : ${dto.travel_departure_date.substring(0,20) }<br> 
				한국도착 : ${dto.travel_return_date.substring(25,41) }
				</td>

			</tr>

			<tr>
				<th>이용호텔</th>
				<td>${dto.travel_room }</td>
			</tr>
		</table>
	</div>
	

	<div class="reserve-travel-member">
		<h2>예약자정보</h2>
		<table border="1" cellspacing="0" width="650">
			<tr>
				<th>이름</th>
				<td>${mem.member_name }</td>
				
				<th>생년월일</th>
				<td>${mem.member_birth.substring(0,10) }</td>
			</tr>
			
			<tr>
				<th>이메일</th>
				<td>${mem.member_email }</td>
				
				<th>휴대폰번호</th>
				<td>${mem.member_phone }</td>
			</tr>
		</table>
	</div>
	
	
	<div class="reserve-travel-count">
		<div>
		<h2>인원정보</h2>
<!-- 		<table border="1" cellspacing="0" width="650">
			ajax활용 도전 
			<tr>
			<th>여행인원</th>
			<td> <a>‹</a> </td>
			<td>1</td>
			<td> <a>›</a> </td>
			<td>유류할증료/제세공과금포함</td>
			</tr>
		</table> -->
		
		<ul>
			<li><p class="tit">인원</p>
			<span class="num_count_group">
			<button class="btn_member_down">
			‹
			</button>
			<input name="reserve_count" value="1">
			<button class="btn_member_up" >
			›
			</button>
			</span>
			<div class="price_group">
			<span class="price"><fmt:formatNumber>${dto.travel_price }</fmt:formatNumber>원</span><br>
			<span class="txt">유류할증료/제세공과금 포함</span>
			<input name="price_account" value="1999900">
			</div>
			</li>
		
		
		</ul>
		</div>
		<p class="txt">※[+],[-]버튼으로 인원을 선택하세요.<br>
		※싱글 차지 금액은 예약 이후 추가 될 수 있사오니, 예약 내역 확인 시 상품 결제 정보를 꼭!확인 하시기 바랍니다.</p>
	</div>
	
	<div class="reserve-travel-member-cont">
		<h2>여행자 정보</h2>
<%-- 		<c:if test="${!empty 여행자수 }">
			<c:forEach begin="1" end="${ 예약수 }"> --%>
				<table border="1" cellspacing="0" width="650">
					<tr>
					<th>성명(한글)</th>
					<td colspan="3"><input name="reserve_name"></td>
					</tr>
					
					<tr>
					<th>생년월일</th>
					<td><input name="reserve_date"></td>
			 		<th>성별</th>
					<td>
					<input type="radio" name="gender" value="남자">남자
					&nbsp;&nbsp;&nbsp;
					<input type="radio" name="gender" value="여자">여자
					</td>
					</tr>
										
					<tr>
					<th>휴대폰번호</th> <td><input name="reserve_phone"></td>
					
					<th>이메일</th> <td><input name="reserve_email"></td>
					</tr>
					
				</table>
<%-- 			</c:forEach>
		</c:if> --%>
	</div>
	
	<div class="reserve-travel-notice" style="background-color: #F4F2F2; display: inline-block; margin-top: 50px">
	<h4 style="margin-left: 20px;">예약 시 유의사항</h4>
	<hr>
	<ul style="display: inline-block; width: 650px" >
	<li>여행 관련 변경사항 발생 시 안내 드리고자 만 19세 이상의 모든 여행자는 휴대폰번호를 필수로 입력하셔야 합니다.</li>
	<li>휴대폰이 없으실 경우 연락 가능한 보호자의 휴대폰번호를 입력해 주시기 바랍니다.</li>
	<li>(단, 동일 예약번호 내 동일한 이메일 및 휴대폰번호 입력 불가)</li>
	<li>하나투어마일리지®는 출발일 전 하나투어클럽에 가입하신 여행자에게만 적립됩니다. (출발일+7일 후 적립)</li>
	<li>여행자 정보는 예약/결제 후 예약내역에서 모두 입력해 주셔야 합니다</li>
	<li>현지합류 인원추가 시 추가 된 인원의 인원 정보를 등록해주셔야 합니다.</li>
	<li>유아요금은 성인 2인과 같은 방 사용조건이며, 미충족 시 유아추가 요금이 발생합니다.</li>
	<li>유류할증료 및 제세공과금은 유가와 환율에 따라 변동될 수 있습니다.</li>
	<li>1인 객실 사용시 추가요금 발생</li>
	<li>현지합류 상품은 해당 결제금액에 따라 마일리지 적립이 별도로 지급됩니다. (특별적립 제외)</li>
	<br>
	</ul>
	</div>
	

	</div>
	<%-- 
	<input type="button" value="다음단계" 
	      onclick="location.href='reserve_travel_terms.do?no=${dto.travel_num}'"> --%>
	
		
   <input type="submit" value="다음단계">
	
</form>
</body>
</html>