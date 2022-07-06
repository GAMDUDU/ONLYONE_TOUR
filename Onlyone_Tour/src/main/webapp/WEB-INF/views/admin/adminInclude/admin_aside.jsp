<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   
   /*  토글 버튼 구현 */
   .dropdown{
      list-style: none;
      background: #ccc;
      width: 200px;
      padding:0;
      margin:0;
      position: fixed; 
      height: 60%;
      overflow: auto;
      z-index: 5;
      border: 1px solid black;
      overflow-x: hidden;
   }
   
   .nav_bar {
      display: none;
      padding-bottom: 30px;
    }
    
    .nav_bar a{
       display:flex;
       flex-direction: column;
       padding-left: 20px;
       margin: 8px 0px;
       text-decoration: none;
       color: black;
       font-family: Arial, Dotum, "돋움", sans-serif;
       font-weight: 500;
    }
    
    .nav_bar a:hover{
       background: #1C1C1C;
       color: #A5C9FF;
    }
    
    
    .manu_nav_bar {
      font-size: 19px;
      padding: 10px 20px;
      cursor: pointer;
      border: none;
      outline: none;
      background: none;
      width: 100%;
      text-align: left;
      margin-bottom: 10px;
      color: black;
      font-weight: bold;
    }
    
    .manu_nav_bar:hover{
       color: #626262;
    }
    
    [id$="-toggle"] {
      margin-right: 15px;
    }
   .logo_img{
      margin-bottom: 20px;
   }
   
   .logo_img img{
      width: 200px;
      height: 120px;
      border: 1px solid gray;
      background-size: cover;
   }
   
</style>
</head>
<body>
   
<div class="dropdown">
     
   <div class="faq-content">
     
     <div class="logo_img">
           <img alt="" src="../resources/image/로고.jpg">
     </div>
     
     <button class="manu_nav_bar" id="que-1">
        <span id="que-1-toggle">+</span>
        <span>고객 관리</span>
     </button>
     
     <div class="nav_bar" id="ans-1">
        <a href="<%=request.getContextPath()%>/admin_memberlist.do">고객정보</a>
     </div>
   
   </div>
      
   <div class="faq-content">
     
     <button class="manu_nav_bar" id="que-3">
        <span id="que-3-toggle">+</span>
        <span>상품 등록</span>
     </button>
     
     <div class="nav_bar" id="ans-3">
        <a href="<%=request.getContextPath()%>/admin_travel_list.do">패키지상품</a>
        <a href="<%=request.getContextPath()%>/admin_hotel_list.do">호텔</a>
        <a href="<%=request.getContextPath()%>/admin_air.do">항공</a>
     </div>
   
   </div>
   
   
   <div class="faq-content">
     
     <button class="manu_nav_bar" id="que-4">
        <span id="que-4-toggle">+</span>
        <span>게시판 관리</span>
     </button>
     
     <div class="nav_bar" id="ans-4">
       <a href="<%=request.getContextPath()%>/notice_list.do">공지사항</a>
       <a href="<%=request.getContextPath()%>/question_list.do">자주 찾는 질문 관리</a>
       <a href="<%=request.getContextPath()%>/oneQuestion_list.do">1:1 문의 관리</a>
     </div>
   
   </div>
     
</div>

<script type="text/javascript">
   const items = document.querySelectorAll('.manu_nav_bar');
   
   function openCloseBar() {
     const answerId = this.id.replace('que', 'ans');
   
     if(document.getElementById(answerId).style.display === 'block') {
       document.getElementById(answerId).style.display = 'none';
       document.getElementById(this.id + '-toggle').textContent = '+';
     } else {
       document.getElementById(answerId).style.display = 'block';
       document.getElementById(this.id + '-toggle').textContent = '-';
     }
   }
   
   items.forEach(item => item.addEventListener('click', openCloseBar));
      
</script>
</body>
</html>