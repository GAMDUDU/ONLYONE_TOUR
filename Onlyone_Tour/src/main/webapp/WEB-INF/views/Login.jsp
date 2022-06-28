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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
	<jsp:include page="include/top.jsp" />
	
	<hr width="100%" color="gray">
	
		<!-- 아이디 찾기  -->
	 <div class="black-bg1">
        <div class="white-bg1">
          <h4>아이디 찾기</h4>
            <form method="post" action="<%=request.getContextPath()%>/findId.do">
                <div class="my-3">
                    <input type="text" class="form-control" id="name1" name="member_name" placeholder="이름을 입력해주세요." required="required">
                </div>
                
                <div class="my-3">
                    <input type="text" class="form-control" id="phone1" name="member_phone" placeholder="휴대폰 번호를 입력해주세요." required="required">
                </div>
                
                <button id ="submit1" type="submit" class="btn btn-primary">찾기</button>
                <button id ="close1" type="button" class="btn btn-danger">닫기</button>
            </form> 
        </div>
   	 </div> 
	
	<!-- 비밀번호 찾기  -->
 	<div class="black-bg2">
        <div class="white-bg2">
          <h4>비밀번호 찾기</h4>
            <form method="post" action="<%=request.getContextPath()%>/findPwd.do">
                <div class="my-3">
                    <input type="text" class="form-control" id="id1" name="member_id" placeholder="아이디를 입력해주세요" required="required">
                </div>
                
                <div class="my-3">
                    <input type="email" class="form-control" id="email2" name="member_email" placeholder="이메일을 입력해주세요" required="required">
                </div>
                
                <button id ="submit2" type="submit" class="btn btn-primary">찾기</button>
                <button id ="close2" type="button" class="btn btn-danger" id="close">닫기</button>
            </form> 
        </div>
   	 </div> 
	
	
	
	
	<div id="container">
		<div class="login-text">
			<strong>로그인</strong>
		</div>
		
		
		<form method="post" action="<%=request.getContextPath()%>/login_ok.do" onsubmit="return frm_check();">
			<ul class="from_login">
				<li>
					<input id="login_id" class="login_box" type="text" placeholder="아이디(이메일계정)" name="id">
				</li>
				<li>
					<input class="login_box" type="password" placeholder="비밀번호" name="pwd">
				</li>
				
				<!-- 아이디 저장 체크 기능 -->
				<li class="form_holder check">
					<input type="checkbox" class="save_id" name="checkId" id="saveId">
					<label for="saveId" class="label_checkbox">
						아이디 저장
					</label>
				</li>
			</ul>
			
			<div class="login_button">
				<input type="submit" value="로그인">
			</div>
		</form>
		
		<div class="login_bar">
			<button id="login" class="login_menu_bar">아이디 찾기</button>
				
			<button id="password-search" class="login_menu_bar">비밀번호 찾기</button>
			
			<a href="<%=request.getContextPath()%>/join.do">
				<span>회원가입</span>
			</a>
		</div>
		
	</div>
	
	<hr width="100%" color="gray">
	
	<jsp:include page="include/footer.jsp" />
	
<script type="text/javascript" src="${path}/resources/js/login.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>