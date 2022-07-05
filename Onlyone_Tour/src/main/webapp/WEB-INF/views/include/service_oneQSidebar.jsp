<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div>
		<ul>
			<li><a href="<%=request.getContextPath() %>/user_notice_list.do">공지사항</a></li>
			<li><a href="<%=request.getContextPath() %>/user_oneQuestion.do?id=${member_id}">회원 1:1 문의 </a></li>
			<li><a href="<%=request.getContextPath() %>/user_question_list.do">회원 자주 찾는 질문</a></li>
		</ul>

	</div>
	
</body>
</html>