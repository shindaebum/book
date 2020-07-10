<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>Main</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	 href="http://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"/>
<script src="http://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<style>
	table{
		width: 600px;
		height: 300px;
		border: 1px solid black;
		margin-left: -10px;
	}
	
	tr,td{
		border: 1px solid black;
	}
	
	.title{
		text-align: center;
		font-weight: bold;
		font-family: 굴림;
	}
	
	.register{
		text-align: right;
	}
	
	input{
		width:200px;
	}
	
	.menu{
		display: block;	
		margin: 0px 0px 0px 0px;
		
	}
</style>
</head>
<body>
<br>
<div class='container'>
	<h3><strong>[책 추가]</strong></h3>
	<br><br>
	
	<form action='addBookProc.jsp' method='post' enctype='multipart/form-data'>
	
<!-- 	이미지 -->
		<div class='menu'>
			<div class="col-sm-2 col-md-4" >
	        	<div class="thumbnail">
	          			<a href="#" class="thumbnail" style="height: 150px;"></a>
	       			<div class="caption">
	          			<label>첨부이미지<input type='file' name='imgName'/></label>
	       			</div>
	 			</div>
	 		</div>
	
	
<!-- 도서 -->
			<table>
				<tr>
					<td class='title'>*ISBN</td>
					<td><input type='number' class='form-control' name='ISBN' required></td>
				</tr>
				<tr>
					<td class='title'>*제목</td>
					<td><input type='text' class='form-control' name='title' required ></td>
				</tr>
				<tr>
					<td class='title'>*가격</td>
					<td><input type='text' class='form-control' name='price' 
					onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" style="IME-MODE:disabled;" required></td>
				</tr>
				<tr>
					<td class='title'>*저자명</td>
					<td><input type='text' class='form-control' name='author' required></td>
				</tr>
				<tr>
					<td class='title'>*출판사명</td>
					<td><input type='text' class='form-control' name='pubName' required></td>
				</tr>
				<tr>
					<td class='title'>*출판일</td>
					<td><input type='date' class='form-control' name='pubDate' placeholder='YYYY-MM-DD 형식으로 입력해주세요.' required></td>
				</tr>
				<tr>
					<td class='title'>*장르</td>
					<td><input type='text' class='form-control' name='type'  placeholder='국내도서  / 해외도서' required></td>
				</tr>
			</table>
		
				</div>
				<hr style='border:1px solid silver;' width='90%'>
				<h4><strong>책소개</strong></h4>
				<textarea class="form-control" name="info" maxlength="2048" 
						style="height: 350px;">
				
				</textarea>
				<br>
				<div class='register'>
						<button type='submit' class='btn btn-primary'>등록</button>
						
						<button type='button' class='btn btn-default'
							onClick="location.href='../main.jsp'">취소</button>
				</div>
		</form>
	</div>
</body>
</html>


    