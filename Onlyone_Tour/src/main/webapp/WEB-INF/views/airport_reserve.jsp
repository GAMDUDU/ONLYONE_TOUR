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
<style type="text/css">

	th {
		text-align:center;
		vertical-align:middle;
	}

	td {
		vertical-align:middle;
	}


</style>
</head>

<body>
	<jsp:include page="include/top.jsp" />
	</div>
	<hr width="100%" color="gray">
	<br>
	
	<div class="container-fluid" style="background-color:#fff;">
	  <div class="row">
		
		<div class="col-md-8 col-md-offset-2">
		
		<c:set var="list" value="${AirReserve }" />
		<c:set var="rdto" value="${AirReserveDTO }" />
		<c:if test="${!empty list }">
		
		<br><br>
		<div class="panel panel-info">		
			<div class = "panel-heading"> 
         		<h3 class = "panel-title" style="font-weight:bold; font-size:20px;">
         			[내가 선택한 여정]
         		</h3> 
     		</div>
     		 
     		<div class = "panel-body"> 
				<table class="table table-bordered" style="text-align:center;">
				<tr class="active" style="font-weight:bold; font-size:16px;">
					<td>구분</td>
					<td>항공편</td>
					<td>비행 일정</td>
					<td>인원</td>
				</tr>
				<tr style="font-weight:bold; font-size:16px;">
					<td>[가는 항공]</td> 
					<td>${rdto.getRe_go_air() } ${rdto.getRe_go_num() }편</td>
					<td>${rdto.getRe_go() } ${rdto.getRe_go_date() }</td>
					<td>${rdto.getRe_people() }명</td>
				</tr>
				
				<tr style="font-weight:bold; font-size:16px;">
					<td>[오는 항공]</td> 
					<td>${rdto.getRe_back_air() } ${rdto.getRe_back_num() }편</td>
					<td>${rdto.getRe_back() } ${rdto.getRe_back_date() }</td>
					<td>${rdto.getRe_people() }명</td>
				</tr>
				</table>
			</div>
		</div>
		
		 <div class = "panel panel-default" > 
     		<div class = "panel-heading"> 
         		<h3 class="panel-title" style="color:#dd0d0d;font-weight:bold;">※ 유의사항 </h3> 
     		</div> 
     		<div class="panel-body"> 
	     		<ul style="list-style-type:square;">
					<li>• 상단의 선택하신 항공 여정을 다시 한번 확인해주시기 바랍니다.</li>
					<li>• 예약 후 이름/스케쥴/항공사/인원 변경은 불가하며 취소 후 재예약하셔야 합니다.</li>
					<li>• 취소 후 재예약 시 항공편이 없을 수도 있으니, 가는편과 오는편의 시간을 정확히 확인해주시기 바랍니다.</li>
					<li>• 하단의 항공사 주의사항을 꼭 확인해주시기 바랍니다.</li>
					<li>• 항공권 결제는 신용/체크카드로만 결제가 가능합니다. (현금결제 불가)</li>
					<li>• 여행사 법인카드, 여행사 임직원카드는 사용불가하며, 문제발생 시 법적인 책임소지가 따릅니다.</li>
					<li>• 항공권은 항공사 사정 및 천재지변으로 인하여 시간변경 또는 결항될 수 있습니다.</li>
					<li>• 가는편 수하물 정보 : 무료위탁수하물 : 15KG, 기내수하물 : 10KG / 오는편 수하물 정보 : 무료위탁수하물 : 20KG, 기내수하물 : 10KG</li>
				</ul>
     		</div> 
 		</div> 

		<br><br>
		<div class="panel panel-info">		
			<div class = "panel-heading"> 
         		<h3 class = "panel-title" style="font-weight:bold; font-size:20px;">
         			[예약자 연락처 및 개인정보]
         		</h3> 
     		</div>
     		 
     		<div class = "panel-body"> 
				<table class="table table-bordered" style="text-align:center;">
					<tr>
						<th class="active">성명</th>
						<td>${rdto.getRe_mem_name() }</td>
						<th class="active">성별</th>
						<td>${rdto.getRe_mem_gender() }</td>
					</tr>
					<tr>
						<th class="active">생년월일</th>
						<td>${rdto.getRe_mem_birth() }</td>
						<th class="active">휴대전화</th>
						<td>${rdto.getRe_mem_phone() }</td>
					</tr>
					<tr>					
						<th class="active">이메일</th>
						<td>${rdto.getRe_mem_email() }</td>
						<td colspan="2"></td>
					</tr>
				</table>
				
				 &nbsp;• 예약자 정보는 결항 또는 <span style="color:#dd0d0d">긴급상황 발생 시 즉시 연락이 가능</span>해야 합니다.<br>
				 &nbsp;• 연락이 불가능한 경우 발생되는 불이익에 대해 당사는 책임지지 않사오니 유의하시기 바랍니다.<br>
 				 &nbsp;• 항공권 예매완료 후 기입하신 휴대폰번호/이메일로 항공편 예약내역이 발송됩니다.<br>
			</div>
		</div>		
	    <br><br>
	   
	   <div class="panel panel-info">		
			<div class = "panel-heading"> 
         		<h3 class = "panel-title" style="font-weight:bold; font-size:20px;">
         			[탑승자 연락처 및 개인정보]
         		</h3> 
     		</div>
     		 
     		<div class="panel-body"> 
				<table class="table table-bordered">
					<tr>
						<th class="active">여행자 인원</th>
						<td><span style="color:blue;font-weight:bold;">총 ${rdto.getRe_people() }명 (${rdto.getRe_info() })</span></td>
					</tr>
					<tr>
						<th class="active" style="vertical-align:middle;">예약 안내</th>
						<td> 
 						• 유아는 보호자 1인당 1명만 예약이 가능합니다.<br>
 						• 성인, 소아, 유아 만 나이 계산은 항공편(가는편/오는편)의 탑승일 기준입니다<br>
 						• 소아, 유아의 휴대폰번호는 <span style="color:#dd0d0d">연락 가능한 보호자의 휴대폰 번호를 기입</span>해 주시기 바랍니다.<br>
 						</td>
					</tr>
				</table>
				
				<c:forEach items="${list }" var="air" varStatus="vs">	
					<label style="font-weight:bold; font-size:16px;">[탑승자${vs.count} 개인정보 ]</label>
					<input name="index_${vs.count}" value="${air.getRe_index() }" style="width:0px;">
					<table class="table table-bordered">
						<tr>
							<th class="warning" style="vertical-align:middle;">성명(한글)</th>
							<td><input class="form-control" style="width:50%;" name="re_name_${vs.count}"></td>
							<th class="warning" style="vertical-align:middle;">성별</th>
							<td style="vertical-align:middle;">
							  <div class="radio-inline">
								<label>
									<input type="radio" name="re_gender_${vs.count}" value="남자">남자
								</label>
							  </div>&nbsp;&nbsp;
							  <div class="radio-inline">
								<label>
									<input type="radio" name="re_gender_${vs.count}" value="여자">여자
								</label>
							  </div>
							</td>
						</tr>
						
						<tr>
							<th class="warning" style="vertical-align:middle;">생년월일</th>
							<td><input class="form-control" numberOnly placeholder="*숫자로만 입력해주세요(ex) 19900120)" name="re_birth_${vs.count}"></td>
				 			<th class="warning" style="vertical-align:middle;">휴대폰 번호</th>
							<td><input class="form-control" numberOnly placeholder="*숫자로만 입력해주세요(ex) 01012341122)" name="re_phone_${vs.count}"></td>
						</tr>
			
					</table>
					<br>
				</c:forEach>
			</div>
		  </div>		


			<form method="post" id="airReserve_ok"
				action="<%=request.getContextPath() %>/airport_reserve_ok.do">
				
				<input type="hidden" name="re_info" value="">
				<input type="hidden" name="re_num" value="">
				<input type="hidden" name="re_people" value="">
				
				<input type="hidden" name="re_tour_name" value="">
				<input type="hidden" name="re_tour_phone" value="">
				<input type="hidden" name="re_tour_gender" value="">
				<input type="hidden" name="re_tour_birth" value="">
			
			</form>
			
			<div class="text-center">
				<input type="button" class="btn btn-primary btn-lg"
			 		id="reserveAirport_OK" value="예약완료" 
			 		onclick="goReserve('${rdto.getRe_people() }','${rdto.getRe_num() }');">
			</div>
 	    </c:if>  
 	    
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
		  
		  $("input[name^='index_']").hide();
		  
		  $("input:text[numberOnly]").on("keyup", function() {
			      $(this).val($(this).val().replace(/[^0-9]/g,""));
		  });

	  }); 
	  
	  function goReserve(people,num) {
		  
		  // alert(people);
		  var name="";
		  var gender="";
		  var birth="";
		  var phone="";
		  var index="";
		  
		  for(var i=1; i<=people; i++) {
			  
			  if($("input[name='re_name_" + i + "']").val() == "") {
				  alert("[탑승자" + i + "] 이름을 입력해주세요.");
				  $("input[name='re_name_" + i + "']").focus();
				  return;
			  }
			  
			  if($("input[name='re_gender_" + i + "']").is(':checked') === false){
					alert("[탑승자" + i + "] 성별을 선택해주세요");
					$("input[name='re_gender_" + i + "']").focus();
					return;
			  }
					
			  if($("input[name='re_birth_" + i + "']").val() == "") {
				  alert("[탑승자" + i + "] 생년월일을 입력해주세요.");
				  $("input[name='re_birth_" + i + "']").focus();
				  return;
			  }
			  
			  if($("input[name='re_phone_" + i + "']").val() == "") {
				  alert("[탑승자" + i + "] 휴대폰번호를 입력해주세요.");
				  $("input[name='re_phone_" + i + "']").focus();
				  return;
			  }
			  
			  
			  index = index + $("input[name='index_" + i + "']").val() + ",";
			  			  
			  name = name + $("input[name=re_name_" + i + "]").val() + ",";
			 			  
			  gender = gender + $("input[name='re_gender_" + i + "']:checked").val() + ",";
			 			  
			  birth = birth + $("input[name=re_birth_" + i + "]").val() + ",";
			 			  
			  phone = phone + $("input[name=re_phone_" + i + "]").val() + ",";
			  
		  }
		  
		  
		  var index1 = index.substr(0, index.length - 1);
		  var name1 = name.substr(0, name.length - 1); 
		  var gender1 = gender.substr(0, gender.length - 1);
		  var birth1 = birth.substr(0, birth.length - 1);
		  var phone1 = phone.substr(0, phone.length - 1);
		  
		  
		  $('input[name="re_info"]').attr('value', index1);
		  $('input[name="re_num"]').attr('value', num);
		  $('input[name="re_people"]').attr('value', people);
		  
		  $('input[name="re_tour_name"]').attr('value', name1);
		  $('input[name="re_tour_gender"]').attr('value', gender1);
		  $('input[name="re_tour_birth"]').attr('value', birth);
		  $('input[name="re_tour_phone"]').attr('value', phone1);
		  
		  //alert(name1);
		  //alert(gender1);
		  //alert(birth1);
		  //alert(phone1);
		  //alert(num);
		  //alert(index1);
		  
		  
		  var result = confirm('정말 예약하시겠습니까?');
				  
		  if(result) {
			  $("#airReserve_ok").submit();
		  }
	  }
	  
	</script>
</body>
</html>