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
//유효성검사

function qForm_check(){
	
	
	if($("input[name=service_title]").val().trim() === ""){
		alert("제목을 입력하세요");
		$("input[name=service_title]").focus();
		return false;
	}else if($("textarea[name=service_cont]").val().trim().length == 0){
		alert("내용을 입력하세요");
		$("textarea[name=service_cont]").focus();
		return false;
	}
	
	document.admin_QuestionForm.submit();
	
}  

var maxfile = 1; //첨부파일 갯수 초기설정

function addFile(){
	
	if(maxfile >= 3){
		alert("첨부파일은 최대 3개까지 업로드 할 수 있습니다.");
		
	}else{
		$('.fileAddT').append('<input type="file" name="upfile"> <input type="button" onclick="addDel(this)" value="삭제"><br>'); 
		maxfile++;
		
	}
	
	
	
}

function addDel(a){ 
	
    $(a).prev().remove(); //textarea 삭제
    $(a).next().remove(); //<br> 삭제
    $(a).remove(); 		  //button 삭제
    maxfile--; 
    
}	

</script>
</head>
<body>
	<c:set value="${content }" var="c" />
	<c:set value="${Page }" var="page" />
	<div>
		<form method="post"  name="admin_QuestionForm"
			enctype="multipart/form-data"
			action="admin_oneQuestion_replyOk.do">
			
			<input type="hidden" name="service_num" value="${c.service_num }">
			<input type="hidden" name="c_code" value="${c.c_code }">
			<input type="hidden" name="c_name" value="${c.c_name }">
			<input type="hidden" name="service_group" value="${c.service_group }">
			<input type="hidden" name="service_step" value="${c.service_step }">
			<input type="hidden" name="service_indent" value="${c.service_indent }">
			<input type="hidden" name="page" value="${page }">
			<input type="hidden" name="member_id" value="${member_id }">
			
			<table>
				<tr>
					<th>작성자</th>
					<td><input name="service_name" value="${member_name }" readonly="readonly"></td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td><input name="service_title"></td>
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea rows="30" cols="40" name="service_cont"></textarea> </td>
				</tr>
				
				<tr>
					<th>첨부파일</th>
					<td class="fileAddT">
						<input type="file" name="upfile"> 
						<input type="button" name="fileAdd" value="추가" onclick="addFile()"><br>
					</td>
				</tr>
			</table>
			
			<input type="button" onclick="qForm_check()" value="작성완료">
			<input type="button" value="뒤로가기"
				onclick="history.back()">
			
		</form>
	</div>
</body>
</html>