<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>


<html>
<head>
	<c:set var="path" value="${pageContext.request.contextPath}"/>
	
	<title>온리원투어</title>
	<link rel="stylesheet" type="text/css" 
	href="${path}/resources/css/style.css">
</head>
<body>
	<div class="container">
		<h1>안녕하세요 온리원 투어 입니다.</h1>
		<h2>어서오세요 반갑습니다.</h2>
		<button class="btn">버튼</button>
	</div>


<script type="text/javascript" src="${path}/resources/js/script.js"></script>
</body>
</html>
