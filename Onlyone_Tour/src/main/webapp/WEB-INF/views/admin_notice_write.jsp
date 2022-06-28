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
		<form method="post"
			action="<%=request.getContextPath() %>/admin_notice_writeOk.do">
			
			<table>
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
					<td><input name="n_title"></td>	
				</tr>
				
				<tr>
					<th>작성자</th>
					<td><input name="n_name"></td>	
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea rows="20" cols="100" name="n_cont"></textarea></td>
				</tr>
			
				<tr>
					<td colspan="2">
						<input type="submit" value="작성완료">
						<input type="button" value="뒤로가기" 
							onclick="history.back()">
					</td>
				</tr>
			</table>
		
		</form>
	</div>
	
</body>
</html>