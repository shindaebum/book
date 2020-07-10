<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	
	String b = request.getParameter("msg2");
	if(b == null) b = "";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Password</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
.logo{
		text-align: left;
		font-weight: bold; 
		font-size: 5em;
		line-height: 1.0em; 
		color: navy;
		font-family: arial;
}

.area{
	display: inline;
	text-align: right;
}

.title{
   padding: 10 0 0 10px;
   border-bottom: 1.5px solid #424242;
   letter-spacing: -0.07em
}

h1{
   font-size: 32px;
   color: #000;
   line-height: 1;
   font-family: 'Montserrat', 'Noto Sans KR', Verdana, Dotum, AppleGothic, sans-serif;
}

.title span{
   font-size: 21px;
   color: #d2d2d2;
   font-weight: 500;
   letter-spacing: 0em;
   margin-left: 3px;
}

.sub_tit{
   font-size: 18px;
   border-bottom: 1px solid #0B2161;
   border-left: 5px solid #0B2161;
   padding-top: 2px;
   padding-bottom: 5px;
   padding-left: 10px;
   letter-spacing: -0.07em;
   line-height: 30px;
}

#more{
   color: #6E6E6E;
   float: right;
   padding: 5px 10px;
   font-size:14px;
}

#tb th{
    height: 48px;
    border-bottom: 1px solid #000000;
    vertical-align: middle;
    text-align: center;
}

#tb td{
   vertical-align: middle;
   text-align: center;
}

#deli_btn{
   font-size: 12px;
   height: 32px;
   line-height: 30px;
   padding-top: 0;
   border: 1px solid #e5e5e5;
   color: #000000;
   width: 80px;
   margin: 4px auto;
}
</style>
</head> 
<body>
<div class="container">
	<div class='area'>
		<div class='top_menu'>
			<h5><%= session.getAttribute("LoginId") %>님, 환영합니다 !</h5>
			<a href='../main.jsp'>로그아웃</a> <span>|</span>
			<a href='../mypage/mypage.jsp'>마이페이지</a> <span>|</span>
			<a href='../cart/cartOut.jsp'>장바구니</a> <span>|</span>
			<a href='../qa/list.jsp'>고객센터</a> 
		</div>
	</div>
	<br>
	
	<!-- 로고 -->
	<div class='logo'>
		<a href='loginComplete.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<br>
 <!-- header -->
   <div class='title'>
      <a href='../mypage/mypage.jsp' style="text-decoration:none">
	      <h1>마이페이지
	      <span>MyPage</span>
	      </h1>
	  </a>
   </div>
   
   <!-- nav -->
	<nav class='navbar navbar-default' style='background-color:#0B2161'>
	<div class='container-fluid'>
		<ul class='nav navbar-nav'>
			<li><a style='color:#FFFFFF' href='../order/orderOut.jsp'>전체 주문 내역</a></li>
			<li><a style='color:#FFFFFF' href='../qa/myQa.jsp'>내가 쓴 글</a></li>
			<li><a style='color:#FFFFFF' href='userManage.jsp'>회원 정보 관리</a></li>
		</ul>			
	</div>
	</nav>
	
	<ul class="nav nav-tabs nav-justified">
		<li><a href='userManage.jsp'>회원수정</a></li>
		<li><a href='deleteUser.jsp'>회원탈퇴</a></li>
	</ul>
	
	<h3 style="text-align:center;">비밀번호 재확인</h3>
	<p style="text-align:center;">개인정보보호를 위해 회원님의 비밀번호를 다시 한번 확인합니다.</p>
	<form action="userManageProc.jsp">
		<div class="input-container" style="text-align:center; background-color: #F2F2F2;  padding: 60px 10px;">
			<input class="confirm_input" type="password" name="correctPwd" placeholder=" 비밀번호 입력" style="width:300px; height:40px;"/><br><%= b %><br><br>
			<button type="submit" class="button" style="width:300px; height:40px;">확인</button>
		</div>
	</form>
</div>
</body>
</html>