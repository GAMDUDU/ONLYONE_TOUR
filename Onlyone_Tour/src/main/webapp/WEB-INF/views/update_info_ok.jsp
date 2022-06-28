<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="up" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" type="text/css" href="${up}/resources/css/update.css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
</head>
<body>

	<jsp:include page="include/top.jsp" />
	<c:set var="mem" value="${update }"/>
	
	<div align="center">
		<form method="post" 
			action="<%=request.getContextPath() %>/update_ok.do">
			<div class="title"><h3>개인 정보 수정</h3></div>
			
			<table class="table" border="1" cellspacing="0">
				<tr>
					<th>아이디</th>
					<td>
						<input name="member_id" value="${mem.member_id }" readonly>
					</td>
				</tr>
				
				<tr>
					<th>이  름</th>
					<td>
						<input name="member_name" value="${mem.member_name }" readonly>
					</td>
				</tr>
				
				<tr>
					<th>생년월일/성별</th>
					<td>
						<input name="member_birth" value="${mem.member_birth }" readonly>
						<input name="member_gender" value="${mem.member_gender }" readonly>
					</td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td>
						<input name="member_email" value="${mem.member_email }">
					</td>
				</tr>
				
				<tr>
			     <th><label for="member_addr">주소</label></th>
				 <td> <input type="text" id="sample6_postcode" placeholder="우편번호">
					  <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					  <input type="text" id="sample6_address" placeholder="주소" name="member_addr"><br>
					  <input type="text" id="sample6_detailAddress" placeholder="상세주소" name="member_detailaddr">
					  <input type="text" id="sample6_extraAddress" placeholder="참고항목">
				 </td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="submit" value="수정하기">
						<input type="reset" value="취소">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>