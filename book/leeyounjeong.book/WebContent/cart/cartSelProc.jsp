<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<%@page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
	BookService bookService = new BookServiceImpl();
	String[] selBooks = request.getParameterValues("delBooks");
	
	if(selBooks !=null ){
		List<Book> selCart = new ArrayList<>();
		
		for(String selBook:selBooks){
			long selISBN = Long.parseLong(selBook);
			Book book = bookService.findBook(selISBN);
			selCart.add(book);
			
			session.setAttribute("selCart", selCart);
		}
%>
	<c:redirect url='../order/cartOrder.jsp'/>
<% 
	}else{
out.write("<script>");
out.write("alert('결제할 도서를 선택해주세요.'); location.href='../cart/cartOut.jsp?action=index';");
out.write("</script>");
}
%>	
