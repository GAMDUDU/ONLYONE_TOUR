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
				<th>번호</th>
				<td><input name="n_num" value="${dto.n_num }" readonly="readonly" ></td>
			</tr>
			
			<tr>
				<th>작성자</th>
				<td><input name="n_name" value="${dto.n_name }" readonly="readonly" ></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input name="n_title" value="${dto.n_title }" readonly="readonly" ></td>	
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="20" cols="100" name="n_cont" readonly="readonly">${dto.n_cont }</textarea></td>
			</tr>
			
			<tr>
				<th>조회수</th>
				<td>${dto.n_view }</td>
			</tr>
			
			<tr>
				<th>작성일</th>
				<td>${dto.n_date }</td>
			</tr>
			
			<tr>
				<td>
					<input type="button" value="목록으로" 
						onclick="location.href='user_notice_list.do?page=${Page }'">
				</td>
			</tr>	
		</table>
		
	</div>
	
</body>
</html>