<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>onlyone 투어</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style type="text/css">
	ul li{font-size: 10px}
	div{margin-top: 80px}
	</style>

<script type="text/javascript">
function btn_count(cal){
	var c = cal;
	var current_cnt = $("#reserve_count").val(); 
	var price = $("#price").val(); 
	var price_account = $("#price_account").val();
	
	if(c == 'plus'){ 
		$("#reserve_count").val(Number(current_cnt)+1);
		if(current_cnt == 1 ){ 
			$("#price_account").val((Number(price)*Number(current_cnt))+Number(price));
			var content = '<table border="1" cellspacing="0" width="650" style="margin-top:20px;">';
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
			$('#air-member-info').append(content);
			
		}else if(current_cnt == 2 ){
		
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
			$('#air-member-info').append(content);
			event.preventDefault();
		
		}else if(current_cnt == 3){
			alert("최대 3명의 인원을 선택해주세요.");
		}
		
	}else{
		if(current_cnt == 1){
			alert("최소 1명의 인원을 선택해주세요.");
	
		
		}
		$("#reserve_count").val(Number(current_cnt)-1);
		$("#price_account").val((Number(price)*Number(current_cnt))-Number(price));
		$('#air-member-info').children().last().remove();
	}
}

function form_submit_air(){
	var formData = $("#reserve_form").serializeArray();
	console.log('formData', formData);
	/* var reserveNum=$("#reserve_num").val(Number()); */
	
	$.ajax({
		type:"POST",
		url:"reserve_submit_air.do",
		dataType : "text",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
		data: formData, //보낼데이터
		success: function(e){
			if(e == 'T'){
				alert('reserveNum')
				window.location.href="reserve_air_ok.do?no=1";  //reserve_num을 넣어야하는데 모르겠습니다...
			}else{
				alert('예약에 실패하였습니다.2');
				return;
			}
		},
		error: function(){
			alert('실패');
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


<form method="post" name="reserve_member_form" id="reserve_form">
<div>
	<div class="reserve-travel">
		<h2>예약하기</h2>
		<ul>
			<li><a class="infor-items" style="font-weight: bold; color: blue" ><i class="fa-solid fa-clipboard-check">01예약하기</i></a></li>
			<li><a class="infor-items">02결제하기</a></li>
			<li><a class="infor-items">03예약완료</a></li>
		</ul>
	</div>
	
	<div>
		<table border="1" cellspacing="0" width="650">
			<h3>내가선택한여정</h3>
			<tr>
				<th>구분</th><th>항공편</th><th>출발일</th><th>도착일</th><th>좌석등급</th><th>요청좌석</th>
			</tr>
			
			<tr>
				<td>가는항공</td><td>${dto.air_airline }${dto.air_name }</td><td>${dto.air_departure }${dto.air_departure_date }</td><td>${dto.air_arrival }${dto.air_arrival_date }</td><td>${dto.air_seat_type}</td><td>${dto.air_seat }</td>
			</tr>
					
		</table>
	</div>
	
	
	
<div>
	<table border="1" cellspacing="0" width="650">
	<ul>
		<li>!유의사항</li>
		<li>항공권 예약완료 후 즉시결제하지 않으시면 예약은 자동취소됩니다.</li>
		<li>상단의 선택하신 항공 여정을 다시 한번 확인해주시기 바랍니다.</li>
		<li>예약 후 이름/스케쥴/항공사/인원 변경은 불가하며 취소 후 재예약하셔야 합니다.</li>
		<li>취소 후 재예약 시 좌석이 없을 수도 있으니, 가는편과 오는편의 시간을 정확히 확인해주시기 바랍니다.</li>
		<li>왕복 예약시 카드정보를 한번만 입력하셔도 됩니다.<br>(승인은 가는편/오는편 각각 진행이 되므로 결제 후 정상승인여부를 꼭 확인해주시기 바랍니다.)</li>
		<li>결제 시 여행사 발권업무 대행수수료 1인당 편도 1,000원이 항공권 금액과 별도로 추가 승인됩니다.</li>
		<li>하단의 항공사 주의사항을 꼭 확인해주시기 바랍니다.</li>
		<li>항공권 결제는 신용/체크카드로만 결제가 가능합니다. (현금결제 불가)</li>
		<li>여행사 법인카드, 여행사 임직원카드는 사용불가하며, 문제발생 시 법적인 책임소지가 따릅니다.</li>
		<li>항공권은 항공사 사정 및 천재지변으로 인하여 시간변경 또는 결항될 수 있습니다.</li>
		<li>취소 시 여행사취소수수료 1인당 편도 1,000원이 부과될 수 있으며 취소수수료 추가결제 후 항공권 취소가 완료됩니다. (당일 취소시 취소수수료 면제)</li>
		<li>가는편 수하물 정보 : 무료위탁수하물 : 15KG, 기내수하물 : 10KG / 오는편 수하물 정보 : 무료위탁수하물 : 15KG, 기내수하물 : 10KG</li>
	</ul>
</table>
</div>


<div>
	<table border="1" cellspacing="0" width="650">
		<tr>
			<th>예약자</th><td>${mem.member_name }</td> <th>이메일</th><td>${mem.member_email }</td>
		</tr>
		
		<tr>
			<th>휴대전화</th><td>${mem.member_phone }</td> <th>생년월일</th><td>${mem.member_birth.substring(0,10) }</td>
		</tr>
	</table>
	
	<ul>
		<li> 예약자 정보는 , 결항 또는 긴급상황 발생 시 즉시 연락이 가능해야 하며, <br>불가능한 경우 발생되는 불이익에 대해 당사는 책임지지 않사오니 유의하시어 정확히 입력바랍니다.</li>
 		<li>예약자와 탑승자의 정보가 다를 경우, 탑승자의 연락가능한 전화번호와 이메일을 기입해주십시오.</li>
		<li>항공권 예매완료 후 기입하신 휴대폰번호/이메일로 항공편 예약내역이 발송됩니다.</li>
	</ul>
</div>

<div>
	<table border="1" cellspacing="0" width="650">
<!-- 		<tr>
			<th>여행자인원</th>
			<td>성인
			<select name="adult_count">
			<option value="adult_count_1" onclick="btn_count('adult_1')" id="adult_count_1">1명</option>
			<option value="adult_count_2" onclick="btn_count('adult_2')" id="adult_count_2">2명</option>
			<option value="adult_count_3">3명</option>
			</select>
			소아
			<select name="child_count">
			<option value="child_count_1">1명</option>
			<option value="child_count_2">2명</option>
			<option value="child_count_3">3명</option>
			</select>
			</td>
		</tr> -->
				<ul>
			<li><p class="tit">인원</p>
			<input type="button" value="◀ " onclick="btn_count('minus')" id="btn_member_down">
			<input id="reserve_count" value="1" readonly="readonly" name="reserve_count">
			<input type="button" value="▶ " onclick="btn_count('plus')" id="btn_member_up">



			<div class="price_group">

	<%-- 	<span name="price" id="price"><fmt:formatNumber>${dto.travel_price }</fmt:formatNumber>원</span><br> --%>
			<input name="price" id="price" value="${dto.air_adult_fare }"><br>
			<span class="txt">유류할증료/제세공과금 포함</span>
			<input name="price_account" id="price_account" value="${dto.air_adult_fare }">
			</div>
			</li>
		
		<tr>
			<th>예약안내</th>
			<td>
			<ul>
				<li>예약가능한 좌석수 : 항공의 남은좌석수(6석) 까지만 예약 진행이 가능합니다.</li>
				<li>좌석수는 유아 인원을 제외한 성인인원수와 어린이 인원수의 합입니다.</li>
				<li>유아는 보호자 1인당 1명만 예약이 가능합니다.</li>
				<li>유아를 포함한 전체 예약 가능한 인원수는 9인으로 제한됩니다.</li>
				<li>진에어 예약시 유아가 포함될 경우 유아가 포함된 좌석수로 노출 됩니다.</li>
				<li>성인, 소아, 유아 만 나이 계산은 항공편(가는편/오는편)의 탑승일 기준입니다.</li>
			</ul>
			</td>
		</tr>
	</table>
	
			
		<ul>
			<h4>탑승자명 입력 시 유의사항!!</h4>
			<li>탑승자명 기입 시 실제 탑승하는 사람의 신분증상 성함,국적,생년월일을 정확하게 기입하셔야 합니다. (시민권자/외국인 : 여권상의 영문성함)</li>
			<li>항공권은 타인에게 양도가 불가하며, 성함 오기입 시 절대 수정불가, 취소 후 재예약하셔야 합니다.</li>
			<li>모든 항공사는 정상운임을 기준으로 한 할인운임이 일부 제공되며, 신분할인과 이중으로 적용한 중복할인은 불가합니다.</li>
			<li>제주항공 동반보호자 선택 시 국가유공상이자, 독립유공자, 장애인이 같은 예약번호 내에 있을 경우에만 동반자 할인 적용이 가능하오니<br>대상자 본인이 같은 예약번호 내에 있는지 확인하시어 동반보호자 할인 선택바랍니다.</li>
		</ul>

</div>

<div id="air-member-info">
	<table border="1" cellspacing="0" width="650">

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

<input type="button" value="다음" onClick="form_submit_air()">

</form>
</body>
</html>