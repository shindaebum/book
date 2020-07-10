
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
	.area{
		display: inline;
		text-align: right;
	}
	
	table{
		width:60%;
		border-spacing:10px;
		margin-top:10px;
		font-size: 1.5em;	
		border-collapse: separate;
		border-spacing: 0 10px;
	}
	
	.button{
		text-align: right;
	}
	
	
	.detail{
		height: 150px;
	}
	
	.thumnail{
		display: inline;
	}
	
	.box{
		margin: 0px 0px 0px 100px;
	}
	
</style>
</head>
<body>
<br>
<div class='container'>
	<div class='button'>
		<button type='button' class='btn btn-default' onClick="location.href='../main.jsp'">관리자 메인으로</button>
	</div>
	
	<%
		BookService bookService = new BookServiceImpl();
		String ISBN= request.getParameter("ISBN");
		
		if(ISBN != null){
			long bookISBN = Long.parseLong(ISBN);
			Book book = bookService.findBook(bookISBN);
	%>
	<form action='modifyBookProc.jsp'>
		<div class='box'>
			<h3 style='text-align:center;'><%=book.getBookTitle() %></h3>
			<hr style='border:1px solid silver;' width='90%'>	
			<hr>
				<input type='hidden' name='ISBN' value='<%=book.getISBN() %>'/>
			<div class="row">
		     	<div class="col-sm-6 col-md-4">
		        	<div class="thumbnail">
	           			<a href="02.html" class="thumbnail" style="height: 150px;"> </a>
		       			<div class="caption">
		          			<label>이미지 업로드<input type='file'/></label>
		       			</div>
		 			</div>
		 		</div>
		 		
		 		<table class='detail'>
		 			<tr>
		 				<td>장르:</td>
		 				<td><input type='text' value='<%=book.getBookType()%>' name='type'/></td>
		 			</tr>
		 			<tr>
		 				<td>가격:</td>
		 				<td><input type='text' value='<%=book.getBookPrice()%>' name='price' 
		 				onKeypress="if(event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;" style="IME-MODE:disabled;"/></td>
		 			</tr>
		 			<tr> 
		 				<td>저자명:</td>
		 				<td><input type='text' value='<%=book.getAuthor()%>' name='author'/></td>
		 			</tr>
		 			<tr>
		 				<td>출판사명:</td>
		 				<td><input type='text' value='<%=book.getPubName()%>' name='pubName'/></td>
		 			</tr>
		 			<tr>
		 				<td>출판일:</td>
		 				<td><input type='date' value='<%=book.getPubDate()%>' name='pubDate'/></td>
		 			</tr>
		 		</table>
		 	</div>
			
			<hr style='border:1px solid silver;' width='90%'>
			<h4><strong>책 소개</strong></h4>
			<textarea class="form-control" name="info" maxlength="2048" style="height: 350px;">
			<%=book.getBookInfo() %>
			</textarea><br>

		
			<div class='button'>
				<button type='submit' class='btn btn-warning' >수정</button>
				<button type='submit' class='btn btn-danger'
					formaction='delBookProc.jsp?ISBN=<%=book.getISBN()%>'>삭제</button>
	<%
		}
	%>
			</div>
		</div>
	</form>
</div>
</body>
</html>
    