<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">


</script>
</head>
<body>
	<c:set value="${content }" var="c" />
	<c:set value="${Page }" var="page" />
	<c:set value="${fileList }" var="file"/>
	<div>
		<table>
			<tr>
				<th>번호</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_num }"> </td>
			</tr>
			
			<tr>
				<th>답변상태</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_check}" ></td>
			</tr>
			
			<tr>
				<th>카테고리</th>
				<td><input name="service_num" readonly="readonly" value="${c.c_name }"></td>
			</tr>
			
			<tr>
				<th>아이디</th>
				<td><input name="service_num" readonly="readonly" value="${c.member_id }"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_title }"></td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_title }"></td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td><textarea rows="15" cols="40" name="service_cont" readonly="readonly">${c.service_cont }</textarea></td>
			</tr>
			
			<tr>
				<th>첨부파일</th>
				<td>
					<c:if test="${empty file }">
						첨부파일이 없습니다.
					</c:if>
				
					<c:if test="${!empty file }">
						<c:forEach items="${file }" var="f">
							<input type="hidden" name="paths" value="${f.file_path }">
							<a href="<%=request.getContextPath() %>/fileDownload.do?no=${f.file_no }">
								${f.file_name }
							</a>
							<br/>
						</c:forEach>
					</c:if>
				</td>
			</tr>
			
			<tr>
				<th>작성일자</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_date }"></td>
			</tr>
			
			<tr>
				<th>조회수</th>
				<td><input name="service_num" readonly="readonly" value="${c.service_view }"></td>
			</tr>
			
		</table>
	</div>
	<div>
		<input type="button" value="답변하기" 
			onclick="location.href='admin_oneQuestion_reply.do?num=${c.service_num}&page=${Page }'">
		<input type="button" value="목록으로"
			onclick="history.back()">
	</div>	
		
</body>
</html>