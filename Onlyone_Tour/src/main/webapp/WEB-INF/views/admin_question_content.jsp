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
	
	<div>
		<c:set var="dto" value="${Cont }" />
		<table>
			<tr>
				<th>공개여부</th>
				<td>${dto.q_oc }</td>
			</tr>
			<tr>
				<th>질문</th>
				<td><input name="q_title" value="${dto.q_title }" readonly="readonly" ></td>	
			</tr>
			
			<tr>
				<th>답변</th>
				<td><textarea rows="20" cols="100" name="q_cont" readonly="readonly">${dto.q_cont }</textarea></td>
			</tr>
		
			<tr>
				<td colspan="2">
					<input type="button" value="수정하기" 
						onclick="location.href='admin_qeustion_modify.do?num=${dto.q_num}&page=${Page }'">
					<input type="button" value="목록으로" 
						onclick="location.href='question_list.do?page=${Page }'">
				</td>
			</tr>
		</table>
		
	</div>
	
	
</body>
</html>