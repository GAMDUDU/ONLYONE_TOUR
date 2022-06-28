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
	
	<div id="container">
			<div class="info">
				<div class="lnb">
					<div class="info">
						<dl>
							<dt>마이페이지</dt>
							<dd>
								<ul>
									<li>
										<a>예약내역</a>
									</li>
									<li>
										<a>찜</a>
									</li>
									<li>
										<a>1:1 게시판 문의내역</a>
									</li>
									<li>
										<a>개인정보</a>
									</li>
								</ul>
							</dd>
						</dl>
					</div>
			
		<c:set var="mem" value="${mem }" />
			<form method="post" 
				action="<%=request.getContextPath() %>/update_info_ok.do">
				
			<input type="hidden" name="dbpwd" value="${mem.member_pwd }">	
			
				<div class="text big fix">
					<strong>개인정보</strong>
				</div>
				<div class="text_1">
					<div class="text_1s selected">
						<strong>
							<em></em>
							${mem.member_name }님의 정보를 안전하게 보호하기 위하여<br>
							비밀번호를 다시 한번 확인합니다.
						</strong>
					</div>
					<div>
						<table>
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
						<div>
							<input type="submit" value="확인">
							<input type="reset" value="취소">
						</div>
					</div>
				</div>
			</form>	
				</div>
			</div>
	</div>
	
</body>
</html>