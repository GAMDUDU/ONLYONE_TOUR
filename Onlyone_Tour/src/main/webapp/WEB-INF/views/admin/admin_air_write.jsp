<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공권 등록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">

	th {
		text-align:center;
		vertical-align:middle;
	}
	
	input[type=text] {
		width:200px !important;
	}
	
</style>
</head>
<body>

	<%@include file="adminInclude/admin_top.jsp" %>
	<%@include file="adminInclude/admin_aside.jsp" %>
	
	<div class="container-fluid">
      <div class="col-md-8 col-md-offset-3">
      
      <c:set var="nlist" value="${nList }" />
      <c:set var="alist" value="${aList }" />
      <br><br><br>
       <div class="row">
		  <div class="alert alert-info" role="alert" style="font-size:20px;">
		  	✈️ 등록하실 항공권 정보를 입력해 주십시오.
		  </div>
	   </div>	
		 
       <div class="row">
       <form method="post" class="form-inline" id="air_write"
	   		   action="<%=request.getContextPath() %>/admin_air_write_ok.do">
	   
	      <table class="table table-bordered">
	         <tr>
	            <th class="active" style="vertical-align:middle;">항공이름</th>
	            <td> <input name="air_name" class="form-control" style="width:200px;"> </td>
	         </tr>
	         
	         <tr>
	            <th class="active" style="vertical-align:middle;">항공사</th>
	            <td>
	            	<select class="form-control" style="width:200px;" name="air_airline">
	                     <c:if test="${empty alist }">
	                        <option value="">:::항공사 목록 없음:::</option>
	                     </c:if>
	                     				                     
	                     <c:if test="${!empty alist }">
	                     	<option value="">항공사 선택</option>
	                        <c:forEach items="${alist }" var="adto">
	                     	   <option value="${adto.getAir_airline() }">
	                          		${adto.getAir_airline() }
	                           </option>
	                       	</c:forEach>
	                     </c:if>
					</select>
	            
	            </td>
	         </tr>
	         
	         <tr>
	         	<th class="active" style="vertical-align:middle;">출발지</th>
	     		<td>
					<select class="form-control" style="width:200px;" name="air_departure">
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
	         	
	         </tr>
	         <tr>
	         	<th class="active" style="vertical-align:middle;">도착지</th>
	         	<td>
					<select class="form-control" style="width:200px;" name="air_arrival">
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
			 </tr>
	         <tr>
	            <th class="active" style="vertical-align:middle;">출발날짜</th>
	            <td> 
	            	<input name="air_date" type="date" placeholder="출발날짜" class="form-control" style="width:200px;">
	            </td>
	         </tr>
	         	         
	         <tr>
	            <th class="active" style="vertical-align:middle;">출발시간</th>
	            <td> <input type="time" name="air_departure_date" class="form-control" style="width:200px;"> </td>
	         </tr>
	         	         
	         <tr>
	            <th class="active" style="vertical-align:middle;">도착시간</th>
	            <td> <input type="time" name="air_arrival_date" class="form-control" style="width:200px;"> </td>
	         </tr>
	         
	         <tr>
	            <th class="active" style="vertical-align:middle;">성인요금</th>
	            <td><label style="font-size:18px;"><input name="air_adult_fare" class="form-control" style="width:200px;">원</label></td>
	         </tr>
	         	         
	         <tr>
	            <th class="active" style="vertical-align:middle;">소아요금</th>
	            <td><label style="font-size:18px;"><input name="air_child_fare" class="form-control" style="width:200px;">원</label></td>
	         </tr>
	         
	         <tr>
	            <td colspan="2" align="center">
	               <input type="button" value="항공권 등록" class="btn btn-primary" id="insertAir">
	               &nbsp;&nbsp;&nbsp;
	               <input type="reset" value="다시작성" class="btn btn-default">
	            </td>
	         </tr>
	      </table>
	   </form>
	   	       	
       
       </div>
      <br><br><br>
     </div>
   </div>
   
	
   <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    
   <script type="text/javascript">
   
		$("#insertAir").click(function() {
			
			if ($("input[name='air_name']").val() == "") {
				swal("항공 이름을 입력해 주세요.");
				$("input[name='air_name']").focus();
				return;
			}
			
			if ($("select[name='air_airline']").val() == "") {
				swal("항공사를 선택해 주세요.");
				$("select[name='air_airline']").focus();
				return;
			}
			
			if ($("select[name='air_departure']").val() == "") {
				swal("출발지를 선택해 주세요.");
				$("select[name='air_departure']").focus();
				return;
			}
			
			if ($("select[name='air_arrival']").val() == "") {
				swal("도착지를 선택해 주세요.");
				$("select[name='air_arrival']").focus();
				return;
			}
			
			if ($("select[name='air_departure']").val() == $("select[name='air_arrival']").val()) {
				swal("출발지와 도착지를 동일하게 선택하실 수 없습니다.");
				$("select[name='air_departure']").focus();
				return;
			}
			
			if ($("input[name='air_date']").val() == "") {
				swal("출발날짜를 입력해 주세요.");
				$("input[name='air_date']").focus();
				return;
			}
			
			var today = new Date();

			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);

			var dateString = year + '-' + month  + '-' + day;
			
			
			if (dateString >= $("input[name='air_date']").val()) {
				swal("출발날짜는 오늘날짜 이후로 선택해주세요.");
				$("#input[name='air_date']").focus();
				return;
			}
			
			if ($("input[name='air_departure_date']").val() == "") {
				swal("출발시간을 입력해 주세요.");
				$("input[name='air_departure_date']").focus();
				return;
			}
			
			if ($("input[name='air_arrival_date']").val() == "") {
				swal("도착시간을 입력해 주세요.");
				$("input[name='air_arrival_date']").focus();
				return;
			}
			
			if ($("input[name='air_departure_date']").val() >= $("input[name='air_arrival_date']").val()) {
				swal("도착시간는 출발시간 이후로 선택해주세요.");
				$("#input[name='air_arrival_date']").focus();
				return;
			}
			
			if ($("input[name='air_adult_fare']").val() == "") {
				swal("성인요금을 입력해 주세요.");
				$("input[name='air_adult_fare']").focus();
				return;
			}
			
			if ($("input[name='air_child_fare']").val() == "") {
				swal("소아요금을 입력해 주세요.");
				$("input[name='air_child_fare']").focus();
				return;
			}
			
			var result = confirm('항공권을 등록하시겠습니까?');
			  
			  if(result) {
				  $("#air_write").submit();
			  }
			  
		});
	
		$(document).ready(function() {
		
		});	



			
   </script>
   
   
</body>
</html>