<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>탈퇴완료</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
#body{
	width: 1020px;
	margin : 0 auto 20px;
}

.title{
	height:70px;
	border-bottom: 3px solid #777;
}

h3{
	float: left;
	margin-top: 5px;
	line-height: 70px;
	font-size: 30px;
}

h4{
	font-size: 25px;
	padding-bottom : 10px;
}

h5{
	font-size: 17px;
}

h6{
	padding-bottom : 30px;
}
.content{
	border : 2px solid #BDBDBD;
	margin : 20px auto;
	text-align : center;
	padding-top : 70px; 
	padding-bottom : 40px; 
}

a{
	margin-right : 15px;
	padding : 10px 20px;
}
</style>
</head>
<body>
<div class='container'>
	<div id='body'>
		<div class='title'>
			<h3>탈퇴</h3>
		</div>
		<div class='content'>
			<h4><strong>회원탈퇴가 완료되었습니다.</strong></h4>
            <h5>그동안 BoB서비스를 이용해주셔서 감사합니다.</h5>
			<h6>보다 더 나은 서비스로 찾아뵙겠습니다.</h6>
			<a href='../main.jsp' class='btn btn-lg btn-default'>메인으로</a>
		</div>
	</div>
</div>