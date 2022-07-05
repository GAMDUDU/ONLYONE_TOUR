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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(e){
	

/* 	var link = document.location.href; //현재 url
	var tab = link.split('/').pop(); //배열의 맨 마지막 요소를 삭제하고 삭제된 해당 값을 반환함 */
	/*  $('a[herf$='+tab+']').trigger("click");*/
	
	
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
			/* window.location.replace(ui.tab.hash); */
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
  	
 	
/* 	$(".tab-wrapper").tabs({
		select:function(event, ui){
			
			window.location.replace(ui.tab.hash);
		}
		
	}); */
 	
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

function userQList(npage,id){
	
	
	$.ajax({
			type:"POST",
			url: "<%=request.getContextPath()%>/user_oneQuestionJson.do",
			data : {"memberId" : id,
				"page" : npage},
			datatype: "json",
			
			success: function(data){
			 	 
				 console.log(data);
			 	 
				 var table='';
				 
				 var itgo = new Array;
				 itgo = JSON.parse(data);  //수연스승님하사
				 
				 console.log(itgo.List[0]);
				 console.log(itgo.Pdto);
				 	
			 	 table += '<table><tr>'; 
				 table += '<th>번호</th>';	
				 table += '<th>제목</th>';	
				 table += '<th>작성자</th>';	
				 table += '<th>답변상태</th>';	
				 table += '<th>조회수</th>';
				 table += '<th>작성일자</th></tr>';
				 
				 
				
				
				for(var i=0; i<itgo.List.length; i++){
					 
					 table += '<tr>';
					 table += '<td  width="10%">'+ itgo.List[i].service_num +'</td>';
					 
					 table += '<td  width="40%">';
					 table += '<a href="user_oneQuestion_content.do?num=' + itgo.List[i].service_num + '&page=' + itgo.Pdto.page + '">';
					 
					 if(itgo.List[i].service_indent != 0){
						 
						 table += '<img id="replyImg" src="./resources/image_service/source/829.png">';
						 
					 }
					 
					 table += itgo.List[i].service_title + '</a></td>';
					 
					 
					 table += '<td  width="10%">'+ itgo.List[i].service_name +'</td>';
					 table += '<td  width="10%">'+ itgo.List[i].service_check +'</td>';
					 table += '<td  width="10%">'+ itgo.List[i].service_view +'</td>';
					 table += '<td  width="20%">'+ itgo.List[i].service_date +'</td>';
					 table += '</tr>';
					 
				
					 $("#listTable").html(table);
				
				}
				
				
				var pDiv='';
				
				pDiv += '<div id="pageDiv" class="text-center">';
				pDiv += '<ul class="pagination">';
				
				if(itgo.Pdto.page > itgo.Pdto.block ){
					
				    pDiv += '<li class="page-item"><a class="page-link" href="javascript:userQList(1,'+"'"+ itgo.Pdto.member_id +"'"+')">처음으로</a></li>';
				    pDiv += '<li class="page-item"><a class="page-link" href="javascript:userQList('+ (itgo.Pdto.startBlock + 1) + ','+"'"+ itgo.Pdto.member_id +"'"+')">◀</a></li>';
				
				}
			    
			    for(var i=itgo.Pdto.startBlock; i<=itgo.Pdto.endBlock; i++){
			    	
			    	if(i==itgo.Pdto.page){
			    		pDiv += '<li class="page-item"><a class="page-link" href="javascript:userQList('+i+','+"'"+ itgo.Pdto.member_id +"'"+')">'+i+'</a></li>';
					}
			    	if(i!=itgo.Pdto.page){
					    pDiv += '<li class="page-item"><a class="page-link" href="javascript:userQList('+i+','+"'"+ itgo.Pdto.member_id +"'"+')">'+i+'</a></li>';
			    	}
			    	
			    }
			  	
			    if(itgo.Pdto.block < itgo.Pdto.allPage){
			    	 pDiv += '<li class="page-item"><a class="page-link" href="javascript:userQList(' + (itgo.Pdto.endBlock + 1) + ','+"'"+ itgo.Pdto.member_id +"'"+')">▶</a></li>';
					 pDiv += '<li class="page-item"><a class="page-link" href="javascript:userQList(' + itgo.Pdto.allPage + ','+"'"+ itgo.Pdto.member_id +"'"+')">[마지막으로]</a></li>';
			    }
				
			    $("#pageDiv").html(pDiv);
				
				pDiv += '</ul>'
				pDiv += '</div>'
				
				
			},
			error: function(data){
				alert("통신 오류입니다.")
			},
			async: false	
		});
	  	
 		
	
}


</script>

<style>
.tab-wrapper {
	margin-top : 100px;
	margin-left : 300px;
	position: relative;
	border : 1px;
	padding: 10px;
}	

.navi{
	width : 100%;
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
	color:#000;
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
	background:  #9046cf;
	/* 네모칸 이동 */
	transition : 0.4s cubic-bezier(0.65, 0, 0.35, 1);
}

#replyImg{
		width: 12px;
		height: 12px;
}
	


.foooooooter{
	
	position : relative;
	margin-top: 10%;
	bottom : 0;
}	

.text-center{
	width: 30%; 
	float:none; 
	margin:0 auto
}

