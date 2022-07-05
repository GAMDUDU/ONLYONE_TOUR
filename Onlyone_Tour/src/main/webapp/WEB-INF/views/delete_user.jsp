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
	<jsp:include page="include/top.jsp" />
	
	<div id="container">
		<c:set var="mem" value="${mem}" />
			<div class="form_info">
				<form method="post" 
				action="<%=request.getContextPath() %>/delete_user_ok.do" onsubmit="return pwdCheck();">
					
				<input type="hidden" name="dbpwd" value="${mem.member_pwd}" class="old_pwd">	
				
					<div class="text_big_fix">
						<strong>회원 탈퇴</strong>
					</div>
					
					<div class="text_1">
						<div class="text_1s_selected">
							<strong>
								<em></em>
								그동안 보내주신 성원에 감사드립니다.
							</strong>
							<p>-개인정보 취급방침에 의거하여 모든 개인정보가 삭제됩니다.</p>
							<p>-단, 고객게시판, 후기 등의 게시물은 후에도 유지됩니다.</p>
							<p>-회원탈퇴 이후 게시물 삭제는 고객센터로 별도 문의가 필요합니다.</p>
						</div>
						
						<div class="form_table">
							<table class="form_table_main">
								<tr>
									<th>아이디</th>
									<td>
										<input name="user_id" value="${member_id}" readonly>
									</td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td>
										<input type="password" name="user_pwd" class="input_pwd">
									</td>
								</tr>
							</table>
							<div class="form_submit">
								<input type="submit" value="회원 탈퇴">
								<input type="reset" value="취소">
							</div>
						</div>
					</div>
				</form>	
			</div>
		</div>
</body>
</html>