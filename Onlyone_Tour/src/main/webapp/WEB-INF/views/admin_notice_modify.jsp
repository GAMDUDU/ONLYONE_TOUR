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
		<form method="post" 
			action="<%=request.getContextPath() %>/admin_notice_modifyOk.do">
			
			<input type="hidden" name="n_num" value="${dto.n_num }">
			<input type="hidden" name="page" value="${Page }">
			
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
					<th>공개여부</th>
					<td>
						<select name="n_oc">
							<option value="공개">공개</option>
							<option value="비공개">비공개</option>
						</select>
					</td>
				</tr>
				
				
				<tr>
					<th>제목</th>
					<td><input name="n_title" value="${dto.n_title }" ></td>	
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea rows="20" cols="100" name="n_cont" >${dto.n_cont }</textarea></td>
				</tr>
				
				<tr>
					<th>작성일</th>
					<td>${dto.n_date }</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="submit" value="작성완료">
						<input type="button" value="목록으로" 
							onclick="location.href='notice_list.do?page=${Page }'">
					</td>
				</tr>
			</table>
		</form>
	</div>
	
</body>
</html>