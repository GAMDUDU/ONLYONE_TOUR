<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
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
	
</style>

</head>
<body>


	<hr width="100%" color="gray">
	
	<div class="container-fluid">
	
		<div class="row">
			<div id="air_image" class="col-md-12">
				
				<div class="col-md-8 col-md-offset-2" style="margin-top:350px; height:200px;">
					<form method="post" action="" class="form-control" style="height:200px;">
						<br>
						<table style="width: 100%;">
						<colgroup>
							<col width="40%">
							<col width="5%">
							<col width="40%">
							<col width="15%">
						</colgroup>
							<tr>
								<td>
									<select class="input">
										<option value="">출발지</option>
										<option value="GMP">김포(GMP)</option>
										<option value="ICN">인천(ICN)</option>
										<option value="CJU">제주(CJU)</option>
										<option value="PUS">부산(PUS)</option>
										<option value="RSU">여수(RSU)</option>
										<option value="USN">울산(USN)</option>
										<option value="TPE">대만(타이페이)(TPE)</option>
										<option value="BKK">방콕(BKK)</option>
										<option value="PAK">파리(PAK)</option>
										<option value="VVO">블라디보스톡(VVO)</option>
										<option value="JFK">뉴욕(존 에프 케네디)(JFK)</option>
										<option value="HNL">하와이(호놀룰루)(HNL)</option>
										<option value="GUM">괌(GUM)</option>
										<option value="SYD">시드니(SYD)</option>
									</select>
								</td>
								<td class="text-center" style="font-size:30px; font-weight:bold;"> ⇌ </td>
								<td>
									<select class="input">
										<option value="">도착지</option>
										<option value="GMP">김포(GMP)</option>
										<option value="ICN">인천(ICN)</option>
										<option value="CJU">제주(CJU)</option>
										<option value="PUS">부산(PUS)</option>
										<option value="RSU">여수(RSU)</option>
										<option value="USN">울산(USN)</option>
										<option value="TPE">대만(타이페이)(TPE)</option>
										<option value="BKK">방콕(BKK)</option>
										<option value="PAK">파리(PAK)</option>
										<option value="VVO">블라디보스톡(VVO)</option>
										<option value="JFK">뉴욕(존 에프 케네디)(JFK)</option>
										<option value="HNL">하와이(호놀룰루)(HNL)</option>
										<option value="GUM">괌(GUM)</option>
										<option value="SYD">시드니(SYD)</option>
									</select>
								</td>
								<td rowspan="2" class="text-center">
									<input type="button" class="btn btn-primary btn-lg" value="항공권 검색">
								</td>
							</tr>
							<tr>
								<td>
									<input type="date" placeholder="출발날짜" class="inputDate">
									<input type="date" placeholder="도착날짜" class="inputDate">
								</td>
								<td></td>
								<td>
									<input type="text" id="people" placeholder="인원수" class="input" 
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
				      				<input type="button" id="incAd" value="−"> 
				        			<span id="numberUpDown1" style="padding: 10px;">1</span>
				        			<input type="button" id="decAd" value="+">
				        		</td>
				        	</tr>
				        	
				        	<tr>
				        		<td class="text-right" style="padding: 20px;">소아</td>
				        		<td>
				        			<input type="button" id="incch" value="−">
				        			<span id="numberUpDown1" style="padding: 10px;">1</span>
				        			<input type="button" id="decch" value="+">
				        		
				        		</td>
				        	</tr>
				        	
				        	<tr>
				        		<td class="text-right" style="padding: 20px;">유아</td>
				        		<td>
				        			<input type="button" id="incba" value="−">
				        			<span id="numberUpDown1" style="padding: 10px;">1</span>
				        			<input type="button" id="decba" value="+">
				        		
				        		</td>
				        	</tr>
				        </table>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-primary">선택완료</button>
				        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
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
				<h3>항공사 추천 특가 ✈️</h3>
						
			<table style="width: 100%;">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tr>
					<td style="padding-right:5px"><img width="280px;" src="resources/image/OZ.jpg" title="" data-src="" alt=""></td>
					<td style="padding-right:5px"><img width="280px;" src="resources/image/KE.jpg" title="" data-src="" alt=""></td>
					<td style="padding-right:5px"><img width="280px;" src="resources/image/MH.jpg" title="" data-src="" alt=""></td>
					<td><img width="280px;" src="resources/image/AC.jpg" title="" data-src="" alt=""></td>
				</tr>
				<tr style="font-size:20px; font-weight:bold;">
					<td style="padding:10px 0;">아시아나 항공</td>
					<td>대한항공</td>
					<td>말레이시아항공</td>
					<td>에어캐나다</td>
				</tr>
				<tr>
					<td>인천 ↔ 몽골/칭키스칸 왕복항공권</td>
					<td>인천 ↔ 방콕 왕복 항공권</td>
					<td>인천 ↔ 쿠알라룸푸르 왕복 항공권</td>
					<td>인천 ↔ 밴쿠버 왕복 항공권</td>
				</tr>
				<tr style="font-size:20px; font-weight:bold;">
					<td style="padding:10px 0;">923,900원~</td>
					<td>1,448,200원~</td>
					<td>929,700원~</td>
					<td>1,412,600원~</td>
				</tr>
			</table>
			</div>
		</div>
		
		
		<br><br><br><br>
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<h3>OnlyOneTour Pick! 국내 항공 특가 👓</h3>
						
			<table style="width: 100%;">
				<colgroup>
					<col width="25%">
					<col width="25%">
					<col width="25%">
					<col width="25%">
				</colgroup>
				<tr>
					<td style="padding-right:5px"><img width="280px;" height="210px" src="resources/image/Jeju.jpg" title="" data-src="" alt=""></td>
					<td style="padding-right:5px"><img width="280px;" height="210px" src="resources/image/busan.jpg" title="" data-src="" alt=""></td>
					<td style="padding-right:5px"><img width="280px;" height="210px" src="resources/image/yeosu.jpg" title="" data-src="" alt=""></td>
					<td style="padding-right:5px"><img width="280px;" height="210px" src="resources/image/ulsan.jpg" title="" data-src="" alt=""></td>
				</tr>
				<tr style="font-size:20px; font-weight:bold;">
					<td style="padding:10px 0;">김포 → 제주</td>
					<td>김포 → 부산</td>
					<td>김포 → 여수</td>
					<td>김포 → 울산</td>
				</tr>
				<tr>
					<td>7월 8일 출발</td>
					<td>7월 25일 출발</td>
					<td>8월 12일 출발</td>
					<td>8월 23일 출발</td>
				</tr>
				<tr style="font-size:20px; font-weight:bold;">
					<td style="padding:10px 0;">45,000원~</td>
					<td>38,400원~</td>
					<td>36,500원~</td>
					<td>55,500원~</td>
				</tr>
			</table>
			</div>
		</div>
	</div>
	
	<br><br><br>
	<hr width="100%" color="gray">
	<br><br><br>
	
	<script src="https://code.jquery.com/jquery-3.2.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 	
	<script type="text/javascript">
		$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').focus()
		})

	</script>
	
</body>
</html>