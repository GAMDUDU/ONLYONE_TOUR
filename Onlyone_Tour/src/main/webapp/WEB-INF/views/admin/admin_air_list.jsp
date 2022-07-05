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

</style>
</head>
<body>

	<%@include file="adminInclude/admin_top.jsp" %>
	<%@include file="adminInclude/admin_aside.jsp" %>
	
	<div class="container-fluid">
      <div class="col-md-8 col-md-offset-3">
      
       <div class="row">
			<c:set var="list" value="${list }" /> 
			<c:set var="paging" value="${Paging}"/>
			<c:set var="total" value="${total}"/>
			
    	  	<br><br><br>
    	  	<div align="right">
	    	  <input type="button" value="항공권 등록" class="btn btn-primary"
	                 onclick="location.href='admin_air_write.do'">
	  		</div>
	  		<br> 			         
			<table class="table table-bordered text-center" >
         		<tr class="info">
         			<th class="text-center">순번</th>
         			<th class="text-center">항공사</th>
         			<th class="text-center">항공번호</th>
         			<th class="text-center">출발지</th>
         			<th class="text-center">출발날짜</th>
         			<th class="text-center">출발시간</th>
         			<th class="text-center">도착지</th>
         			<th class="text-center">도착시간</th>
         			<th></th>
         		</tr>
         	
         		<c:if test="${!empty list }">
         		  <c:forEach items="${list }" var="air">
		            <tr style="vertical-align:middle;" id="tr_info">
		               <td style="vertical-align:middle;"> ${air.getAir_num() } </td>
		               <td style="vertical-align:middle;"> ${air.getAir_airline() } </td>
		               <td style="vertical-align:middle;"> ${air.getAir_name() } </a></td>
		               <td style="vertical-align:middle;"> ${air.getAir_departure() } </td>
		               <td style="vertical-align:middle;"> ${air.getAir_date() } </td>
		               <td style="vertical-align:middle;"> ${air.getAir_departure_date() } </td>
		               <td style="vertical-align:middle;"> ${air.getAir_arrival() } </td>
		               <td style="vertical-align:middle;"> ${air.getAir_arrival_date() } </td>
		               <td style="vertical-align:middle;">
		                 	<a class="btn btn-info btn-sm" href="<%=request.getContextPath() %>/admin_air_content.do?no=${air.getAir_num() }&page=${paging.page }">
		                 		상세내역 확인
		               		</a>
	 	            </tr>
 	             </c:forEach>
 	          </c:if>
 	          
 	          <c:if test="${empty list }">
				<tr>
					<td colspan="10">항공권이 존재하지 않습니다.</td>
				</tr>
			  </c:if>		    	    
			</table>
 	    	
 	        <!-- 페이징 처리 부분 -->
			<nav class="text-center">
  				<ul class="pagination">
					<c:if test="${paging.getPage() > paging.getBlock()}">
						<li><a href="admin_air.do?page=1">처음으로</a></li>
						<li><a href="admin_air.do?page=${paging.getStartBlock() - 1}">◀</a></li>
					</c:if>
					
					<c:forEach begin="${paging.getStartBlock() }"
										end="${paging.getEndBlock() }" var="i">
						
						<c:if test="${i == paging.getPage() }">
							<li class="active"><a href="admin_air.do?page=${i}">${i}</a></li>
						</c:if>
						
						<c:if test="${i != paging.getPage() }">
							<li><a href="admin_air.do?page=${i}">${i}</a></li>
						</c:if>
					</c:forEach>
					
					<c:if test="${paging.getEndBlock() < paging.getAllPage()}">
						<li><a href="admin_air.do?page=${paging.getEndBlock() + 1}">▶</a></li>
						<li><a href="admin_air.do?page=${paging.getAllPage()}">마지막으로</a></li>
					</c:if>
				</ul>
			</nav>
        </div>
        
        <div class="text-center">
	        <form method="post" class="form-inline"
		      action="<%=request.getContextPath() %>/air_search.do">
		   
		   	  <input type="hidden" name="page" value="${paging.getPage() }">
		   	  
		      <select name="field" class="form-control" style="width:150px;">
		         <option value="airline">항공사</option>
		         <option value="air_name">항공번호</option>
		         <option value="air_date">출발날짜</option>
		      </select>
		      
		      <input name="keyword" class="form-control" style="width:200px;">&nbsp;
		      <input type="submit" value="검색" class="btn btn-default">
		   </form>
	   </div>
	   <br><br><br><br><br>
     </div>
   </div>
   
	
   <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
   <script type="text/javascript">
   
     $(document).ready(function() {

     });
     
   </script>	
	
</body>
</html>