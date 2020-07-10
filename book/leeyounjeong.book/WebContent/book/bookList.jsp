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
	
	.thumbnail{
		display:inline-block;
		width: 313px;
		height: 500px;
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
	
	<ul class='nav nav-tabs'>
		<li><a  data-toggle='tab' href='#menu1'>국내도서</a></li>
		<li><a  data-toggle='tab' href='#menu2'>해외도서</a></li>
	</ul>
	<br><br><br>
	
	<div class='tab-content'>
		<div id='menu1' class='tab-pane fade in active'>	
			<div class="container center-block text-center">
				<div class="row">
				<% 
					BookService bookService = new BookServiceImpl();	
				  	
					//책목록 불러오기
					List<Book> books = bookService.listBooks();  
					if (books != null && books.size() > 0) {
							
					//책 ISBN리스트  만들기
						for(Book book: books){
							if(book.getBookType().equals("국내도서")){
					 			ArrayList<Long> ISBNlist = new ArrayList<Long>();
								ISBNlist.add(book.getISBN());
							
							//ISBN리스트에서 하나씩 세션에 저장하여 detailBook.jsp에 넘겨주기
								for(int i=0; i<ISBNlist.size();i++){
									pageContext.setAttribute("ISBN", ISBNlist.get(i));
				%>
				     	<div class="col-sm-4 col-lg-4">
				        	<div class="thumbnail">
			           			<a href="detailBook.jsp?ISBN=<%=pageContext.getAttribute("ISBN")%>" class="thumbnail-img" >
	<!-- 수정	 -->		       		<img src='../attach/<%=bookService.readBookImgName(book.getISBN()) %>' width='200' height='150'/>
			           			 </a>
				       			<div class="caption">
				          			<h5><%=book.getBookTitle() %></h5>
				          			<h6><%=book.getBookPrice() %>원</h6>
				          			<p><%=book.getPubName() %></p>
				       			</div>
				 			</div>
				 		</div>
			 		<%}
					  	} 
						  }%>
				</div>
			</div>
		</div>
		
		<div id='menu2' class='tab-pane fade'>	
			<div class="container center-block text-center">
				<div class="row">
				  	<% 
						for(Book book: books){
							if(book.getBookType().equals("해외도서")){
								ArrayList<Long> ISBNlist = new ArrayList<Long>();
								ISBNlist.add(book.getISBN());
							
								for(int i=0; i<ISBNlist.size();i++){
									pageContext.setAttribute("ISBN", ISBNlist.get(i));
					%>
				     	<div class="col-sm-4 col-md-4">
				        	<div class="thumbnail">
			           			<a href="detailBook.jsp?ISBN=<%=pageContext.getAttribute("ISBN") %>" class="thumbnail-img"> 
			           				<img src='../attach/<%=bookService.readBookImgName(book.getISBN()) %>' width='200' height='150' />
			           			</a>
				       			<div class="caption">
				          			<h5><%=book.getBookTitle() %></h5>
				          			<h6><%=book.getBookPrice() %>원</h6>
				          			<p><%=book.getPubName() %></p>
				       			</div>
				 			</div>
				 		</div>
			 		<%}
						} 
					      }
					      	}else{
					%>
						<div class='alert alert-info'>
							<strong>등록된 도서가 없습니다.</strong>
						</div>
					 <%
					      	}
					 %>
					</div>
				</div>
			</div>
		</div>
		<br><br>
	
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
			<br><br>
		</footer>
	</div>
</body>
</html>
