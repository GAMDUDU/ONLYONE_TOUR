<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
<style type="text/css">

	#top_bar{
		margin: 20px;
		padding: 10px;
		border-radius: 3px;
		border: 2px solid gray;
	}
	
	.top_logo{
		position:relative;
		width: 230px;
		height: 160px;
		left: 48%;
	}
	
	.main_go{
		display:flex;
		justify-content:flex-end;
		list-style: none;
		margin-right: 60px;
	}
	
	.main_go li{
		margin-left: 20px;
	}
	
	.main_go a{
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	
	.admin_member{
		color: black;
		font-weight: bold;
	}
	
	.main_top_text{
		position: relative;
		left: 50%;
	}
	
</style>
</head>
<body>
	<div id="top_bar">
		<div class="top_nav_bar">
			
			<img class="top_logo" alt="온리원투어로고" src="../resources/image/Free_Sample_By_Wix.jpg">
			
			<ul class="main_go">
				<%if(session.getAttribute("member_id") != null){ %>
				<li class="admin_member"><i class="fa-solid fa-user"></i>${member_name}님 어서오세요</li>	
				<%} %>
				<li><a href="<%=request.getContextPath()%>/admin.do"><i class="fa-solid fa-house"></i>메인 화면</a></li>
				<li><a href="<%=request.getContextPath()%>/logout.do"><i class="fa-solid fa-right-from-bracket"></i>로그아웃</a></li>
			</ul>
		</div>
	</div>
	
</body>
</html>