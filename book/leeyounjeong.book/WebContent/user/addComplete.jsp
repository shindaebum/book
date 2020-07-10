<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	}
	
	.area{
		display: inline;
		text-align: right;
	}
	
	h3{
		margin-left: 80px;
	}
	
	.content{
		font-weight:bold;
		text-align: center;
		font-size: large;
	}
	
	.btn{
		display: block;
		margin: 0 auto;
		width: 100px;
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

</style>
<body>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<a href='login.jsp'>로그인</a> <span>|</span>
			<a href='addUser.jsp'>회원가입</a> <span>|</span>
			<a href='login.jsp'>마이페이지</a> <span>|</span>
			<a href='login.jsp'>장바구니</a> <span>|</span>
			<a href='login.jsp'>고객센터</a> 
		</div>
	</div>
	<br>

	<div class='logo'>
		<a href='../main.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<br>
	
	<div>
		<h3>Login</h3>
	</div>
	<hr style='border:0.5px solid silver;' width='90%'>
	<br><br>
	
	<div class='content'>
		<p>BoB의 회원이 되신걸 축하드립니다!</p>
	</div>
	
	<div>
		<button type='button' class='btn btn-success' 
			onClick="location.href='../main.jsp'">메인으로</button>
	</div>
	<br><br><br><br>
	
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