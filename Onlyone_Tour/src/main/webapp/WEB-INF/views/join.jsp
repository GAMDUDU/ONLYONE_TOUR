<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/join.css">
<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
</head>
<body>
	
	<div class="join_main">
		<h1>회원가입</h1>
	</div>
	
	<form method="post" action="<%=request.getContextPath()%>/joinOk.do">
		<!-- 닉네임 -->
		<div class="form-group">
			<label for="user_nickname">닉네임</label>
				<input type="text" class="form-control" id="user_nickname" name="member_nickname" placeholder="닉네임" required>
			<div class="check_font" id="nickname_check"></div>
		</div>
		
		<!-- 아이디  -->
		<div class="form-group">
			<label for="user_id">아이디</label>
				<input type="text" class="form-control" id="user_id" name="member_id" placeholder="아이디" required>
			<div class="check_font" id="id_check"></div>
		</div>
		
		<!-- 비밀번호  -->
		<div class="form-group">
			<label for="user_pw">비밀번호</label>
				<input type="password" class="form_control" id="user_pw" name="member_pw" placeholder="패스워드" required> 
			<div class="check_font" id="pw_check"></div>
		</div>
		
		<!-- 비밀번호 재확인 -->
		<div class="form-group">
			<label for="user_pw2">비밀번호 확인</label>
				<input type="password" class="form_control" id="user_pw2" name="member_pw2" placeholder="패스워드 확인" required>
			<div class="check_font" id="pw2_check"></div>	
		</div>
		
		<!-- 이름 -->
		<div class="form-group">
			<label for="user_name">이름</label>
				<input type="text" class="form_control" id="user_name" name="member_name" placeholder="이름" required>
			<div class="check_font" id="name_check"></div>		
		</div>

		<!-- 이메일 -->
		<div class="form-group">
			<label for="user_email">이메일</label>
				<input type="text" class="form-control" name="user_email" id="member_email" placeholder="E-mail" required>
				<div class="check_font" id="email_check"></div>
		</div>
		
		<!-- 휴대전화 -->
		<div class="form-group">
			<label for="user_phone">휴대전화 ('-' 없이 번호만 입력해주세요)</label>
			<input type="text" class="form-control" id="user_phone" name="member_phone" placeholder="폰 번호" required>
			<div class="check_font" id="phone_check"></div>
		</div>
		
		
		<!-- 가입 버튼 -->
		<div class="reg_button">
			<button type="submit" class="btn btn-primary px-3" id="reg_submit">
				<i class="fa-solid fa-arrow-right-to-bracket">&nbsp;가입하기</i>
			</button>
			
			<a class="btn btn-danger px-3" href="${pageContext.request.contextPath}">
				<i class="fa-solid fa-arrow-rotate-right">&nbsp;취소하기</i>
			</a>&emsp;&emsp;
		</div>
	</form>
	
</body>
</html>