<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>

.container3 {
	margin-top : 3%;
	background: #fff;
	width: 270px;
	padding:0;
	position : absolute;
	height: 40%;
	overflow: auto;
	z-index: 5;
	
	overflow-x: hidden;
}

.mcd-menu{
	position: absolute;
	
	
}

.sList{
	border-bottom : 2px solid;
	padding-top: 50px;
}

.mcd-menu ul a:hover {
	
	color : #9046cf;
		
}

.container3 a{
	text-decoration: none;	
}

</style>

<body>
	
	<div class="container3"> 
	<nav>	
		
		<ul class="mcd-menu">
			<li class="sList">
				
				<a href="<%=request.getContextPath() %>/user_notice_list.do">
					<i class="fa fa-edit" ></i>
					공지사항
				</a>
			</li>
			<li  class="sList">
				<a href="<%=request.getContextPath() %>/user_oneQuestion.do?id=${member_id}">
					<i class="fa fa-comments-o"></i>
					회원 1:1 문의 
				</a>
			</li>
			<li  class="sList">
				
				<a href="<%=request.getContextPath() %>/user_question_list.do">
					<i class="fa fa-edit"></i>
					회원 자주 찾는 질문
				</a>
			</li>
		</ul>
	</nav>
	</div>
	
</body>
</html>