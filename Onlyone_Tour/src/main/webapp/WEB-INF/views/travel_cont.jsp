<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	<meta charset="UTF-8">
	<title>온리원투어</title>
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/travel_cont.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

		Number.prototype.formatNumber = function(){
		
		    if(this==0) return 0;
		
		    let regex = /(^[+-]?\d+)(\d)/;
		
		    let nstr = (this + '');
		
		    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
		
		    return nstr;
		
		};
	
	 function openCloseToc() {
	    if(document.getElementById('toc-content').style.display === 'block') {
	      document.getElementById('toc-content').style.display = 'none';
	      document.getElementById('toc-toggle').textContent = '상품가격 안내 ▽';
	    } else {
	      document.getElementById('toc-content').style.display = 'block';
	      document.getElementById('toc-toggle').textContent = '상품가격 안내 △';
	    }
	 }

</script>
<style type="text/css">

	.row-0{
		position: relative;
	} 	
	.col-0-0 {
		position: relative;
	}
	
	.toptag {
    	border: 1px solid #5e2bb8;
    	color: #5e2bb8;
    	display: inline-block;
	    padding: 0 6px;
	    height: 19px;
	    line-height: 17px;
	    font-size: 12px;
	    background: #fff;
	    position: relative;
	    margin-bottom: 10px;
	}
	
	#star_and_comment{
		text-align: right;
	}
	
	#contImg {
		margin-right: 10px;
		padding: 10px;
	}
	
	.tooltip_together {
	    display: inline-block;
	    position: relative;
	    margin-left: 1px;
	    top: -1px;
	    left: -8px;
	    cursor: pointer;
	}

	.tooltip_together:before{
		content:'?';
		font-weight: bold;
		color:#fff;
	}

	.tooltip_together:hover p{
		display:block;
		transform-origin: 100% 0%;
		-webkit-animation: fadeIn 0.3s ease-in-out;
		animation: fadeIn 0.3s ease-in-out;
	}
	
	.tooltip_together p{
		display: none;
		text-align: left;
		background-color: #1E2021;
		padding: 13px;
		width: 220px;
		position: absolute;
		border-radius: 3px;
		box-shadow: 1px 1px 1px rgba(0, 0, 0, 0.2);
		right: -4px;
		color: #FFF;
		font-size: 13px;
		line-height: 1.4;
	}

	.tooltip_together p:before{
		position: absolute;
		content: '';
		width:0;
		height: 0;
		border:6px solid transparent;
		border-bottom-color:#1E2021;
		right:10px;
		top:-12px;
	}

	.tooltip_together p:after{
		width:100%;
		height:40px;
		content:'';
		position: absolute;
		top:-40px;
		left:0;
	}

	@-webkit-keyframes fadeIn {
		0% { 
			opacity:0; 
			transform: scale(0.6);
		}
		100% {
			opacity:100%;
			transform: scale(1);
		}
	}

	@keyframes fadeIn {
		0% { opacity:0; }
		100% { opacity:100%; }
	}​ 
	
	.decide_info {
	    overflow: hidden;
	    margin: 20px 10px;
	}
	
	.decide_info .item {
		float: left;
		display: block;
	    width: 90px;
	    height: 35px;
	    line-height: 35px;
	    background-color: #f2f2f2;
	    font-size: 13px;
	    font-weight: 600;
	    color: #666;
	    text-align: center;
    	border-radius: 4px;
    	margin: 0px 5px 0px 0px;
	}
	
	.prod_detail {
	    border-top: 2px solid #111;
	    position: relative;
	}
	
	.contContainer {
        display: flex;
        flex-flow: row nowrap;
        width: 1050px;
        border-top: 2px solid #111;
        padding-top: 20px;
    }

    .content {
        width: 73%;
        height: auto;
        background: #fff;
        border-right: 1px solid lightgray;
        padding-right: 15px;
        padding-top: 5px;
    }

    .sidebar {
        width: 23%;
        height: 400px;
        position: sticky;
        top: 10px;
        background: #fff;
        padding-left: 15px;
    }
    
    strong.tit {
	    font-size: 22px;
	    font-weight: 600;
	    color: #111;
	    text-align: left;
	}

	  #toc-content {
	    display: none;
	    color: gray;
	    font-size: 11px;
	  }
	  #toc-toggle {
	    cursor: pointer;
	    color: black;
	    font-size: 13px;
	  }
	  
	  #toc-toggle:hover {
	    text-decoration: none;
	    color: black;
	    font-size: 13px;
	  }
	  
	  #package_reservation {
	  	background-color: #5e99cb;
	  	width: 95%;
	  	line-height: 25px;
	  	display: table-cell;
	  	vertical-align: middle;
	  	border-radius: 4px;
	  	border: 1px solid #5e99cb;
	  	color: #fff !important;
	  	font-size: 15px;
	  	padding: 0 35px;
	  	height: 50px;
  	    font-weight: 400;
  	    text-align: center;
  	    cursor: pointer;
	  }
	  
	  #package_jjim {
	  	background-color: white;
	  	width: 20%;
	  	height: 50px;
	  	border: 1px solid lightgray;
	  	font-size: 20px;
	  	text-align: center;
  	    cursor: pointer;
  	    color: lightgray !important;
  	    border-radius: 4px;
  	    display: table-cell;
	  	vertical-align: middle;
	  	line-height: 25px;
	  }
	  
	  #dec_btn {
	  	background-color: white;
	  	border: 1px solid #ddd;
	  	border-radius: 0px;
	  	padding: 5px 10px 5px 10px;
	  	font-size: 15px;
	  	margin-right: -5px;
	  	cursor: pointer;
	  }
	  
	  #inc_btn {
	  	background-color: white;
	  	border: 1px solid #ddd;
	  	border-radius: 0px;
	  	padding: 5px 10px 5px 10px;
	  	font-size: 15px;
	  	margin-left: -5px;
	  	cursor: pointer;
	  }
	  
	  #package_count {
	  	background-color: white;
	  	border: 1px solid #ddd;
	  	border-radius: 0px;
		height: 35px;
	  	font-size: 15px;
	  	color: black;
	  	padding-top: -3px;
	  }
	  
	  #review_write_btn {
	  	color: #fff !important;
	    border: solid 1px #5b606e;
	    background-color: #5b606e;
	    font-weight: 400;
	    text-align: center;
	    border-radius: 4px;
        height: !important;
	    line-height: 34px !important;
	    font-size: 13px !important;
	    padding: 3px 15px;
	  }
	  
	  #review_write_btn:hover {
	    color: #fff !important;
	    border: solid 1px #9094a7;
	    background-color: #9094a7;
	    font-weight: 400;
	    text-align: center;
	    border-radius: 4px;
        height: !important;
	    line-height: 34px !important;
	    font-size: 13px !important;
	    padding: 3px 15px;
	  }

