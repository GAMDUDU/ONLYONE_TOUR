<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>onlyone 투어</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/style.css">
<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>

	<style type="text/css">
	.reserve-travel-notice li{font-size: 10px}
	.txt{font-size: 4px}
	.mr{margin-right:25px;}
	.reserve-travel{	
	margin-top:10px;
	margin-bottom:60px;
	width: 100%;
	height: 50px;
	line-height:50px;
	text-align:left;
/* 	position: absolute; */
	left: 0;
	bottom: 0;}
	
	.reserve-travel ul {
	display: flex;
	margin-left: 500px;
}

.reserve-travel ul li {
	font-size: 17px;
	/* width: 25%; */
}

.reserve-travel-main{
	 padding: 3% 8%;
}
	</style>
	
	<script type="text/javascript">
	function btn_count(cal){
		var c = cal;
		var current_cnt = $("#reserve_count").val(); 
		var price = $("#price").val(); 
		var price_account = $("#price_account").val();
		
		if(c == 'plus'){  //plus를 누르면
			$("#reserve_count").val(Number(current_cnt)+1); // reserve_count +1 이됨.
			/* $("#price_account").val(Number(price)*Number(current_cnt)*2); */
			if(current_cnt == 1 ){ // reserv_count가 2일때
				/* $("#price_account").val((Number(price)*Number(current_cnt))*2);//199*1*2 */
				$("#price_account").val((Number(price)*Number(current_cnt))+Number(price));
				var content = '<table border="1" cellspacing="0" width="650" style="margin-top:20px; class="table table-striped"">';
				 	content	+= '<tr>';
				 	content	+= '<th>성명(한글)</th>';
				 	content	+= '<td colspan="3"><input name="reserve_name_2"></td>';
				 	content	+= '</tr>';
				 	content	+= '<tr>';
				 	content	+= '<th>생년월일</th>';
			 		content	+= '<td><input name="reserve_date_2"></td>';
			 		content	+= '<th>성별</th>';
			 		content	+= '<td>';
			 		content	+= '<input type="radio" name="reserve_gender_2" value="male">';
			 		content	+= '<label for="male">남자</label>';
			 		content	+= '<input type="radio" name="reserve_gender_2" value="female">';
			 		content	+= '<label for="female">여자</label>';
			 		content	+= '</td>';
			 		content	+= '</tr>';
			 		content	+= '<tr>';
			 		content	+= '<th>휴대폰번호</th> <td><input name="reserve_phone_2"></td>';
			 		content	+= '<th>이메일</th> <td><input name="reserve_email_2"></td>';
			 		content	+= '</tr>';
			 		content	+= '</table>';
				$('#travel-member-info').append(content);
				
			}else if(current_cnt == 2 ){
				
				/* var count = Number(current_cnt)+1; */
				/* $("#price_account").val(Number(current_cnt)*(Number(price)*1.5)); */
				$("#price_account").val((Number(price)*Number(current_cnt))+Number(price));
				var content = '<table border="1" cellspacing="0" width="650" style="margin-top:20px;">';
				 	content	+= '<tr>';
				 	content	+= '<th>성명(한글)</th>';
				 	content	+= '<td colspan="3"><input name="reserve_name_3"></td>';
				 	content	+= '</tr>';
				 	content	+= '<tr>';
				 	content	+= '<th>생년월일</th>';
			 		content	+= '<td><input name="reserve_date_3"></td>';
			 		content	+= '<th>성별</th>';
			 		content	+= '<td>';
			 		content	+= '<input type="radio" name="reserve_gender_3" value="male">';
			 		content	+= '<label for="male">남자</label>';
			 		content	+= '<input type="radio" name="reserve_gender_3" value="female">';
			 		content	+= '<label for="female">여자</label>';
			 		content	+= '</td>';
			 		content	+= '</tr>';
			 		content	+= '<tr>';
			 		content	+= '<th>휴대폰번호</th> <td><input name="reserve_phone_3"></td>';
			 		content	+= '<th>이메일</th> <td><input name="reserve_email_3"></td>';
			 		content	+= '</tr>';
			 		content	+= '</table>';
				$('#travel-member-info').append(content);
				event.preventDefault();
			
			}else if(current_cnt == 3){
				//3이상 클릭하면 안됩니다..ㅎ...
				alert("최대 3명의 인원을 선택해주세요.");
			}
			
		}else{
			if(current_cnt == 1){
				alert("최소 1명의 인원을 선택해주세요.");
		
			
			}
			$("#reserve_count").val(Number(current_cnt)-1);
			$("#price_account").val((Number(price)*Number(current_cnt))-Number(price));
			$('#travel-member-info').children().last().remove();
		}
	}

	function form_submit(){
		//var formData = $("#reserve_form").serialize();
		var formData = $("#reserve_form").serializeArray();
		console.log('formData', formData);
		var reserveNum=$("#reserve_num").val(Number());
		
		$.ajax({
			type:"POST",
			url:"reserve_submit.do", //reserve_travel_ok.do
			dataType : "text",
			contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
			data: formData, //보낼데이터
			success: function(e){
				if(e == 'T'){
					/* alert('예약이 완료 되었습니다.'); */
					//완료한 페이지 이동↓ 
					/* window.location.href="reserve_travel_ok.do?no=${dto.travel_num}"; */
					/* window.location.href="reserve_travel_terms.do"; //약관페이지로이동... */
					
					alert('reserveNum')
					window.location.href="reserve_travel_ok.do?no=1";  //reserve_num을 넣어야하는데 모르겠습니다...
					
				}else{
					alert('예약에 실패하였습니다.2');
					return;
				}
			},
			error: function(){
				alert('예약에 실패하였습니다.');
				return;
			}
		});
	}
	</script>
	
	
	
	
