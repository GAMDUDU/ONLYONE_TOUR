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
			action="<%=request.getContextPath() %>/admin_question_wirteOk.do">
			
			<table>
				<tr>
					<th>질문</th>
					<td><input name="q_title"></td>	
				</tr>
				
				<tr>
					<th>답변</th>
					<td><textarea rows="20" cols="100" name="q_cont"></textarea></td>
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