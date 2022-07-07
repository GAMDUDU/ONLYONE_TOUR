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
	<link rel="stylesheet" type="text/css" href="${path}/resources/css/hotel_cont.css">
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
</script>
<style type="text/css">
	.row-0{
		position: relative;
	} 	
	.col-0-0 {
		position: relative;
	}
	
	#contImg {
		margin-right: 10px;
		padding: 10px;
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
	
	#hotel_reservation {
	  	background-color: blueviolet;
	  	width: 200px;
	  	line-height: 25px;
	  	display: table-cell;
	  	vertical-align: middle;
	  	border-radius: 4px;
	  	border: 1px solid #5e99cb;
	  	color: #fff !important;
	  	font-size: 15px;
	  	padding: 0 35px;
	  	height: 50px;
  	    font-weight: 500;
  	    text-align: center;
  	    cursor: pointer;
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
				<td rowspan="3">
					<img src="<%=request.getContextPath() %>/resources/image_hotel/${cont.getHotel_image() }"
										width="500px" height="350px" id="contImg">
				</td>
				<td colspan="2">
					<span class="toptag">숙소</span>&nbsp;&nbsp;<span class="toptag">${cont.getHotel_country() }</span><br>
					<span style="font-size: 23px;"><b>${cont.getHotel_hname() }</b></span><br>
					<span style="font-size: 15px; color: gray">${cont.getHotel_ename() }</span>					
				</td>
			</tr>	
			
			<tr>
				<td colspan="2" align="left">
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
				<td align="left">
					<br>
					<span style="font-size: 18px;"><b>1박 요금 최저가</b></span><br>
					<span style="font-size: 13px; color: gray">세금, 봉사료 포함</span><br>		        	
				</td>
				
				<td align="right">
					<span style="font-size: 30px;"><b><fmt:formatNumber value="${cont.getHotel_price1() }"/></b></span>
		        	<span style="font-size: 18px;">원 ~ </span>
				</td>
			</tr>
		</table>
		<br>
		
		<table style="border-top: 2px solid black; border-bottom: 2px solid black" width="1000px">
			<tr>
				<td height="60px" style="padding-top: 10px;">
					<span style="font-weight:bold; font-size: 20px;">숙소정보</span>
				</td>
			</tr>
			<tr>
				<td height="45px">
					🗺&nbsp;&nbsp;${cont.getHotel_loc() }
				</td>
			</tr>
			
			<c:if test="${!empty cont.getHotel_chkin() }">
				<tr>
					<td  height="40px">
						🕘&nbsp;&nbsp;체크인&nbsp;${cont.getHotel_chkin() },&nbsp;&nbsp;체크아웃&nbsp;${cont.getHotel_chkout() }
					</td>
				</tr>
			</c:if>
			
			<c:if test="${empty cont.getHotel_chkin() }">
				<tr>
					<td height="40px">
						🕘&nbsp;&nbsp;체크인, 체크아웃 정보가 없습니다.
					</td>
				</tr>
			</c:if>
			
			<c:if test="${!empty cont.getHotel_phone() }">
				<tr>
					<td height="40px">
						📞&nbsp;&nbsp;${cont.getHotel_phone() }
					</td>
				</tr>
			</c:if>
			
			<c:if test="${empty cont.getHotel_phone() }">
				<tr>
					<td height="40px">
						📞&nbsp;&nbsp;연락처 정보가 없습니다.
					</td>
				</tr>
			</c:if>
			
			<tr>
				<td height="10px">
					&nbsp;
				</td>
			</tr>	
		</table>
		<br><br>
		
		<table border="0" width="1000px">
			<tr>
				<td colspan="3" align="left">
					<span style="font-weight:bold; font-size: 20px;">전체객실</span>
					<hr color="lightgray">
				</td>
			</tr>
			
			<tr>
				<td align="left" width="60%">
					<span style="font-weight:bold; font-size: 17px;">&nbsp;&nbsp;&nbsp;&nbsp;${cont.getHotel_room1() }</span>
				</td>
				
				<td align="left" width="20%">
					<span>1박 기준</span><br>
					<span style="font-size: 23px;"><b><fmt:formatNumber value="${cont.getHotel_price1() }"/></b></span>
		        	<span style="font-size: 16px;">원</span>
				</td>
				
				<td align="right" width="20%">
					<input type="button" id="hotel_reservation" value="예약하기" onclick="location.href='reseve_hotel.do?no=${cont.getHotel_num() }&id=${member_id}&room=${cont.getHotel_room1() }&price=${cont.getHotel_price1() }'"> 
				</td>
			</tr>
			
			<tr>
				<td colspan="3">
					<hr color="lightgray">
				</td>
			</tr>
			
			<c:if test="${!empty cont.getHotel_room2() }">
				<tr>
					<td align="left" width="60%">
						<span style="font-weight:bold; font-size: 17px;">&nbsp;&nbsp;&nbsp;&nbsp;${cont.getHotel_room2() }</span>
					</td>
					
					<td align="left" width="20%">
						<span>1박 기준</span><br>
						<span style="font-size: 23px;"><b><fmt:formatNumber value="${cont.getHotel_price2() }"/></b></span>
			        	<span style="font-size: 16px;">원</span>
					</td>
					
					<td align="right" width="20%">
						<input type="button" id="hotel_reservation" value="예약하기" onclick="location.href='reseve_hotel.do?no=${cont.getHotel_num() }&id=${member_id}&room=${cont.getHotel_room2() }&price=${cont.getHotel_price2() }'"> 
					</td>
				</tr>
				
				<tr>
					<td colspan="3">
						<hr color="lightgray">
					</td>
				</tr>
			</c:if>
			
			<c:if test="${!empty cont.getHotel_room3() }">
				<tr>
					<td align="left" width="60%">
						<span style="font-weight:bold; font-size: 17px;">&nbsp;&nbsp;&nbsp;&nbsp;${cont.getHotel_room3() }</span>
					</td>
					
					<td align="left" width="20%">
						<span>1박 기준</span><br>
						<span style="font-size: 23px;"><b><fmt:formatNumber value="${cont.getHotel_price3() }"/></b></span>
			        	<span style="font-size: 16px;">원</span>
					</td>
					
					<td align="right" width="20%">
						<input type="button" id="hotel_reservation" value="예약하기" onclick="location.href='reseve_hotel.do?no=${cont.getHotel_num() }&id=${member_id}&room=${cont.getHotel_room3() }&price=${cont.getHotel_price3() }'"> 
					</td>
				</tr>
				
				<tr>
					<td colspan="3">
						<hr size="1" color="lightgray">
					</td>
				</tr>
			</c:if>
			
		</table>
		<br><br>
		
		<table border="0" width="1000px">
			<tr>
				<td colspan="3" align="left">
					<hr size="1" color="lightgray" width="1000px">
					<span style="font-weight:bold; font-size: 20px; line-height: 2em;">숙소 설명</span>
				</td>
			</tr>
			<tr>
				<td height="10px">
					&nbsp;
				</td>
			</tr>
			<c:if test="${empty cont.getHotel_exp() }">
				<tr>
					<td>
						<span style="line-height: 1.5em; font-size: 15px;">상세 정보가 없습니다.</span>
					</td>
				</tr>
			</c:if>
			
			<c:if test="${!empty cont.getHotel_exp() }">
				<tr>
					<td>
						<span style="line-height: 1.5em; font-size: 15px;">${cont.getHotel_exp() }</span>
					</td>
				</tr>
			</c:if>
		</table>
		<hr size="1" color="lightgray" width="1000px">
		<br>
		
		<table border="0" cellspacing="0" width="1000px">
			<tr>
				<td>
					<span style="font-weight:bold; font-size: 20px;">상품평</span><br><br><br>
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
					        <button type="button" id="close1" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      
					      <form action="<%=request.getContextPath() %>/hotel_review_write.do" method="post" onsubmit="return nullCheck();">
					      	<input type="hidden" name="hotel_num_fk" value="${cont.getHotel_num() }">
						      <div class="modal-body">
						          <div class="form-group">
						            <label for="recipient-name" class="col-form-label">별점</label>
						            <select class="form-control" id="recipient-name" name="hreview_score">
						            	<option value="1">⭐</option>
						            	<option value="2">⭐⭐</option>
						            	<option value="3">⭐⭐⭐</option>
						            	<option value="4">⭐⭐⭐⭐</option>
						            	<option value="5" selected>⭐⭐⭐⭐⭐</option>
						            </select>
						          </div>
						          <div class="form-group">
						            <label for="message-text" class="col-form-label">내용</label>
						            <textarea class="form-control" id="message-text" rows="8" name="hreview_comm"></textarea>
						            <div id="test_cnt">(0 / 200)</div>
						          </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						        <button type="submit" id="hotel_submit" class="btn btn-primary">등록</button>
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
		
		<table border="0" cellspacing="3" width="1000px">
		
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
		<br><br>
		
		<table border="0" cellspacing="0" width="1000">	

			<c:if test="${!empty reviewList }">
				<c:forEach items="${reviewList }" var="i">
					<table border="0" cellspacing="0" width="1000">
						<tr>
							<td>
								<c:if test="${i.hreview_score == 5 }">
									 <img src="<%=request.getContextPath() %>/resources/image/star5.png" width="80px">
								</c:if>
								<c:if test="${i.hreview_score == 4 }">
									 <img src="<%=request.getContextPath() %>/resources/image/star4.png" width="80px">
								</c:if>
								<c:if test="${i.hreview_score == 3 }">
									 <img src="<%=request.getContextPath() %>/resources/image/star3.png" width="80px">
								</c:if>
								<c:if test="${i.hreview_score == 2 }">
									 <img src="<%=request.getContextPath() %>/resources/image/star2.png" width="80px">
								</c:if>
								<c:if test="${i.hreview_score == 1 }">
									 <img src="<%=request.getContextPath() %>/resources/image/star1.png" width="80px">
								</c:if>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span style="font-size: 15px; vertical-align: top;">20${i.hreview_date.substring(0,2) }.${i.hreview_date.substring(3,5) }.${i.hreview_date.substring(6,8)}</span>
							</td>
						</tr>
						
						<tr>
							<td style="font-weight: bold; padding-top: 15px; font-size: 15px;">
								상품명
							</td>
						</tr>
						
						<tr>
							<td style="font-size: 15px;">
								${cont.getHotel_hname() }
							</td>
						</tr>
						
						<tr>
							<td style="font-weight: bold; padding-top: 15px; font-size: 15px;">
								내용
							</td>
						</tr>
						
						<tr>
							<td style="font-size: 15px;">
								${i.hreview_comm }
							</td>
						</tr>
						
						
					</table>
					<br>
					<hr size="1" width="1000px" color="lightgray">
					<br>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty reviewList }">
				<tr>
					<td colspan="2" align="center">
						<h4>리뷰가 없습니다.</h4>
					</td>	
				</tr>
			</c:if>

		</table>
		
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
	let modal_submit = document.querySelector("#hotel_submit");
	
	function nullCheck(){
		if(text_cont.value == "" || text_cont.value == null){
				alert("내용을 입력해주세요.");
				return false;
		}
	}
	
	
	

</script>	

</body>
</html>