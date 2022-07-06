<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/resources/css/updateInfo.css">
</head>
<body>
	
	<div id="container">
		<c:set var="mem" value="${mem}" />
			<div class="form_info">
				<form method="post" 
					action="<%=request.getContextPath() %>/update_info_ok.do">
					
				<input type="hidden" name="dbpwd" value="${mem.member_pwd }">	
				
					<div class="text_big_fix">
						<strong>개인정보</strong>
					</div>
					<div class="text_1">
						<div class="text_1s_selected">
							<strong>
								<em></em>
								${mem.member_name }님의 정보를 안전하게 보호하기 위하여<br>
								비밀번호를 다시 한번 확인합니다.
							</strong>
						</div>
						<div class="form_table">
							<table class="form_table_main">
								<tr>
									<th>아이디</th>
									<td>
										<input name="user_id" value="${mem.member_id }" readonly>
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>
										<input type="password" name="user_pwd">
									</td>
								</tr>
							</table>
							<div class="form_submit">
								<input type="submit" value="확인">
								<input type="button" value="취소" onclick="location.href='/'">
							</div>
						</div>
					</div>
				</form>	
			</div>
		</div>
</body>
</html>