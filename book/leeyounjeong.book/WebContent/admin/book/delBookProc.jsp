<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>

<%
	request.setCharacterEncoding("utf-8");
	BookService bookService = new BookServiceImpl();

	String isbn = request.getParameter("ISBN");
	long ISBN = Long.parseLong(isbn);
	bookService.secede(ISBN);
%>	
<%
out.write("<script>");
out.write("alert('도서가 삭제되었습니다.'); location.href='../main.jsp?action=index';");
out.write("</script>");
%>