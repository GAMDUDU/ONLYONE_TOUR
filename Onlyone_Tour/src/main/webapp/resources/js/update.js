/**
 * 
 */
 
 
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

// 우편번호와 참조주소는 숨긴다
document.getElementById('sample6_postcode').style.display = 'none';
document.getElementById('sample6_extraAddress').style.display = 'none';


function submitCheck(){

	// 멤버 정리
	let userPwd1 = $("#member_pwd1").val();
	let userPwd2 = $("#member_pwd2").val();
	let userEmail = $("#member_email").val();
	let userPhone = $("#member_phone").val();
	let userGender = $('input:radio[name=member_gender]:checked').val();
	let userBirth = $("#member_birth").val();
	let userJibunAddress = $("#sample6_address").val(); //지번주소
	let userDetailAddress = $("#sample6_detailAddress").val();// 상세주소
	
	// 비밀번호 정규식 (최소 8자, 하나 이상의 문자, 하나의 숫자 및 하나의 특수 문자 정규식을 적용)
	let passwordRule = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
	
	// 중복확인 처리하기
	let user_email_check = $("#user_email_check").val();
	
	if(user_email_check == 0){
		swal("이메일 중복체크를 진행해 주세요");
		$("#member_email").focus();
		return false;
	}
	
	if(userPwd1 == null || userPwd1 == ""){
		swal("비밀번호를 입력해 주세요.");
		$("#member_pwd1").focus();
		return false;
	}
	
	if(!passwordRule.test(userPwd1)){
		swal("비밀번호를 다시 입력해주세요");
		$("#member_pwd1").val('').focus();
		return false;
	}
	
	if(userPwd1 != userPwd2){
		swal("비밀번호를 동일하게 입력해주세요.");
		$("#member_pwd2").focus();
		return false;
	}
	
	if(userEmail == null || userEmail == ""){
		swal("이메일을 입력해주세요.");
		$("#member_email").focus();
		return false;
	}
	
	if(userPhone == null || userPhone == ""){
		swal("전화번호를 입력해주세요.");
		$("#member_phone").focus();
		return false;
	}
	
	if(userBirth == null || userBirth == ""){
		swal("생년월일을 입력해주세요.");
		$("#member_birth").focus();
		return false;
	}
	if(userJibunAddress == null | userJibunAddress == ""){
		swal("주소를 입력해주세요");
		$("#sample6_address").focus();
		return false;
	}
	if(userDetailAddress == null | userDetailAddress == ""){
		swal("상세주소를 입력해주세요");
		$("#sample6_detailAddress").focus();
		return false;
	}
}

 
 
// 유효성검사 아이디 비밀번호 숨기기
let inputId = $("#member_id");
let inputPwd1 = $("#member_pwd1");
let inputPwd2 = $("#member_pwd2");
let textbox1 = $('.text_box1');
let textbox2 = $('.text_box2');
let textbox3 = $('.text_box3');

textbox1.css("display", "none");
textbox2.css("display", "none");
textbox3.css("display", "none");

function showId(){
	textbox1.show();
}

function showPwd1(){
	textbox2.show();
}

function showPwd2(){
	textbox3.show();
}

inputId[0].addEventListener("click", showId);
inputPwd1[0].addEventListener("click", showPwd1);
inputPwd2[0].addEventListener("click", showPwd2);
inputId[0].addEventListener("keyup", showId);
inputPwd1[0].addEventListener("keyup", showPwd1);
inputPwd2[0].addEventListener("keyup", showPwd2);


 