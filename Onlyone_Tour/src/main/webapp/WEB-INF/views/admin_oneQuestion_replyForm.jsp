<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
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
<style type="text/css">
.container{
	margin-top : 450px;
	
	position: relative;
	left: 30%;
	top: 50%;
	transform:translate(-50%,-50%);
	
} 

.noticeText{
	position: relative;
	float:left;
	
}

input[type=text]{
	
	border-top:0px;
	border-left: 0px;
	border-right: 0px;
	width: 750px;
	
}

.selectBox{
	width: 150px; 
	padding: .3em .3em; 
	border: 1px solid #999;
	font-family: inherit;  
	background: url('./resources/image_service/source/selectArrow.png') no-repeat 95% 50%; 
	border-radius: 2px; 
	-webkit-appearance: none; 
	-moz-appearance: none;
	appearance: none;
}


	

</style>

</head>
<body>
	<%@include file="admin/adminInclude/admin_top.jsp" %>

	<%@include file="admin/adminInclude/admin_aside.jsp" %>

	<c:set value="${content }" var="c" />
	<c:set value="${Page }" var="page" />
	<div class="container">
	
		<h4 class="noticeText">1:1 문의 관리</h4>
		
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
			
			<table class="table" style="table-layout: fixed">
				<tr>
					<th width="15%">작성자</th>
					<td><input name="service_name" value="${member_name }" readonly="readonly"></td>
				</tr>
				
				<tr>
					<th width="15%">제목</th>
					<td><input name="service_title"></td>
				</tr>
				
				<tr>
					<th width="15%">내용</th>
					<td><textarea rows="15" cols="100" name="service_cont"></textarea> </td>
				</tr>
				
				<tr>
					<th width="15%">첨부파일</th>
					<td class="fileAddT">
						<input type="file" name="upfile" > 
						<input type="button" name="fileAdd" value="추가" onclick="addFile()"><br>
					</td>
				</tr>
			</table>
			<a class="btn float-right ">
				<input type="button" onclick="qForm_check()" value="작성완료" class="btn btn-success btn-block">
			</a>
			<a class="btn float-right ">
			<input type="button" value="뒤로가기" class="btn btn-outline-success btn-block"
				onclick="history.back()">
			</a>
		</form>
	</div>
</body>
</html>