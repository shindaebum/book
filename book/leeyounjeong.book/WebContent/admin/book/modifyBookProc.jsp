
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<%
	request.setCharacterEncoding("utf-8");
	BookService bookService = new BookServiceImpl();
	
	String isbn = request.getParameter("ISBN");
	String price = request.getParameter("price");
	String author = request.getParameter("author");
	String pubName = request.getParameter("pubName");
	String date = request.getParameter("pubDate");
	String bookType = request.getParameter("type");
	String bookInfo = request.getParameter("info");
	
	//System.out.printf("%s, %s, %s, %s, %s, %s, %s" , isbn,price,author,pubName, date,bookType,bookInfo);
	
		long ISBN = Long.parseLong(isbn);
		Book book = bookService.findBook(ISBN);
		
		if(book != null){
			int bookPrice= Integer.parseInt(price);
			book.setBookPrice(bookPrice);
			book.setAuthor(author);
			book.setPubName(pubName);
		
			book.setPubDate(date);
			
			book.setBookType(bookType);
			book.setBookInfo(bookInfo);
			
			bookService.modifyBook(book);
		}
 %>
<%
out.write("<script>");
out.write("alert('도서가 수정되었습니다.'); location.href='../main.jsp?action=index';");
out.write("</script>");
%>