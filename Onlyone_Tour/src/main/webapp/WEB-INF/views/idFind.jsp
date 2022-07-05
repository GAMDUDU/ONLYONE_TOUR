<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<style type="text/css">


.black-bg1{
    width : 100%;
    height : 100%;
    position : fixed;
    background : rgba(0,0,0,0.5);
    z-index : 5;
    padding: 30px;
}

.white-bg1{
	width: 50%;
	background: white;
    border-radius: 5px;
    padding: 30px;
    margin-top: 100px;
   	margin-left: 500px;
}



</style>
</head>
<body>
	<c:set var="check" value="${check}"/>
	<c:set var="find_id" value="${FindId}"/>
	
	<div class="black-bg1">
        <div class="white-bg1">
          <h4>아이디 찾기</h4>
                <c:if test="${check == 1}">
	                <div class="my-3">
	                    <span>등록된 아이디 정보가 없습니다.</span>
	                </div>
                </c:if>
                
                <c:if test="${check == 0}">
	                <div class="my-3">
	                	<span>찾으시는 아이디는 ${FindId} 입니다.</span>
	                </div>
                </c:if>
                <button id ="close1" type="button" class="btn btn-danger" onclick="location.href='login.do'">로그인 페이지로</button>
        </div>
   	 </div> 
   	 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>	
</body>
</html>