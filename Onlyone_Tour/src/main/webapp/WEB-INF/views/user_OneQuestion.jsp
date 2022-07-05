<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html>
<head>
<%-- <c:set var="path" value="${pageContext.request.contextPath}"/>
 --%>

<meta charset="UTF-8">
<title>Insert title here</title>

<%-- <link rel="stylesheet" type="text/css" href="${path }/resources/css/userOneQuestion.css">
 --%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

$(document).ready(function(e){
	
	
	
	const tabMenu = document.querySelectorAll('.tab-menu li');
	const tabContent = document.querySelectorAll('#tab-content > div');
	const highlight = document.querySelector('.highlight');
	
	tabMenu.forEach(function(item, idx){
		item.addEventListener('click', function(e){
			//prevent(기능을 막는다) + Default(기본) = preventDefault(기존의 링크 이벤트를 막음)
			e.preventDefault(); 
			showContent(idx);
			moveHighLight(idx);
		});
	
	});
	

 	function showContent(num){
			
		tabContent.forEach(function(item){
			item.style.display = 'none';
		});
		tabContent[num].style.display = 'block';
		
	}
	
 	function moveHighLight(num){
		
		const newLeft = tabMenu[num].offsetLeft;
		const newWidth = tabMenu[num].offsetWidth;
		console.log(newLeft);
		highlight.style.left = newLeft + 'px';
		highlight.style.width = newWidth + 'px';
	} 
 	

 	
 	
})

//유효성검사
function q_check(){
	
	
	if($("input[name=service_title]").val().trim() === ""){
		alert("제목을 입력하세요");
		$("input[name=service_title]").focus();
		return false;
	}else if($("textarea[name=service_cont]").val().trim().length == 0){
		alert("내용을 입력하세요");
		$("textarea[name=service_cont]").focus();
		return false;
	}
	
/* 	var count = $("input[name=upfile]").length
	
	for(var i=0; i<count; i++){
		var temp = $("input[name=upfile]");
		
		if(temp[i].value == ""){
			alert("파일을 추가해주세요");
			return false;
		
		}
	}// 2022년 6월 25일 21시 30분 ~ 6월 26일 1시 15분 : 3시간 20분짜리 for문   */
	
	document.question_form.submit();
	
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

function userQList(page, id){
	
	console.log(page);
	
	$.ajax({
		url : "user_oneQuestionJson.do", //c:url = getContextPath()
		datatype : "json",			//key, value 로 넘기는게 json 방식
		data : {
			page : page,
			member_id : id
		},
		success : function(data){
			
			
			
		},
		error : function(){
			alert('통신 오류 발생');
		}
		
	});	
	
	
}

</script>

<style>
.tab-wrapper {
	width : 900px;
	margin : auto;
}	

.tab-menu {
	padding-left : 0;
	position: relative;
	z-index: 1; /* 레이어의 우선순위 */
}	

.tab-menu li {
	float : left;
	list-style : none;
	margin-right: 10px;
}

.tab-menu:after {
	content:'';
	display: block;
	clear: both;
}
	
.tab-menu li a{
	color:#999;
	text-transform: uppercase;
	font-weight: bold;
	line-height: 27px;
	text-decoration: none;
	padding: 0 20px;
	display: block;
}	

#tab-content > div {
	display: none;	
}

#tab-content > div:first-child{
	display : block;
}

.tab-menu li a.active{
	coloer: #fff;
}

.navi {
	position: relative;
}

.highlight {
	
	position : absolute;
	width: 98px;
	top: 0;
	left: 0;
	bottom: 0;
	background:  #000;
	/* 네모칸 이동 */
	transition : 0.4s cubic-bezier(0.65, 0, 0.35, 1);
}

#replyImg{
		width: 12px;
		height: 12px;
	}
	

</style>


