<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	
	String l = request.getParameter("msg0");
	if(l == null) l = "";
	
	String w = request.getParameter("msg7");
	if(w == null) w = "";
%>

<!DOCTYPE html>
<html lang='ko'>
<head>
<title>BoB</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	
	.login{
		margin: 0 auto;
		text-align: center;
		font-size: 13pt;
	}
	
	.area{
		display: inline;
		text-align: right;
	}
	
	#id, #pwd{
		border: 2px solid black;
		width: 300px;
		height: 50px;
		font-size: 15px;
	}
	
	h3{
		margin-left: 100px;
	}
	
	.footerlogo{
		text-align: center;
		font-weight: bold; 
		font-size: 5em;
		line-height: 1.0em; 
		color: navy;
		font-family: arial;
	}
	
	table{
		width:60%;
		margin: auto;
		text-align: center;
	}
	
	.title{
	   padding: 10 0 0 10px;
	   border-bottom: 1.5px solid #0B2161;
	   letter-spacing: -0.07em
	}
	
	h1{
	   font-size: 32px;
	   padding-left: 20px;
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
</style>
<body>
<br>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<a href='../user/login.jsp'>로그인</a> <span>|</span>
			<a href='addUser.jsp'>회원가입</a> <span>|</span>
			<a href='../user/login.jsp'>마이페이지</a> <span>|</span>
			<a href='../user/login.jsp'>장바구니</a> <span>|</span>
			<a href='../user/login.jsp'>고객센터</a> 
		</div>
	</div>
	<br>

	<!-- 로고 -->
	<div class='logo'>
		<a href='../main.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<br>
	<!-- header -->
	<div class='title'>
		<a href='#' style="text-decoration:none">
			<h1>로그인
			<span>Login</span>
			</h1>
		</a>
	</div> <br><br>
	
	<hr style='border:0.5px solid silver;' width='90%'>
	<br><br>
	
	<div class='login'>
		<form action='loginProc.jsp' name='loginform' >
			<input type='radio' name='member' value="1" checked>회원 &nbsp;&nbsp;&nbsp;
			<input type='radio' name='member' value="2">관리자<br><br>
		
			<p><input type='text' name="userId" id='id' placeholder='아이디' size=30 required></p>
			<p><input type='password' name="userPwd" id='pwd'  placeholder='비밀번호' size=30 required></p>
			<div class='button'>
				<p><button type='submit' class='btn btn-info' style='width: 220pt' >로그인</button></p>
				<button type='button' class='btn btn-success'style='width: 220pt'  onClick="location.href='addUser.jsp'">회원가입</button><br><%= l %><%= w %>
			</div>
		</form>
	</div>
	<br><br><br>
	
	<footer class='footer'>
		<hr style='border:1px solid silver;' width='90%'>
		<table>
			<tr>
				<th><div class='footerlogo'>BoB<i class="fas fa-book-open" aria-hidden="true"></i></div></th>
				<th>
					|대표이사 : 이윤정 <br>
					|사업자 등록 번호: 224-11-33000<br>
					|주소 : 서울 마포구 월드컵북로 21 풍성빌딩 2층 <br>
					|TEL: 02)1544-3000<br><br>
					Copyright 2020 BOOK Corp. All Rights Reserved	
				</th>
			</tr>		
		</table>
	</footer>
</div>
</body>
</html>