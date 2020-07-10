<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<%@ page import='leeyounjeong.book.book.domain.BookImg' %>
<%
//이미지 추가
	BookImg bookImg = new BookImg();
	
	String attachPath = "/attach";
	int fileMaxSize = 5 * 1024 * 1024;
	String enctype = "utf-8";
	
	ServletContext ctx = getServletContext();
	attachPath = ctx.getRealPath(attachPath);
	request.setCharacterEncoding("utf-8");
	MultipartRequest mRequest = null;
	
	try {
		mRequest = new MultipartRequest(request, attachPath, fileMaxSize, enctype,
				new DefaultFileRenamePolicy());
	} catch (IOException e) {
		throw e;
	}
	
	String bookImgName = mRequest.getFilesystemName("imgName");
	request.setAttribute("attachName", bookImgName);

	
//도서추가
	request.setCharacterEncoding("utf-8");
	BookService bookService = new BookServiceImpl();

	String isbn = mRequest.getParameter("ISBN");
	String bookTitle = mRequest.getParameter("title");
	String price = mRequest.getParameter("price");
	String author = mRequest.getParameter("author");
	String pubName = mRequest.getParameter("pubName");
	String date = mRequest.getParameter("pubDate");
	String bookType = mRequest.getParameter("type");
	String bookInfo = mRequest.getParameter("info");
	
	
	Book book = new Book();
	long ISBN=Long.parseLong(isbn);
	book.setISBN(ISBN);
	
	book.setBookTitle(bookTitle);
	
	int bookPrice= Integer.parseInt(price);
	book.setBookPrice(bookPrice);
	
	book.setAuthor(author);
	
	book.setPubName(pubName);
	
	//SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
	//String time1 = format1.format(date);
	//java.util.Date utilDate = new java.util.Date(time1);
	//java.sql.Date pubDate = new java.sql.Date(utilDate.getTime());
	//java.sql.Date pubDate = java.sql.Date.valueOf(date);
	//String date2 = date.substring(0, 10);
	//java.sql.Date pubDate = java.sql.Date.valueOf(date);
	//System.out.println(date);
	book.setPubDate(date);
	
	book.setBookType(bookType);
	book.setBookInfo(bookInfo);
	
	bookService.regBook(book);			//책추가
	
	
	bookImg.setISBN(ISBN);
	bookImg.setBookImgName(bookImgName);
	bookService.regBookImg(bookImg);	//이미지 추가
%>
<%
out.write("<script>");
out.write("alert('도서가 추가되었습니다.'); location.href='addBook.jsp?action=index';");
out.write("</script>");
%>