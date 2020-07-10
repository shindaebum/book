<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>

<%
	request.setCharacterEncoding("utf-8");
	BookService bookService = new BookServiceImpl();
	String[] delBooks = request.getParameterValues("delBooks");
	
	if(delBooks !=null ){
		for(String delBook:delBooks){
			long delISBN = Long.parseLong(delBook);
		
			List<Long> cartISBN = (List<Long>)session.getAttribute("cart");
			cartISBN.remove(delISBN);
		}
%>
	<c:redirect url='cartOut.jsp'/>
<% 
	}else{

out.write("<script>");
out.write("alert('삭제할 도서를 선택해주세요.'); location.href='../cart/cartOut.jsp?action=index';");
out.write("</script>");
	}
%>
	
	