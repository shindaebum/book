<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="leeyounjeong.book.order.domain.Order" %>
<%@ page import="leeyounjeong.book.order.service.OrderService" %>
<%@ page import="leeyounjeong.book.order.service.OrderServiceImpl" %>
<%@ page import="leeyounjeong.book.delivery.domain.Delivery" %>
<%@ page import="leeyounjeong.book.delivery.service.DeliveryService" %>
<%@ page import="leeyounjeong.book.delivery.service.DeliveryServiceImpl" %>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<%@ page import='java.lang.Math' %>
<%@ page import= 'java.text.SimpleDateFormat' %>
<%@ page import='java.util.Date' %>
<%@ page import="java.util.*" %>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>주문 내역</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

.title{
   padding: 10 0 0 10px;
   border-bottom: 1.5px solid #424242;
   letter-spacing: -0.07em
}

h1{
   font-size: 32px;
   color: #000;
   line-height: 1;
   font-family: 'Montserrat', 'Noto Sans KR', Verdana, Dotum, AppleGothic, sans-serif;
}

.sub_tit{
   font-size: 18px;
   border-bottom: 1px solid #0B2161;
   border-left: 5px solid #0B2161;
   padding-top: 2px;
   padding-bottom: 5px;
   padding-left: 10px;
   letter-spacing: -0.07em;
   line-height: 30px;
}

.title span{
   font-size: 21px;
   color: #d2d2d2;
   font-weight: 500;
   letter-spacing: 0em;
   margin-left: 3px;
}

#tb th{
    height: 48px;
    border-bottom: 1px solid #000000;
    vertical-align: middle;
    text-align: center;
}

#tb td{
   vertical-align: middle;
   text-align: center;
}

#deli_btn{
   font-size: 12px;
   height: 32px;
   line-height: 30px;
   padding-top: 0;
   border: 1px solid #e5e5e5;
   color: #000000;
   width: 80px;
   margin: 4px auto;
}
</style>
</head>
<body>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<h5><%= session.getAttribute("LoginId") %>님, 환영합니다 !</h5>
			<a href='../main.jsp'>로그아웃</a> <span>|</span>
			<a href='../mypage/mypage.jsp'>마이페이지</a> <span>|</span>
			<a href='../cart/cartOut.jsp'>장바구니</a> <span>|</span>
			<a href='../qa/list.jsp'>고객센터</a> 
		</div>
	</div>
	<br>
<!-- 로고 -->	
	<div class='logo'>
		<a href='../user/loginComplete.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<br>
   <!-- header -->
   <div class='title'>
      <a href='../mypage/mypage.jsp' style="text-decoration:none">
	      <h1>마이페이지
	      <span>MyPage</span>
	      </h1>
	  </a>
   </div>

   <!-- nav -->
	<nav class='navbar navbar-default' style='background-color:#0B2161'>
	<div class='container-fluid'>
		<ul class='nav navbar-nav'>
			<li><a style='color:#FFFFFF' href='../order/orderOut.jsp'>전체 주문 내역</a></li>
			<li><a style='color:#FFFFFF' href='../qa/myQa.jsp'>내가 쓴 글</a></li>
			<li><a style='color:#FFFFFF' href='../user/userManage.jsp'>회원 정보 관리</a></li>
		</ul>			
	</div>
	</nav>
	
	<h3 class='sub_tit'>주문 내역</h3>
   
    <table class='table table-hover' id='tb' style='text-align:center'>
      <thead style='background-color :#EFF2FB'>
         <tr>
            <th class="col-md-2">주문 날짜</th>
            <th class="col-md-2">주문 번호</th>
            <th class="col-md-3">상품 정보</th>
            <th class="col-md-3">운송장 번호</th>
            <th class="col-md-2">배송 상태</th>
         </tr>            
      </thead>
      <tbody>
<%
		String userId = (String)session.getAttribute("LoginId");
		
		OrderService orderService = new OrderServiceImpl();
		BookService bookService = new BookServiceImpl();
		DeliveryService deliveryService = new DeliveryServiceImpl();
		
		List<Order> orders = orderService.listOrders(); //모든 주문 내역
		List<Order> userOrders = new ArrayList<>(); //로그인한 회원 주문 내역
		List<Delivery> deliveries = deliveryService.listDeliveries(); //모든 배송 내역
		
		
		if(orders != null && orders.size()>0){
			for(Order order : orders) {
				if(userId.equals(order.getUserId())){
					userOrders.add(order);
				}
			}
		}

		Delivery delivery = new Delivery();
		
		if(userOrders != null && userOrders.size()>0){
			for(Order order : userOrders){				
				Book book = bookService.findBook(order.getISBN());
				delivery = deliveryService.findDelivery(order.getDeliveryNum());
				
				//System.out.println(order);
%>
         <tr>
            <td><%= order.getOrderDate() %></td>
            <td><%= order.getOrderNum() %></td>
            <td style='text-align:left'>
               <ul class='list-unstyled' id='info'>
                  <li><%= book.getPubName() %></li>
                  <li><strong style='font-size: 16px'><%= book.getBookTitle() %></strong></li>
               </ul>
            </td>
            <td><%= delivery.getDeliveryNum() %></td>
            <td><span style='color: #5882FA;'>배송 중</span><br><br>
               <a href='https://www.cjlogistics.com/ko/tool/parcel/tracking' class='btn btn-sm btn-default' id='deli_btn' target='_blank'>택배사 이동</a>
            </td>
         </tr>
<%
			}
		}else{
%>
			<tr>
            	<td colspan='6'>주문 내역이 없습니다.</td>
        	 </tr>
<%
		}
%>      
      </tbody>
   </table> 
</div>