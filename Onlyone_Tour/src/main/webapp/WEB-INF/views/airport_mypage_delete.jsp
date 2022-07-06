<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공 예약 취소</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">

</style>
</head>
<body>
   <jsp:include page="include/top.jsp" />
   </div>
   <hr width="100%" color="gray">
   <br>
   
   <div class="container-fluid">
      
      <div class="col-md-8 col-md-offset-2" style="text-algin:center;">
      
      <c:set var="num" value="${num }" />
      <c:set var="pwd" value="${pwd }" />
       <div class="row">
       		<div class="alert alert-warning text-center" role="alert" style="color:#000;font-size:20px;">
				☑️ 항공권 예약 취소 전, 본인 확인을 위해 비밀번호를 다시 한번 입력 부탁드립니다.
			</div>
			
			<br><br><br>
			<form class="form-horizontal" id="airDelete"
				action="<%=request.getContextPath() %>/airport_delete_ok.do">
				
			  <input type="hidden" name="id" value="">
			  <input type="hidden" name="num" value="">
			  
			  <div class="form-group">
			    <label class="col-sm-4 control-label" style="font-size:20px;">아이디(Id)</label>
			    <div class="col-sm-6">
			      <p class="form-control-static" style="font-size:20px;">${member_id}</p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputPassword" class="col-sm-4 control-label" style="font-size:20px;">비밀번호(Password)</label>
			    <div class="col-sm-6">
			      <input type="password" style="font-size:18px;" class="form-control" id="password" placeholder="Password">
			    </div>
			  </div>
			  
			  <br><br>
			  <p class="text-center">
			  	<button type="button" class="btn btn-primary btn-lg"
			  		onclick="goDelete(${num},'${pwd}','${member_id}');">
			  		항공권 예약 취소
			  	</button>
			  </p>
			</form>
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
   
    
     function goDelete(num,pwd,id) {
   	    
		if($("#password").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return;
	  	}
		
		if($("#password").val() != pwd) {
			alert("입력하신 비밀번호와 회원 비밀번호가 일치하지 않습니다.");
			$("#password").focus();
			return;
	  	}
	  
		
		$('input[name="id"]').attr('value', id);
		$('input[name="num"]').attr('value', num);
		  
		  
		var result = confirm('정말로 취소하시겠습니까?');
		  
		if(result) {
			$("#airDelete").submit();
		}		
	  
	}
     
   </script>
   
</body>
</html>