</head>
<body>

	<%@include file="./include/service_oneQSidebar.jsp" %>
	
	<div class="tab-wrapper">
		<div class="navi">
			<ul class="tab-menu">
				<li><a href="#oneAndOne">1:1문의</a></li>
				<li><a href="#oneAndOneList">문의내역</a></li>
			</ul>
			<span class="highlight"></span> 
		</div>
		
		<div id="tab-content">
			<div id="oneAndOne">
				
				<form method="post" name="question_form"
					action="user_oneQuestion_Write.do"
						enctype="multipart/form-data">
					
					<input type="hidden" value="${member_id}" name="member_id">
					<c:set var="clist" value="${categoryList}" />
					
					<table>
						<tr>
							<th>문의유형</th>
							<td>
								<select name="service_code">
									<c:if test="${empty clist}">
										<option>유형없음</option>
									</c:if>
									
									<c:if test="${!empty clist}">
										<c:forEach items="${clist }" var="cdto">
											<option value="${cdto.c_code}">
												${cdto.c_name}
											</option>
										</c:forEach>
									</c:if>
								</select>
							</td>
						</tr>
						
						<tr>
							<th>작성자</th>
							<td><input name="service_name" value="${member_name}" readonly="readonly"></td>
						</tr>
						
						<tr>
							<th>제목</th>
							<td>
								<input name="service_title">
							</td>
						</tr>
						
						<tr>
							<th>내용</th>
							<td>
								<textarea rows="25" cols="40" name="service_cont" ></textarea>
							</td>
						</tr>
						
						<tr>
							<th>첨부파일</th>
							<td class="fileAddT">
							<input type="file" name="upfile"> 
							<input type="button" name="fileAdd" value="추가" onclick="addFile()"><br>
									
							<!-- 한번에 여러개 선택  -->
							<!-- <input type="file" name="upfile" multiple><br> -->
							<!-- <label class="btn bc1" for="imgUpload">사진 선택 (최대 4장)</label> -->
								
							</td>
						</tr>
						
					</table>
					
					<input type="button" onclick="q_check()" value="작성완료">
				</form>
				
			</div>
			
			<div id="oneAndOneList">
				
				<c:set value="${QList }" var="list" />
				<table>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>답변상태</th>
						<th>조회수</th>
						<th>작성일자</th>
					</tr>
					<c:if test="${!empty list }"> 
						<c:forEach items="${list }" var="l">
							<tr>
								<td>
									${l.service_num }
								</td>
								<td>
									<c:if test="${l.service_indent != 0 }">
										<img id="replyImg" src="./resources/image_service/source/829.png">
									</c:if>
									${l.service_title }
								</td>
								<td>
									${l.service_name }
								</td>
								<td>
									${l.service_check }
								</td>
								<td>
									${l.service_view }
								</td>
								<td>
									${l.service_date }
								</td>
							</tr>
						
						</c:forEach>
					</c:if>
					</table>
				<div>
					<c:set var="paging" value="${Paging }" />
		
					<%-- 페이징 처리 부분 --%>
				    <c:if test="${paging.getPage() > paging.getBlock() }">
				       <a href="userQList(1, ${member_id})">[처음으로]</a>
				       <a href="userQList(${paging.getStartBlock() - 1 }, ${member_id})">◀</a>
				    </c:if>
				   
				    <c:forEach begin="${paging.getStartBlock() }"
				          				end="${paging.getEndBlock() }" var="i">
				       <c:if test="${i == paging.getPage() }">
				          <b> <a href="userQList(i, ${member_id})">[${i }]</a> </b>
				       </c:if>
				   
				  	   	   <c:if test="${i != paging.getPage() }">
				          <a href="userQList(i, ${member_id})">[${i }]</a>
				       </c:if>
				    </c:forEach>
				
				    <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
				       <a href="userQList(${paging.getEndBlock() + 1 }, ${member_id})">▶</a>
				       <a href="userQList(${paging.getAllPage()}, ${member_id})">[마지막으로]</a>
				    </c:if>
				</div>
			</div>
			
			
		</div>
		
		
	</div>
	
	
</body>
</html>