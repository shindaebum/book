<%@page import="java.util.ArrayList"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<%@ page import='java.util.List' %>
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
	
	.area{
		display: inline;
		text-align: right;
	}
	
	#img{
		width: 300px;
		height: 400px;
		margin-left:50px;
		float: left;
		margin-bottom: 60px;
		margin-top: 30px;
	}
	
	#bookInfo{
		padding:10px;
		line-height: 38px;
		display: inline-block;
		width: 500px;
		height: 200px;
		float: left;
		margin: 0px 0px 0px 20px;
		margin-bottom: 200px;
	}
	
	#bookIntroduce{
		display: block;
		margin: 0px 0px 0px 150px;
	}
	
	#bookTable{
		width:300px;
	}
	
	input{
		width: 50px;
		height:30px;
	}
	
	h3{
		margin: 0px 0px 0px 50px;
	}
	
	.text{
		line-height: 0.5em;
	}
	
	td{
		font-size: large;
	}
	
	
	
</style>
</head>
<body>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<%
				if(session.getAttribute("LoginId")!=null){
			%>
				<h5><%= session.getAttribute("LoginId") %>님, 환영합니다 !</h5>
				<a href='../user/logoutProc.jsp'>로그아웃</a> <span>|</span>
				<a href='../mypage/mypage.jsp'>마이페이지</a> <span>|</span>
				<a href='../cart/cartOut.jsp'>장바구니</a> <span>|</span>
				<a href='../qa/list.jsp'>고객센터</a>
			<%
				}else{
			%>
				<br><a href='../user/login.jsp'>로그인</a> <span>|</span>
				<a href='../user/addUser.jsp'>회원가입</a> <span>|</span>
				<a href='../user/login.jsp'>마이페이지</a> <span>|</span>
				<a href='../user/login.jsp'>장바구니</a> <span>|</span>
				<a href='../user/login.jsp'>고객센터</a>
			<%
				}
			%>
		</div>
	</div>
	<br>
	
	<div class='logo'>
		<%
			if(session.getAttribute("LoginId")!=null){
		%>
			<a href='../user/loginComplete.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
		<%
			}else{
		%>
			<a href='../main.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
		<%
			}
		%>
	</div>
	<br>
	
	<div>
		<h3>BOOK</h3>
	</div>
	<hr style='border:0.5px solid silver;' width='90%'>
		
		<%
			BookService bookService = new BookServiceImpl();
		
		//request받은 ISBN으로 하나의 책 정보 찾기
			String ISBN= request.getParameter("ISBN");
			
			if(!ISBN.equals("")){
				long bookISBN = Long.parseLong(ISBN);
				Book book = bookService.findBook(bookISBN);
			
		%>
		
<!-- 대범 이미지 수정		 -->
		<div id='bookIntroduce'>
			<div id='bookImg'>
				<div id='img' >
					<img src='../attach/<%=bookService.readBookImgName(book.getISBN()) %>' width='300' height='400'/>
				</div>
			</div>
		</div>
		
		<div id='bookInfo'>
			<div class='text'>
				<h2><strong><%=book.getBookTitle() %></strong></h2>
				<small style='font-size:2px'><%=book.getAuthor() %> 지음 | <%=book.getPubName() %> | <%=book.getPubDate() %>출간 </small>
			</div>
			<br>
			<div>
				<form name='form' method='post'>
					<table id='bookTable'>
						<tr>
							<td>
								<span style='font-weight:900; margin-right:20px;'>판매가:</span> <%=book.getBookPrice() %>원
							</td>
						</tr>
						<tr>
							<td>
								<span style='font-weight:900;'>배송비:&nbsp;&nbsp;&nbsp;</span>
									<span style='color:blue;'>무료</span>
							</td>
						</tr>
						<tr>
							<td>
								<span style='font-weight:900; margin-right:15px;'>주문수량:</span>
								<input type='number' value='1' min='1' max='50' 
									name='orderCnt' style='text-align:center;'/>권
							</td>
						</tr>
					</table>
					<br>
					<input type='hidden' name='cartBook' value='<%=book.getISBN() %>'/>
					
					<%
						if(session.getAttribute("LoginId")!=null){
					%>
							<button type='submit' class='btn btn-warning'
								 formaction='../cart/cartProc.jsp'>장바구니 담기</button>
							<button type='submit' class='btn btn-danger' 
								formaction='../order/justOrder.jsp'>바로 구매하기</button>
					<%
						}else{
					%>
								<button type='submit' class='btn btn-warning'
								 formaction='../user/login.jsp'>장바구니 담기</button>
							<button type='submit' class='btn btn-danger' 
								formaction='../user/login.jsp'>바로 구매하기</button>
					<%
						}
					%>
				</form>
			</div>
		</div>	
		<br><br>
		
		<hr style='border:0.5px solid silver;' width='90%'>
			<h3><strong>책소개</strong></h3><br>
			<p style='width:700px; margin:0px 0px 0px 50px'>
			<%= book.getBookInfo() %>
			</p>
		<%
			}
		%>
		
		<div align='right'>	
			<button type='button' class='btn btn-default btn-lg'
					onClick="location.href='../book/bookList.jsp'">도서목록</button>
		</div>
</div>
</body>
</html>
