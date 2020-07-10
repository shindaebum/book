<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import= 'java.text.SimpleDateFormat' %>
<%@ page import='java.util.Date' %>
<%@ page import="leeyounjeong.book.order.domain.Order" %>
<%@ page import="leeyounjeong.book.order.service.OrderService" %>
<%@ page import="leeyounjeong.book.order.service.OrderServiceImpl" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<%@ page import='leeyounjeong.book.delivery.service.DeliveryService' %>
<%@ page import='leeyounjeong.book.delivery.service.DeliveryServiceImpl' %>
<%@ page import='leeyounjeong.book.delivery.domain.Delivery' %>
<%@ page import='java.lang.Math' %>
<%@ page import='java.util.*' %>
<%
	request.setCharacterEncoding("utf-8");
	
	UserService userService = new UserServiceImpl();
	OrderService orderService = new OrderServiceImpl();	
	DeliveryService deliveryService = new DeliveryServiceImpl();
	
	Cookie[] cookies = request.getCookies();
	String userId = (String)session.getAttribute("LoginId");
	
	User user = new User();
	user = userService.findUser(userId);	// 로그인한 유저
		
	List<Book> cartBooks = (List<Book>)session.getAttribute("selCart"); //주문한 책
	
	int orderCnt = 0; //주문수량
		
	//지불방식, 요청 값 받기
	String orderPay = request.getParameter("pay");
	String orderReq = request.getParameter("req");
	
	
	//order에 넣는 거
	if(orderPay != null){
		for(Book book : cartBooks){
			for(Cookie cookie : cookies)
				if(cookie.getName().equals(book.getISBN()+""))
					orderCnt = Integer.parseInt(cookie.getValue());
							
			Order order = new Order();
			Delivery delivery = new Delivery();
			
			long ISBN = book.getISBN();
			order.setISBN(ISBN);
			order.setOrderCnt(orderCnt);
			order.setUserId(userId);
			order.setOrderPay(orderPay);
			order.setOrderReq(orderReq);
			session.setAttribute("orderCnt", orderCnt);
			//System.out.println(orderCnt);
			//주문 번호
			Date now = new Date();
			SimpleDateFormat vans = new SimpleDateFormat("yyyyMMdd");
			String date = vans.format(now);
			
			String key = "";
			
			int a[] = new int[4];
		    Random r = new Random();
		    for(int i=0;i<4;i++) 
		    {
		        a[i] = r.nextInt(10)+1; 
		        for(int j=0;j<i;j++)
		        {
		            if(a[i]==a[j])  
		            {
		                i--;
		            }
		        }
		    }
		    for(int k=0;k<a.length-1;k++) 
		    {
		    	key = key + a[k] + "";
			}

			String orderNum = "O" + date + key;
			//운송장번호
			String deliveryNum = "D" + date + key;
			
			session.setAttribute("orderNum", orderNum);
			session.setAttribute("deliveryNum", deliveryNum);
						
			delivery.setDeliveryNum(deliveryNum);
			deliveryService.join(delivery);
			
			order.setOrderNum(orderNum);
			order.setDeliveryNum(deliveryNum);
			orderService.join(order);
		}		
%>
		<c:redirect url='cartOrderComplete.jsp'/>		
<%
	}else{
%>
	<c:redirect url='order.jsp'/>
<%
	}
%>


