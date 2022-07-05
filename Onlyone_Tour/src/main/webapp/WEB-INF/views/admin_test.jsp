<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

	<!-- 관리자  -->
    <a href="<%=request.getContextPath()%>/question_list.do">[자주 찾는 질문 관리]</a>
    <a href="<%=request.getContextPath()%>/oneQuestion_list.do">[1:1 문의 관리]</a>
    <a href="<%=request.getContextPath()%>/notice_list.do">[공지사항]</a>
   
    <!-- 회원 -->
    <a href="<%=request.getContextPath()%>/user_question_list.do">[회원 자주 찾는 질문]</a>
    <a href="<%=request.getContextPath()%>/user_oneQuestion.do?id=${member_id}">[회원 1:1 문의 ]</a>
    <a href="<%=request.getContextPath()%>/user_notice_list.do">[회원 공지사항]</a>
	
	
	
	
</body>
</html>