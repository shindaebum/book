<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<%@ page import='java.util.List' %>
<%
	request.setCharacterEncoding("utf-8");
 	String orderId = (String)session.getAttribute("LoginId");

//카트
	String cartBook = request.getParameter("cartBook");
	Long cartISBN = Long.parseLong(cartBook);
	
	if(session.getAttribute("cart")== null){
		ArrayList<Long> cart = new ArrayList<>();
		cart.add(cartISBN);
		session.setAttribute("cart", cart);
	}
	else{
		ArrayList<Long> cart= (ArrayList<Long>)session.getAttribute("cart");
		cart.add(cartISBN);
		session.setAttribute("cart", cart);
	}
 	
//주문수량	
	String orderCnt = request.getParameter("orderCnt");
	
	int bookCnt = 0;
	if(!orderCnt.equals("") && Integer.parseInt(orderCnt) > 0){
		bookCnt = Integer.parseInt(request.getParameter("orderCnt"));
		
		Cookie cookie = new Cookie(cartISBN+"", Integer.toString(bookCnt));
		cookie.setPath("/");
		response.addCookie(cookie);
	}
%>	
<c:redirect url='cartOut.jsp'/>