input{
	
	
	border-bottom : 2px;
	border-left : 0;
	border-top : 0;
	border-right : 0;
	height: 34px;
	
}
	
.searchBox{
	width: 250px; 
	padding: .3em .3em; 
	border: 1px solid #999;
	font-family: inherit;  
	border-radius: 2px; 
	-webkit-appearance: none; 
	-moz-appearance: none;
	appearance: none;
}

.container2{
	position: relative;
	width : 100%;
	padding: 10px;
	
} 

a{
	text-decoration: none;
	color : black; 
	font-weight: bold;
}	

a:hover{
	text-decoration: none;
	color : #9046cf; 
}

</style>


</head>
<body>
	<jsp:include page="include/top.jsp" />
	<%@include file="./include/service_oneQSidebar.jsp" %>
	
	<div class="tab-wrapper" >
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
					
						
					<input type="hidden" value="${member_id }" name="member_id">
									
					<c:set var="clist" value="${categoryList}" />
					
					<table  class="table">
						<tr>
							<th width="15%">문의유형</th>
							<td>
								<select name="service_code" class="selectBox">
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
							<th width="10%">작성자</th>
							<td><input name="service_name" value="${member_name}" readonly="readonly"></td>
						</tr>
						
						<tr>
							<th width="10%">제목</th>
							<td>
								<input name="service_title" placeholder="제목을 입력해주세요" style="width : 500px;">
							</td>
						</tr>
						
						<tr>
							<th>내용</th>
							<td>
								<textarea rows="15" cols="80" name="service_cont" ></textarea>
							</td>
						</tr>
						
						<tr>
							<th width="10%">첨부파일</th>
							<td class="fileAddT">
							<input type="file" name="upfile"> 
							<input type="button" name="fileAdd" value="추가" onclick="addFile()"><br>
									
							<!-- 한번에 여러개 선택  -->
							<!-- <input type="file" name="upfile" multiple><br> -->
							<!-- <label class="btn bc1" for="imgUpload">사진 선택 (최대 4장)</label> -->
								
							</td>
						</tr>
						
					</table>
					
					<a class="btn float-right ">
						<input type="button" onclick="q_check()" value="작성완료" class="btn btn-success btn-block">
					</a>	
						
				</form>
				
			</div>
			
			<div id="oneAndOneList" class="container2">
				
				<c:set var="paging" value="${Paging }" />
				<c:set value="${QList }" var="list" />
				<table id="listTable" class="table table2">
					<tr>
						<th width="10%">번호</th>
						<th width="40%">제목</th>
						<th width="10%">작성자</th>
						<th width="15%">답변상태</th>
						<th width="10%">조회수</th>
						<th width="20%">작성일자</th>
					</tr>
					<c:if test="${!empty list }"> 
						<c:forEach items="${list }" var="l">
							<tr>
								<td width="10%">
									${l.service_num }
								</td>
								<td width="40%">
									<a href="user_oneQuestion_content.do?num=${l.service_num }&page=${paging.page }">
									<c:if test="${l.service_indent != 0 }">
										<img id="replyImg" src="./resources/image_service/source/829.png">
									</c:if>
									${l.service_title }
									</a>
								</td>
								<td width="10%"> 
									${l.service_name }
								</td>
								<td width="15%">
									${l.service_check }
								</td>
								<td width="10%">
									${l.service_view }
								</td>
								<td width="25%">
									${l.service_date.substring(0, 10) }
								</td>
							</tr>
						
						</c:forEach>
					</c:if>
					</table>
				<div id="pageDiv" class="text-center">
					<c:set var="paging" value="${Paging }" />
		
					<%-- 페이징 처리 부분 --%>
					<ul class="pagination">
					    <c:if test="${paging.getPage() > paging.getBlock() }">
					       <li class="page-item"><a class="page-link" href="javascript:userQList(1,'${member_id}')">[처음으로]</a>
					       <li class="page-item"><a class="page-link" href="javascript:userQList(${paging.getStartBlock() - 1 },'${member_id}')">◀</a></li>
					    </c:if>
					   
					    <c:forEach begin="${paging.getStartBlock() }"
					          				end="${paging.getEndBlock() }" var="i">
					       <c:if test="${i == paging.getPage() }">
					          <li class="page-item"><a class="page-link" href="javascript:userQList(${i},'${member_id}')">${i }</a></li>
					       </c:if>
					   
					  	   	   <c:if test="${i != paging.getPage() }">
					          <li class="page-item"><a class="page-link" href="javascript:userQList(${i},'${member_id}')">${i }</a></li>
					       </c:if>
					    </c:forEach>
					
					    <c:if test="${paging.getEndBlock() < paging.getAllPage() }">
					       <li class="page-item"><a class="page-link" href="javascript:userQList(${paging.getEndBlock() + 1 },'${member_id}')">▶</a></li>
					       <li class="page-item"><a class="page-link" href="javascript:userQList(${paging.getAllPage()},'${member_id}')">마지막으로</a></li>
					    </c:if>
					</ul> 
				</div>
				
			</div>
			
			
		</div>
		
		
	</div>
	<div class="foooooooter">
		<jsp:include page="include/footer.jsp"  />
	</div>
</body>
</html>