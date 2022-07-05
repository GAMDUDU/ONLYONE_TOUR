<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/27a0dd965d.js" crossorigin="anonymous"></script>
<style type="text/css">
    
    th{
        width: 100px;
    }

	.button_container{
		display:flex;
		margin: 10px 5px;
	}

    #joinok_container{
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
        margin: 50px auto;
    }
    
    .text-join{
        width: 100%;
        font-size: 25px;
        color: gray;
        font-weight: bold;
        padding-left: 30px;
    }
    
    #joinok_title{
        margin-top: 50px;
        margin-bottom: 30px;
        margin-right: 20px;
        text-align: center;
        font-size: 23px;
        font-weight: bold;
        color: #606060;
    }
    table{
   		border-top: 4px solid rgb(255,212,0);
        border-bottom: 4px solid rgb(255,212,0);
        margin-bottom: 50px;
        margin-right: 60px;
    }

   tr{
   		text-align: center;
        height: 65px;
    }
	
    th{
        padding-left: 20px;
    }

    td{
        width: auto;
    	text-align: center;
        margin: 50px 0px;
        font-size: 16px;
        font-weight: bold;
        color: gray;
    }
	
	
    #btn_joinok{
    width: 200px;
    height: 45px;
    font-size: 16px;
    line-height: 40px;
    border: 1px solid rgb(255,212,0);
    background-color: rgb(255,212,0);
    color: #fff;
    margin-right: 80px;
    border-radius: 3px;
    cursor: pointer;
    font-weight: bold;
    }
	
    .button-bar{
        display: flex;
        justify-content: center;
        align-items: center;
        margin-left: 50px;
    }

    .fa-solid {
        position: relative;
        top: 40px;
        right: 200px;
        font-weight: normal;
        color: blue;
        font-size: 30px;
    }
	
</style>
</head>
<body>
	<c:set var="member" value="${name}"/>	
    
    <div class="container" id="joinok_container">
        <span id="joinok_title">온리원 투어</span>
        <table cesllspacing="0" width="600">
		
		<tr>
			<i class="fa-solid fa-circle-check fa-lg"></i><td class="text-join">회원가입이 완료되었습니다!</td>
		</tr>
		        
        <tr>
            <td>${member}님 어서오세요.</td>
        </tr>
		
		<tr class="tr03">
			<td>로그인을 하시면 온리원 투어의 모든 서비스를 이용하실 수 있습니다.</td>
		</tr>

        </table>
        
        <div class="button-bar">
            <input type="button" id="btn_joinok" value="로그인페이지로이동"
                    onclick="location.href='login.do'">
            
            <input type="button" id="btn_joinok" value="메인페이지로이동"
                    onclick="location.href='/'">
        </div>

    </div>
	
</body>
</html>