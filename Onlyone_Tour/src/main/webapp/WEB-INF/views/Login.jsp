<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/login.css">

</head>
<body>

	<hr width="100%" color="gray">
	
	<div id="container">
		<div class="login-text">
			<strong>로그인</strong>
		</div>
		
		<form method="post" action="<%=request.getContextPath()%>/login_ok.do">
			<ul class="from_login">
				<li><input class="login_box" type="text" placeholder="아이디(이메일계정)"></li>
				<li><input class="login_box" type="password" placeholder="비밀번호"></li>
				<!-- 아이디 저장 체크 기능 -->
				<li class="form_holder check">
					<input type="checkbox" id="check_login">
					<label for="chkLogin01" class="label_checkbox">
						아이디 저장
					</label>
				</li>
			</ul>
			
			<div class="login_button">
				<input type="submit" value="로그인">
			</div>
		</form>
		
		
		<div class="login_bar">
			<a href="location.href='#'">
				<span class="login_menu_bar">아이디 찾기</span>
			</a>
				
			<a href="location.href='#'">
				<span class="login_menu_bar">비밀번호 찾기</span>
			</a>
			
			<a href="location.href='#'">
				<span>회원가입</span>
			</a>
		</div>
		
	</div>
	
	
	<hr width="100%" color="gray">


</body>
</html>