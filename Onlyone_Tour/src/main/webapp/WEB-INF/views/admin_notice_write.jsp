<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">

function noticeSubmit(){
	
	if($("input[name=n_title]").val().trim() === ""){
		
		alert("제목을 입력해주세요");
		$("input[name=n_title]").focus();
		return false;
		
	}
	
	if($("input[name=n_name]").val().trim() === ""){
		
		alert("작성자를 입력해주세요");
		$("input[name=n_title]").focus();
		return false;
		
	}
	
	if($("textarea[name=n_cont]").val().trim().length == 0){
		
		alert("내용을 입력하세요");
		$("textarea[name=n_cont]").focus();
		return false;
	}
	
	document.writeForm.submit();
}


</script>


<style>
.container{
	margin-top : 525px;
	
	
	position: relative;
	left: 30%;
	top: 50%;
	transform:translate(-50%,-50%);
	
	padding-left: 0;
	
}

.noticeText{
	position: relative;
	float:left;
	
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


<body>
	<%@include file="admin/adminInclude/admin_top.jsp" %>

	<%@include file="admin/adminInclude/admin_aside.jsp" %>
	
	<div class="container" >
	<div class="allT">
	
		<h4 class="noticeText"> 공지사항</h4>
		
		<form method="post"
			action="<%=request.getContextPath() %>/admin_notice_writeOk.do" name="writeForm">
			
			<table class="table" style="table-layout: fixed">
				<tr>
					<th class="col-md-2">공개여부</th>
					<td>
						<select name="n_oc" class="selectBox">
							<option value="공개">공개</option>
							<option value="비공개">비공개</option>
						</select>
					</td>
				</tr>
				
				<tr>
					<th>제목</th>
					<td><input name="n_title" ></td>	
				</tr>
				
				<tr>
					<th>작성자</th>
					<td><input name="n_name" ></td>	
				</tr>
				
				<tr>
					<th>내용</th>
					<td><textarea rows="20" cols="100" name="n_cont"></textarea></td>
				</tr>
			
				<tr>
					<td colspan="2">
						<a class="btn float-right ">
						<input type="button" value="작성완료"  class="btn btn-success btn-block"
							onclick="noticeSubmit()">
						</a>
						
						<a class="btn float-right ">
						<input type="button" value="뒤로가기"  class="btn btn-outline-success btn-block"
							onclick="history.back()">
						</a>
					</td>
				</tr>
			</table>
		
		</form>
		</div>
	</div>
	
</body>
</html>