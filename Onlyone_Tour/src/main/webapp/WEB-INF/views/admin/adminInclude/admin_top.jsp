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
		display: flex;
		justify-content: center;
		margin: 20px;
		padding-bottom: 12px;
		background: #9D968F;
		border-radius: 3px;
		border: 1px solid black;
	}
	
	.main_go{
		display:flex;
		position: relative;
		left: 500px;
		list-style: none;
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
			<h2 class="main_top_text">온리원  투어</h2>
			
			<ul class="main_go">
				<%if(session.getAttribute("member_id") != null){ %>
				<li class="admin_member"><i class="fa-solid fa-user"></i>${member_name}님 어서오세요</li>	
				<%} %>
				<li><a href="<%=request.getContextPath()%>/admin.do">메인 화면</a></li>
				<li><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
			</ul>
		</div>
	</div>
	
</body>
</html>