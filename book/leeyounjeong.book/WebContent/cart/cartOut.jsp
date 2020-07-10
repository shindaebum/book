<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<%@ page import='java.util.List' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>BoB</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
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
	
	.book{
			padding-top: 60px;
			width: 80px;
			height: 100px;
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
	
	th,td{
		text-align:center;
	}
</style>
</head>
<body>
<div class="container">
	<div class='area'>
		<div class='top_menu'>
			<h5><%= session.getAttribute("LoginId") %>님, 환영합니다 !</h5>
			<a href='../user/logoutProc.jsp'>로그아웃</a> <span>|</span>
			<a href='../mypage/mypage.jsp'>마이페이지</a> <span>|</span>
			<a href='../cart/cartOut.jsp'>장바구니</a> <span>|</span>
			<a href='../qa/list.jsp'>고객센터</a> 
		</div>
	</div>
	<br>
	
	<div class='logo'>
		<a href='../user/loginComplete.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<br>
   <!-- header -->
	<div class='title'>
		<a href='cartOut.jsp' style="text-decoration:none">
			<h1>장바구니
				<span>Cart</span>
			</h1>
		</a>
	</div>
   
	   <h3 class='sub_tit'>장바구니 상품정보</h3><br>
  
	<form action='../cart/cartSelProc.jsp' method='post'>
			<%			
				request.setCharacterEncoding("utf-8");
				BookService bookService = new BookServiceImpl();
				Cookie[] cookies = request.getCookies();	
				//장바구니 리스트 불러오기
			%>
			<table class="table table-bordered">
				<thead>
					<tr style='background-color: #EFF2FB; text-align:center;'>
						<th width='40'></th>
					    <th width="110">상품</th>
					    <th width="200">상품명</th>
					    <th width="130">가격</th>
					    <th width="70">수량</th>
					</tr>
			    </thead>
			   <% 
			   int orderCnt = 0;	
				if(session.getAttribute("cart") != null ){
					List<Long> cartISBN = (List<Long>)session.getAttribute("cart");
					if(cartISBN !=null && cartISBN.size()>0){
			   %>
			    <tbody>
					<%	
					for(long ISBN:cartISBN){
						Book book = bookService.findBook(ISBN);
						pageContext.setAttribute("book", book);
						
						for(Cookie cookie : cookies)
							if(cookie.getName().equals(ISBN+""))
								orderCnt = Integer.parseInt(cookie.getValue());
								
					%>
			    	<tr>
			    		<td>
							<input type='checkbox' class='btn btn-default pull-right' 
								name='delBooks' value='<%=book.getISBN()%>' >
						</td>
			    		<td>
							<a href='../book/detailBook.jsp?ISBN=<%=book.getISBN()%>'>
								<img src='../attach/<%=bookService.readBookImgName(book.getISBN()) %>'width='80' height='100'/>
							</a>
						</td>
						<td><%=book.getBookTitle() %></td>
						<td><%=book.getBookPrice() %>원</td>
						<td><%=orderCnt%></td>						
					</tr>
		 	 <%	
							}
					}else{
%>
					<tr>
				       	<td colspan='5'>장바구니 내역이 없습니다.</td>
				    </tr>
<%									
				}
			}else{
%>
					<tr>
				       	<td colspan='5'>장바구니 내역이 없습니다.</td>
				    </tr>
		  	<%
					}
		  	%>
		
			</tbody>
		</table>
		<h3 class='sub_tit'>총결제 예정금액</h3>
		
		<table class="table table-bordered">
			<thead>
				<tr style='background-color: #EFF2FB; text-align:center;'>
				    <th width="250">상품가</th>
				    <th width="250">배송비</th>
				    <th width="250">총 결제 예정금액</th>
				</tr>
		    </thead>
		    <tbody>
		    	<tr>
		    	<%
			    	int totPrice = 0;
		    	if(session.getAttribute("cart")!=null){
		    		List<Long> cartISBN = (List<Long>)session.getAttribute("cart");
				    	for(long ISBN:cartISBN){
							Book book = bookService.findBook(ISBN);
							
				    		int bookPrice= book.getBookPrice() * orderCnt;
				    		totPrice = totPrice + bookPrice;
				    		session.setAttribute("cartTotPrice", totPrice);
		    		}
		    	%>
		    		<td><%=totPrice%>원</td>
		    		<td>무료</td>
		    		<td><%=totPrice%>원</td>
		    	</tr>
<%		    	
		    	}else{
%>
					 	<tr>
			            	<td colspan='5'>장바구니 내역이 없습니다.</td>
			        	 </tr>
<%
		    	}
%>		    	
		    </tbody>
	
		</table>
			<button type='button' class='btn btn-default btn-lg'
				onClick="location.href='../book/bookList.jsp'">도서목록</button>
				
			<button type='submit' class='btn btn-default pull-right btn-info btn-lg'
				  style='margin:0px 0px 0px 10px;'>결제</button>
				  
			<button type='submit' class='btn btn-danger pull-right btn-lg' 
				formaction='cartDelProc.jsp'>삭제</button>
		</form>
	</div>				      
</body>
</html>