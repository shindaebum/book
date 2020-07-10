<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
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
	
	.carousel-inner{
		width: 150px;
		height: 200px;
	}
	
	.carousel-indicators {
   		 background-color: skyblue;
	}
	
	.recommand{
		text-align: center;
		padding-top: 9px;
		border: 1px solid black;
		height: 50px;
		width: 400px;
		margin: 0 auto;
		background: skyblue;
		border-radius: 20px;
	}
	
	.image{
		display: inline-block;
		padding-top: 100px;
		border: 1px solid black;
		width: 200px;
		height: 220px;
		margin: 20px;
		text-align: center;
		background-color:#ccc
	}
	
	.recommandBook{
		margin: 0 auto;
		text-align: center;
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
	
	ul{
		list-style-type: none;
		margin:0;
		padding: 0;
		overflow: hidden;
		text-align: center;
		background-color: #0B2161;
	}
	
	li{
		display:inline-block;
		width: 570px;
		font-size: 15px;
	}
	
	li a{
		display: block;
		color: #FFFFFF;
		border-width: 50px;
		padding: 14px 16px;
		text-decoration: none;
	}
	
	li a:hover{
		color: #FFFFFF;
		background-color: #084B8A;
	}

<!-- 수정	 -->	
	.thumbnail{
		position: relative;
		padding-top: 0%;
		overflow:hidden;
	}
	
	
	.thumbnail-img{
		transform: translate(-50%,-50%);
	}
	h1 {
        font-family: 'Oswald', sans-serif;
        }

    p {
        font-family: 'Montserrat', sans-serif;
       }

   .image-wrap {
            position: relative;
            width: 100%;
            height: 20vh;
            overflow-x: hidden;
        }
        
    .banner-content {
            position: absolute;
            z-index: 99999;
            top: 30%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 80%;
            text-align: center;
            font-size: 1.5em;
            color: #fff;
            line-height: 1.5;
        }
        
      .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            background: #BCA9F5;
            opacity: .8;
            z-index: 999;
            height: 100%;
       }
</style>
</head>
<body>
<br>
<div class='container'>

<!-- 상단 메뉴  -->
	<div class='area'>
		<div class='top_menu'>
			<a href='./user/login.jsp'>로그인</a> <span>|</span>
			<a href='./user/addUser.jsp'>회원가입</a> <span>|</span>
			<a href='./user/login.jsp'>마이페이지</a> <span>|</span>
			<a href='./user/login.jsp'>장바구니</a> <span>|</span>
			<a href='./user/login.jsp'>고객센터</a> 
		</div>
	</div>
	<br>
	
	<!-- 로고 -->
	<div class='logo'>
		<a href='main.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<br>
	
	<!-- 도서 메뉴 -->

	<ul id='nav'>
			<li><a href='./book/bookList.jsp'>도서목록</a>
	</ul>
	
	<!-- 베스트셀러  -->
	<div class="image-wrap">
        <div class="img-content">
            <img src="" alt="">
        </div>
        <div class="overlay"></div>
    </div>
    <div class="banner-content">
        <h1>Welcome to BoB Library!</h1>
    </div>
	<br><br>
	
	
	<%
		BookService bookService = new BookServiceImpl();
		List<Book> books = bookService.listBooks();
	%>	
	
	<!-- 추천도서 -->
	<div>
		<h3 style='text-align:center;'><strong>이 달의 추천도서</strong></h3>
	</div>
	<br>
<%
		if (books != null && books.size() > 0) {
			pageContext.setAttribute("books", books);
		
			
	%>	
<!-- 수정	 -->
	<div class="container center-block text-center">
	  	<div class="row">
		<%		
			for(int i= 0; i<4; i++ ){
				//Collections.reverse(books);
				Book book= books.get(i);
		%>
	     		<div class="col-sm-3 col-md-3">
		        	<div class="thumbnail">
           			<a href="./book/detailBook.jsp?ISBN=<%=book.getISBN() %>" class="thumbnail-img"> 
           				<img src='./attach/<%=bookService.readBookImgName(book.getISBN()) %>' width='200' height='150'/>
           			</a>
		       			<div class="caption">
		          			<h5><%=book.getBookTitle() %></h5>
		          			<h6><%=book.getBookPrice() %>원</h6>
		          			<p><%=book.getPubName() %></p>
		       			</div>
	 				</div>
	 			</div>
	 		<%
				}
	 		%>
	 	</div>
	</div>
	<br><br><br><hr>
	<%
			}else{
	%>
		<div class='alert alert-default'>
			<strong>등록된 도서가 없습니다.</strong>
		</div>
	<%
		}
	%>
	<!-- 하단 footer -->
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