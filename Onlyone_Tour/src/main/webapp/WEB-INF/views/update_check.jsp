<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="include/top.jsp" />
	
	<c:set var="mem" value="${check }"/>
	<div>
		<div class="title"><h3>개인 정보</h3></div>
			
			<table class="table" border="1" cellspacing="0">
				<tr>
					<th>아이디</th>
					<td>
						${mem.member_id }
					</td>
				</tr>
				
				<tr>
					<th>이  름</th>
					<td>
						${mem.member_name }
					</td>
				</tr>
				
				<tr>
					<th>생년월일/성별</th>
					<td>
						${mem.member_birth }/
						${mem.member_gender }
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>
						${mem.member_email }
					</td>
				</tr>
				
				<tr>
			     <th>주소</th>
				 <td> 
				 	${mem.member_addr }
				 	${mem.member_detailaddr }
				 </td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" onclick="history.go(-2)"
						  value="뒤로가기">
					</td>
				</tr>
			</table>
	</div>
</body>
</html>