</head>
<body>
<c:set var="dto" value="${Cont }" />
<c:set var="mem" value="${Member }" />
<c:set var="res" value="${Res }" />




<%-- <form method="post" action="<%=request.getContextPath() %>/reserve_travel_ok.do?no=${dto.travel_num}"> --%>
<form method="post" name="reserve_member_form" id="reserve_form">
	<!-- 패키지 예약 페이지  -->
<jsp:include page="include/top.jsp" />

<div class="reserve-travel-main">
	<div class="reserve-travel">
		<h3>예약하기</h3>
		<ul>
			<li><a class="infor-items" style="font-weight: bold; color: blue" ><i class="fa-solid fa-clipboard-check">예약정보확인</i></a></li>
			<!-- <li><a class="infor-items">￦옵션정보/약관/결제</a></li> -->
			<li><a class="infor-items">☑예약완료</a></li>
		</ul>
	</div>
	
	<input type="hidden" name="no" value="${dto.travel_num }">
	 <input type="hidden" id="reserve_num" name="num" value="${res.reserve_num }">
	
	
	
	
	<div class="reserve-travel-cont">
		<h3>${dto.travel_name }</h2>
		<table border="1" cellspacing="0" width="650" class="table table-striped">
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
		<table border="1" cellspacing="0" width="650" class="table table-striped">
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

		
		<ul>
			<li><p class="tit">인원</p>
			<input type="button" value="◀ " onclick="btn_count('minus')" id="btn_member_down">
			<input id="reserve_count" value="1" readonly="readonly" name="reserve_count">
			<input type="button" value="▶ " onclick="btn_count('plus')" id="btn_member_up">



			<div class="price_group">

	<%-- 		<span name="price" id="price"><fmt:formatNumber>${dto.travel_price }</fmt:formatNumber>원</span><br> --%>
			<input name="price" id="price" value="${dto.travel_price }"><br>
			<span class="txt">유류할증료/제세공과금 포함</span>
			<input name="price_account" id="price_account" value="${dto.travel_price }">
			</div>
			</li>
		
		
		</ul>
		</div>
		<p class="txt">※[+],[-]버튼으로 인원을 선택하세요.<br>
		※싱글 차지 금액은 예약 이후 추가 될 수 있사오니, 예약 내역 확인 시 상품 결제 정보를 꼭!확인 하시기 바랍니다.</p>
	</div>
	
	<div class="reserve-travel-member-cont">
		<h2>여행자 정보</h2>

			<div id="travel-member-info">
				<table border="1" cellspacing="0" width="650" class="table table-striped">
					<tr>
					<th>성명(한글)</th>
					<td colspan="3"><input name="reserve_name_1"></td>
					</tr>
					
					<tr>
					<th>생년월일</th>
					<td><input name="reserve_date_1"></td>
			 		<th>성별</th>
					<td>
						<input type="radio" name="reserve_gender_1" value="male">
						<label for="male">남자</label>
						<input type="radio" name="reserve_gender_1" value="female">
						<label for="female">여자</label>
					</td>
					</tr>
										
					<tr>
					<th>휴대폰번호</th> <td><input name="reserve_phone_1"></td>
					
					<th>이메일</th> <td><input name="reserve_email_1"></td>
					</tr>
				</table>
			</div>
	</div>
	
	<div class="reserve-travel-notice" style="background-color: #F4F2F2; margin-top: 50px">
	<h4 style="margin-left: 20px;">예약 시 유의사항</h4>
	<hr>
	<ul style="display: inline-block; width: 950px" >
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
	
		
<!--    <input type="submit" value="예약완료"> -->
   <input type="button" value="예약완료" onClick="form_submit()">
   	
</form>

</body>
</html>