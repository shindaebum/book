<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="leeyounjeong.book.order.service.OrderService" %>
<%@ page import="leeyounjeong.book.order.service.OrderServiceImpl" %>
<%@ page import="leeyounjeong.book.order.domain.Order" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<%@ page import='java.util.*' %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>결제</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

#body{
	width: 1020px;
	margin : 0 auto 20px;
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

h3{
	float: left;
	margin-top: 5px;
	line-height: 70px;
	font-size: 30px;
}

h2{
	padding-left: 2px;
	margin-bottom: 8px;
	font-size: 20px;
}

.deli_table{
	border-top: 2px solid #BDBDBD;
	width: 100%;
	boder-color: #EFF2FB;
}

th{
	border-right: 1px solid #e4e4e4;
	border-bottom: 1px solid #e4e4e4; 
	width: 100px;
	padding : 10px 0px;
	text-align: center;
	background-color: #EFF2FB;
}

td{
	border-bottom: 1px solid #e4e4e4;
	padding : 10px 16px;
}

</style>
</head>
<body>
<div class='container'>
	<div class='area'>
			<div class='top_menu'>
				<h5>${LoginId}님, 환영합니다 !</h5>
				<a href='../user/logoutProc.jsp'>로그아웃</a> <span>|</span>
				<a href='../mypage/mypage.jsp'>마이페이지</a> <span>|</span>
				<a href='../cart/cartOut.jsp'>장바구니</a> <span>|</span>
				<a href='../qa/list.jsp'>고객센터</a> 
			</div>
		</div>
		<br><br>
		
		<!-- 로고 -->	
	<div class='logo'>
		<a href='../user/loginComplete.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<br>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	OrderService orderService = new OrderServiceImpl();
	Cookie[] cookies = request.getCookies();
	
	String userId = (String)session.getAttribute("LoginId");
	
	User user = new User();
	user = userService.findUser(userId);	
%>	
	
	<div id='body'>
		<!-- header -->
		<div class='title'>
			<a href='#' style="text-decoration:none">
				<h1>결제
				<span>Payment</span>
				</h1>
			</a>
		</div><br><br>
<%		
		List<Book> cartBooks = (List<Book>)session.getAttribute("selCart"); //선택한 도서
		
		if(cartBooks != null && cartBooks.size() > 0){
%>		
		<form action='cartOrderProc.jsp' method='post'>
		
		<!-- body -->
		<div style='margin-top: 30px;'>
			<h2>배송 정보</h2>
			<table class='deli_table'>
				<tbody style='vertical-align: middle'>
					<tr>
						<th class="col-md-2">이름</th>
						<td><%= user.getUserName() %></td>
					</tr>
					<tr>
						<th class="col-md-2">주소</th>
						<td><%= user.getAddress() %></td>
					</tr>
					<tr>
						<th class="col-md-2">전화 번호</th>
						<td><%= user.getPhoneNum() %></td>
					</tr>
					<tr>
						<th class="col-md-2">요청 사항</th>
						<td>					
							<select class="form-control" name='req'>
								<option selected>배송 시 요청 사항 (선택)</option>
								<option value="부재 시 문 앞에 놔주세요.">부재 시 문 앞에 놔주세요.</option>
								<option value="부재 시 경비실에 맡겨주세요.">부재 시 경비실에 맡겨주세요.</option>
								<option value="배송 전 문자 주세요.">배송 전 문자 주세요.</option>
							</select>												
						</td>
					</tr>
				</tbody>
			</table>			
		</div>
		
		<div style='margin-top: 30px;'>
			<h2>주문 상품 정보</h2>
			<table class='deli_table'>
		      <thead>
		         <tr>
		         	<th class="col-md-3">책 이미지</th>
		            <th class="col-md-5">상품 정보</th>			            
		         </tr>            
		      </thead>
		      <tbody>
<%
				BookService bookService = new BookServiceImpl();	
			
				List<Long> cart = (List<Long>)session.getAttribute("cart"); //장바구니 도서의 ISBN
				
				
				int orderCnt = 0;
				
				/* if(cart != null){
					for(long ISBN:cart){
						Book book = bookService.findBook(ISBN);
						cartBooks.add(book);		
					}		
					//session.setAttribute("cartBooks", cartBooks);		
				} */
				
				
				for(Book book : cartBooks){
					for(Cookie cookie : cookies){
						if(cookie.getName().equals(book.getISBN()+""))
							orderCnt = Integer.parseInt(cookie.getValue());
					}
%>
		         <tr style='text-align:center; padding:10px 0px;'>
		         	<td><img src='../attach/<%=bookService.readBookImgName(book.getISBN()) %>' width='200' height='150' class="img-rounded"></td>
		            <td style='text-align:left'>
		               <ul class='list-unstyled' id='info'>
		                  <li><%= book.getPubName() %></li>
		                  <li><strong style='font-size: 16px'><%= book.getBookTitle() %></strong></li>
		                  <li><small style='color:#777777'>수량 : <%= orderCnt %>개</small></li>
                          <li><small style='color:#777777'>가격 : <%= book.getBookPrice() %>원</small></li>
		               </ul>
		            </td>
		         </tr>
<%
			}
%>
		      </tbody>
		   	</table>
		</div>
<%
			int totPrice = 0;

			for(Book book : cartBooks){
				int bookPrice = book.getBookPrice() * orderCnt;
				
				totPrice = totPrice + bookPrice;
			}
%>		

		<div style='margin-top: 30px;'>
			<h2>결제 정보</h2>
			<table class='deli_table'>
				<tbody style='vertical-align: middle'>
					<tr>
						<th class="col-md-2">상품 가격</th>
						<td><%= totPrice %>원</td>
					</tr>
					<tr>
						<th class="col-md-2">배송비</th>
						<td>무료</td>
					</tr>
					<tr>
						<th class="col-md-2">총 결제 금액</th>
						<td><%=totPrice %>원</td>
					</tr>
					<tr>
						<th class="col-md-2">결제 방법</th>
						<td>
							<label class="radio-inline">
							  <input type="radio" name="pay" value="신용카드(일반)" required> 신용카드(일반)
							</label>
							<label class="radio-inline">
							  <input type="radio" name="pay" value="휴대폰 결제"> 휴대폰 결제
							</label>
							<label class="radio-inline">
							  <input type="radio" name="pay" value="카카오 페이"> 카카오 페이
							</label>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		
		<!-- footer -->
		<div style='margin-top: 40px;'>
			<p>
  				<button type='submit' class="btn btn-lg btn-block btn-info">결제하기</button>
  			</p>
		</div>	
	</form>
<%
		}
%>
	</div>
</div>
</body>
</html>