</style>
</head>
<body>
	
	<c:set var="cont" value="${Cont }" />
	<c:set var="reviewList" value="${ReviewList }"/>
	<c:set var="reviewScore" value="${ReviewScore }"/>
	<c:set var="reviewCount" value="${ReviewCount }"/>

	<jsp:include page="include/top.jsp" />
	<br>
	<div class="container" align="center">
		<table border="0" cellspacing="0" width="1010px">
			<tr>
				<td rowspan="5">
					<img src="<%=request.getContextPath() %>/resources/image_package/${cont.getTravel_image() }"
										width="500px" height="350px" id="contImg">
				</td>
				<td>
					<span class="toptag">패키지</span>&nbsp;&nbsp;<span class="toptag">${cont.getTravel_spec() }</span><br>
					<span style="font-size: 20px;"><b>${cont.getTravel_name() }</b></span>
				</td>
			</tr>	
			
			<tr height="20px">
				<td style=" font-size: 13px;">
					ⓘ 여행상품 특성상 예약시기, 조건에 따른 상품가 차이가 있을 수 있습니다.
				</td>
			</tr>
			
			<tr>
				<td align="right">
					<hr color="lightgray">
					<span id="star_and_comment">⭐&nbsp;
					<c:if test="${!empty reviewScore }">
						${reviewScore }
					</c:if>
					
					<c:if test="${empty reviewScore }">
						0.0
					</c:if>
					
					&nbsp;&nbsp;
					🗨&nbsp;${reviewCount }</span><br>
					<hr color="lightgray">
				</td>
			</tr>
			
			<tr>
				<td>
					<table border="0" cellspacing="5">
						<tr>
							<td align="center" width="90px">
								<span style="font-size: 20px;">📅</span>
							</td>
							
							<c:if test="${!empty cont.getTravel_air() }">
								<td align="center" width="90px">
									<span style="font-size: 20px;">✈️</span>
								</td>
							</c:if>
							
							<td align="center" width="90px">
								<span style="font-size: 20px;">🆓</span>
							</td>
							
							<td align="center" width="90px">
								<span style="font-size: 20px;">🧑🏾‍🤝‍🧑🏻</span>
							</td>
							
						</tr>
						<tr>
							<td align="center" width="90px">
								<span style="font-size: 13px;">${cont.getTravel_calender() }</span>
							</td>
							
							<c:if test="${!empty cont.getTravel_air() }">
								<td align="center" width="90px">
									<span style="font-size: 13px;">항공 탑승</span>
								</td>
							</c:if>
							
							<td align="center" width="90px">
								<span style="font-size: 13px;">자유일정포함</span>
							</td>
							
							<td align="center" width="90px">
								<span style="font-size: 13px;">단체행사
								<span class="tooltip_together">ⓘ<p>다른 일행분들과 함께 단체로 진행하는 패키지 상품입니다.</p></span>
								</span>
							</td>
							
						</tr>
					</table>
					
				</td>
			</tr>
			
			<tr>
				<td class="decide_info">
					<span class="item">출발예정</span>
					<c:if test="${!empty cont.getTravel_air() }">
						<span class="item">항공예정</span>
					</c:if>
					<span class="item">일정예정</span>
					<span class="item">호텔예정</span>
					<span class="item">가격예정</span>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="right">
					<br>
					<span>1인 기준</span><br>
		        	<span style="font-size: 25px;"><b><fmt:formatNumber value="${cont.getTravel_price() }"/></b></span>
		        	<span style="font-size: 18px;">원</span>
				</td>
			</tr>
		</table>
		
		<br><br>
	    
	    <div class="contContainer">
	    
	        <div class="content" align="left">
	        		
	        		<span style="font-weight:bold; font-size: 23px;">여행 주요일정</span><br>
	        		
	        		<br>
	        		<table border="0" cellspacing="3" width="70%" style="font-size: 15px; line-height: 1.5em;">
	        			<tr>
	        				<td>
	        					<span style="font-weight: bold;">일정&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	        				</td>
	        				
	        				<td>
	        					${cont.getTravel_calender() }&nbsp;&nbsp;&nbsp;&nbsp;
	        					<c:if test="${!empty cont.getTravel_air() }">
	        						✈️ ${cont.getTravel_air() }
	        					</c:if>
	        				</td>
	        			</tr>
	        			
	        			<c:if test="${!empty cont.getTravel_departure_date() }">
		        			<tr>
		        				<td>
		        					&nbsp;
		        				</td>
		        				
		        				<td>
		        					출발 : ${cont.getTravel_departure_date() }
		        				</td>
		        			</tr>
	        			</c:if>
	        			
	        			<c:if test="${!empty cont.getTravel_return_date() }">
		        			<tr>
		        				<td>
		        					&nbsp;
		        				</td>
		        				
		        				<td>
		        						도착 : ${cont.getTravel_return_date() }
		        				</td>
		        			</tr>
	        			</c:if>
	        			
	        		</table>
	        		<br>
	        		
	        		<hr size="1" width="97%" color="lightgray">
					<br>

	        		<span style="font-weight:bold; font-size: 23px;">가이드/인솔자 및 미팅정보</span><br>
	        		
	        		<br>
	        		<table border="0" cellspacing="3" width="70%" style="font-size: 15px; line-height: 1.7em;">
	        			<tr>
	        				<td>
	        					<span style="font-weight: bold;">가이드&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	        				</td>
	        				
	        				<td>
	        					<span>현지 도착시 가이드와 미팅이 이루어집니다.</span>
	        				</td>
	        			</tr>
	        			
	        			<tr>
	        				<td>
	        					<span style="font-weight: bold;">인솔자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
	        				</td>
	        				
	        				<td>
	        					<span>인솔자가 동행하지 않습니다.</span>
	        				</td>
	        			</tr>
	        		</table>
	        		<br>
	        		
	        		<table cellspacing="0" width="100%" style="border: 1px solid blueviolet; line-height: 1.5em;">
	        			<tr>
	        				<td style="padding: 20px;">
	        					<span style="font-size: 17px;">✔ 미팅정보</span>
	        				<td>
	        			</tr>

	        			<c:if test="${!empty cont.getTravel_meeting_time() }">
		        			<tr>
		        				<td style="font-size: 15px; padding: 0 20px 0 20px;">
		        					일시 : <b>${cont.getTravel_meeting_time() }</b>
		        				</td>
		        			</tr>
	        			</c:if>
	        			
	        			<c:if test="${empty cont.getTravel_meeting_time() }">
	        				<tr>
		        				<td style="font-size: 15px; padding: 0 20px 0 20px;">
		        					일시 : <b>개별 연락 예정</b>
		        				</td>
		        			</tr>
	        			</c:if>
	        			
	        			<c:if test="${!empty cont.getTravel_meeting_loc() }">
		        			<tr>
		        				<td style="font-size: 15px; padding: 0 20px 0 20px;">
		        					장소 : <b>${cont.getTravel_meeting_loc() }</b>
		        				</td>
		        			</tr>
	        			</c:if>
	        			
	        			<c:if test="${empty cont.getTravel_meeting_loc() }">
	        				<tr>
		        				<td style="font-size: 15px; padding: 0 20px 0 20px;">
		        					장소 : <b>개별 연락 예정</b>
		        				</td>
		        			</tr>
	        			</c:if>
	        			
	        			<tr>
	        				<td style="padding: 20px 20px 0 20px;">
	        					<span style="font-size: 13px; color: blueviolet;">※ 터미널과 미팅장소를 꼭 확인하세요!</span>
	        				</td>
	        			</tr>
	        			
	        			<tr>
	        				<td style="padding: 0 20px 20px 20px;">
	        					<span style="font-size: 13px;">※ 항공사 탑승수속(선박 승선수속) 마감시간까지 수속을 마치지 못한 경우 출국이 거절될 수 있으며 이 경우 당사의 책임범위가 아님을 알려드립니다. 안전한 출국을 위해 하나투어 미팅시간까지는 반드시 공항(터미널)에 도착해 주시기 바랍니다.
	        					</span>
	        				</td>
	        			</tr>
	        		</table>
	        		
	        		<br>
	        		<hr size="1" width="97%" color="lightgray">
					<br>
					
					<span style="font-weight:bold; font-size: 23px;">상품 소개</span><br>
					<br>
					<span style="line-height: 1.5em; font-size: 15px;">${cont.getTravel_cont() }</span>
						
					<br>
	        		<hr size="1" width="97%" color="lightgray">
					<br>
					
					<table border="0" cellspacing="0" width="100%">
						<tr>
							<td>
								<span style="font-weight:bold; font-size: 23px;">상품평</span><br><br><br>
							</td>
							
							<td align="right" style="vertical-align: top; padding-right: 20px;">
								<input type="button" id="review_write_btn" value="상품평쓰기" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
							</td>
						</tr>
					</table>
					
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel">상품평쓰기</h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      
								      <form action="<%=request.getContextPath() %>/review_write.do" method="post" onsubmit="return nullCheck();">
								      	<input type="hidden" name="travel_num_fk" value="${cont.getTravel_num() }">
									      <div class="modal-body">
									          <div class="form-group">
									            <label for="recipient-name" class="col-form-label">별점</label>
									            <select class="form-control" id="recipient-name" name="treview_score">
									            	<option value="1">⭐</option>
									            	<option value="2">⭐⭐</option>
									            	<option value="3">⭐⭐⭐</option>
									            	<option value="4">⭐⭐⭐⭐</option>
									            	<option value="5" selected>⭐⭐⭐⭐⭐</option>
									            </select>
									          </div>
									          <div class="form-group">
									            <label for="message-text" class="col-form-label">내용</label>
									            <textarea class="form-control" id="message-text" rows="8" name="treview_comm"></textarea>
									            <div id="test_cnt">(0 / 200)</div>
									          </div>
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
									        <button type="submit" id="modal_submit" class="btn btn-primary">등록</button>
									      </div>
								      </form>
								    </div>
								  </div>
								</div>
								
								<script>
 
							    $(document).ready(function() {
							        $('#message-text').on('keyup', function() {
							            $('#test_cnt').html("("+$(this).val().length+" / 200)");
							 
							            if($(this).val().length > 200) {
							                $(this).val($(this).val().substring(0, 200));
							                $('#test_cnt').html("(200 / 200)");
							            }
							        });
							    });
							        
							    </script>
					
					<table border="0" cellspacing="3" width="95%">
					
						<tr>
							<td style="font-weight:bold; font-style:italic; font-size: 17px; height: 2em;">
								구매고객평점
							</td>
						</tr>

						<c:if test="${!empty reviewList }">
						
						<tr>
							<td>
								<c:if test="${!empty reviewScore }">
									<span style="font-weight: bold; font-size: 40px;">${reviewScore }</span>
									<span style="font-weight: bold; font-size: 25px; color: lightgray">&nbsp;/&nbsp;5</span> &nbsp;&nbsp;&nbsp;
									
									<c:if test="${reviewScore > '4.5' }">
										 <img src="<%=request.getContextPath() %>/resources/image/star5.png" width="200px">
									</c:if>
									<c:if test="${reviewScore > '4.0' && reviewScore <= '4.5' }">
										 <img src="<%=request.getContextPath() %>/resources/image/star4@5.png" width="200px">
									</c:if>
									<c:if test="${reviewScore > '3.5' && reviewScore <= '4.0' }">
										 <img src="<%=request.getContextPath() %>/resources/image/star4.png" width="200px">
									</c:if>
									<c:if test="${reviewScore > '3.0' && reviewScore <= '3.5' }">
										 <img src="<%=request.getContextPath() %>/resources/image/star3@5.png" width="200px">
									</c:if>
									<c:if test="${reviewScore > '2.5' && reviewScore <= '3.0' }">
										 <img src="<%=request.getContextPath() %>/resources/image/star3.png" width="200px">
									</c:if>
									<c:if test="${reviewScore > '2.0' && reviewScore <= '2.5' }">
										 <img src="<%=request.getContextPath() %>/resources/image/star2@5.png" width="200px">
									</c:if>
									<c:if test="${reviewScore > '1.5' && reviewScore <= '2.0' }">
										 <img src="<%=request.getContextPath() %>/resources/image/star2.png" width="200px">
									</c:if>
									<c:if test="${reviewScore > '1.0' && reviewScore <= '1.5' }">
										 <img src="<%=request.getContextPath() %>/resources/image/star1@5.png" width="200px">
									</c:if>
									<c:if test="${reviewScore > '0.5' && reviewScore <= '1.0' }">
										 <img src="<%=request.getContextPath() %>/resources/image/star1.png" width="200px">
									</c:if>
									<c:if test="${reviewScore > '0' && reviewScore <= '0.5' }">
										 <img src="<%=request.getContextPath() %>/resources/image/star0@5.png" width="200px">
									</c:if>
									<c:if test="${empty reviewScore}">
										 <img src="<%=request.getContextPath() %>/resources/image/star0.png" width="200px">
									</c:if>
								
								</c:if>
							</td>
						</tr>
						
						</c:if>
					</table>
					<br>
					
					<table border="0" cellspacing="0" width="500">	
	
						<c:if test="${!empty reviewList }">
							<c:forEach items="${reviewList }" var="i">
								<table>
									<tr>
										<td>
											<c:if test="${i.treview_score == 5 }">
												 <img src="<%=request.getContextPath() %>/resources/image/star5.png" width="80px">
											</c:if>
											<c:if test="${i.treview_score == 4 }">
												 <img src="<%=request.getContextPath() %>/resources/image/star4.png" width="80px">
											</c:if>
											<c:if test="${i.treview_score == 3 }">
												 <img src="<%=request.getContextPath() %>/resources/image/star3.png" width="80px">
											</c:if>
											<c:if test="${i.treview_score == 2 }">
												 <img src="<%=request.getContextPath() %>/resources/image/star2.png" width="80px">
											</c:if>
											<c:if test="${i.treview_score == 1 }">
												 <img src="<%=request.getContextPath() %>/resources/image/star1.png" width="80px">
											</c:if>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<span style="font-size: 15px; vertical-align: top;">20${i.treview_date.substring(0,2) }.${i.treview_date.substring(3,5) }.${i.treview_date.substring(6,8)}</span>
										</td>
									</tr>
									
									<tr>
										<td style="font-weight: bold; padding-top: 15px; font-size: 15px;">
											상품명
										</td>
									</tr>
									
									<tr>
										<td style="font-size: 15px;">
											${cont.getTravel_name() }
										</td>
									</tr>
									
									<tr>
										<td style="font-weight: bold; padding-top: 15px; font-size: 15px;">
											내용
										</td>
									</tr>
									
									<tr>
										<td style="font-size: 15px;">
											${i.treview_comm }
										</td>
									</tr>
									
									
								</table>
								<br>
								<hr size="1" width="97%" color="lightgray">
								<br>
							</c:forEach>
						</c:if>
						
						<c:if test="${empty reviewList }">
							<tr>
								<td colspan="2" align="center">
									<h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									리뷰가 없습니다.</h4>
								</td>	
							</tr>
						</c:if>

					</table>
		
	        </div>
	        
	        <div class="sidebar">
	        	<table border="0" cellspacing="3" width="100%">
	        		<tr>
	        			<td>
    			       		<strong class="tit" style="text-align: left;">인원선택</strong>
    			       	</td>
    			       	<td>
    			       	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    			       	</td>
    			       	
    			    </tr>
	        	</table>
	        	
	        	<br>
	        	<table border="0" cellspacing="3" width="100%">
	        		<tr>
	        			<td>
	        				<table>
	        					<tr>
	        						<td>
	        							<span style="font-size: 10px;">1인 기준</span>
	        						</td>
	        					</tr>
	        					<tr>
	        						<td>
	        							<span id="package_total" style="font-size: 18px;"><b><fmt:formatNumber value="${cont.getTravel_price() }" type="number"/></b></span>
	        							<span style="font-size: 15px;"><b>원</b></span>
	        						</td>
	        					</tr>
	        				</table>
	        			</td>
	        			
	        			<td>
	        				<script type="text/javascript">

	        					function setComma(str) {
	        						return Number(String(str).replace(/\..*|[^\d]/g, "")).toLocaleString().slice(0,-3);
	        					}
	        					
	        					function removeComma(str) {
	        						return parseInt(str.replace(/,/g, ""));
	        					}
	        				
	        					function count(type)  {
	        					  // 결과를 표시할 element
	        					  const count = document.getElementById('package_count');
	        					  const total = document.getElementById('package_total_price');
	        					  
	        					  // 현재 화면에 표시된 값
	        					  var cnt = count.value;
	        					  var result = removeComma(total.innerText);
	        					  
	        					  // 더하기/빼기
	        					  if(type === 'plus') {
	        						  cnt = parseInt(cnt) + 1;
	        						  result = parseInt(result) + ${cont.getTravel_price() };
	        					    
	        					  }else if(type === 'minus')  {
	        						  if(cnt > 1) {
	        							  cnt = parseInt(cnt) - 1;
	        							  result = parseInt(result) - ${cont.getTravel_price() };
	        						  }
	        					    
	        					  }
	        					  
	        					  // 결과 출력
	        					  count.value = cnt;
	        					  result = result.toLocaleString();
	        					  total.innerText = result;
	        					}
	        					
	        				</script>
	        				<input type="button" id="dec_btn" value="−" onclick='count("minus")'>
	        				<input id="package_count" name="package_count" style="text-align:center; width: 33px;" value="1" readonly>
	        				<input type="button" id="inc_btn" value="+" onclick='count("plus")'>
	        				
	        				
	        			</td>
	        		</tr>
	        	</table>
	        	<br>
	        	<hr size="1" width="95%" color="lightgray">
	        	<br>
	        	<table border="0" cellspacing="3" width="100%">
	        		<tr>
	        			<td align="left">
	        				<span style="font-size: 18px;"><b>총 금액</b></span>
	        			</td>
	        			
	        			<td align="right">
	        				<span id="package_total_price" name="package_total_price" style="font-weight: bold; font-size: 25px; color: blueviolet;"><fmt:formatNumber value="${cont.getTravel_price() }"/></span>
		        			<span style="font-size: 15px; color: blueviolet;">원</span>
	        			</td>
	        		</tr>
	        	</table>
	        	<br>
	        	<table style="border:1px solid lightgray;" cellspacing="0" width="100%" >
	        		<tr>
	        		<td align="center" style="padding: 7px;">
			        	<span id="toc-toggle" onclick="openCloseToc()">상품가격 안내 ▽</span>
							<ol id="toc-content" style="margin-left: -35px; margin-top: 10px;">
							  <li style="text-align: left;">※ 유류할증료 및 제세공과금은 유가와 환율에 따라 변동될 수 있습니다.</li>
							  <li style="text-align: left;">※ 1인 객실 사용시 추가요금 발생됩니다.<br>
							  		&nbsp;&nbsp;&nbsp;- 1인 객실 사용료 : 문의</li>
							  <li style="text-align: left;">※ 여행 기간 중 만 2세가 되는 경우 요금 별도 문의</li>
							</ol>
					</td>
				</table>
				<br>
	        	<hr size="1" width="95%" color="lightgray">
	        	<br>
	        	<input type="button" id="package_reservation" value="예약하기" onclick="location.href='reserve_travel.do?no=${cont.getTravel_num() }&id=${member_id}'"> 
	        	<%-- <input type="button" id="package_jjim" value="♡" onclick="location.href='jjim.do?num=${cont.getTravel_num()}'">  --%>
	   
	        </div>
	    </div>

	    
	</div>
	<br>
	
	<jsp:include page="include/footer.jsp" />
	
<script type="text/javascript" defer>
	
	$(document).ready(function() {
		
		let review = document.querySelector('#review_write_btn');
		
	    <%
	    if(session.getAttribute("member_id") == null){ 
	    %>
	       review.addEventListener('click', function(){
	    	   alert("로그인이 필요한 서비스 입니다.\n로그인을 먼저 진행해 주세요.");
		       location.href="<%=request.getContextPath()%>/login.do";
	       })
	    <%
	       }
	    %>

	}); 
	
	let text_cont = document.querySelector("#message-text");
	let modal_submit = document.querySelector("#modal_submit");
	let review = document.querySelector('#review_write_btn');
	
	function nullCheck(){
		if(text_cont.value == "" || text_cont.value == null){
				alert("내용을 입력해주세요.");
				return false;
		}
	}
	
	


	

</script>	
</body>
</html>