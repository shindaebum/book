<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import='leeyounjeong.book.book.service.BookService' %>
<%@ page import='leeyounjeong.book.book.service.BookServiceImpl' %>
<%@ page import='leeyounjeong.book.book.domain.Book' %>
<%
	request.setCharacterEncoding("UTF-8");

	int currentPage;
	if(request.getParameter("currentPage")==null)
	 	currentPage = 1;
	else
	 	currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>BoB</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	
	th,table{
		text-align: center;
	}
	
</style>
</head>
<body>
<br>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<a href='../main.jsp'>로그아웃</a>
		</div>
	</div>
	<br>      
	
	<div class='logo'>
		<a href='main.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<hr style='border:1px solid silver;' width='100%'>
	
	<ul class='nav nav-tabs'>
		<li class='active'><a href='main.jsp'>도서 관리</a></li>
		<li><a href='../admin/user/userManage.jsp'>회원 관리</a></li>
		<li><a href='../admin/qa/list.jsp'>문의 관리</a></li>
	</ul>
	
	
	<table class='table table-striped'>
		<thead>
			<tr>
				<th>ISBN</th>
				<th>제목</th>
				<th >장르</th>
				<th>가격</th>
				<th>저자명</th>
				<th>출판사명</th>
				<th>출판일</th>
				<th>상세보기</th>
			</tr>
		</thead>
		<tbody>
			<%
				BookService bookService = new BookServiceImpl();
				List<Book> books = bookService.listBooks();
				
				int endPage = (int)(Math.ceil(currentPage/5.0)*5);
				int startPage = (endPage-5)+1;
				int lastEndPage = (int)(Math.ceil(books.size()/10.0));
				int startRow = (currentPage - 1) * 10;
				int endRow = currentPage * 10;
				
				if(endPage > lastEndPage) endPage = lastEndPage;
				
				boolean prev = startPage == 1 ? false:true;
				boolean next = endPage * 10 >= books.size() ? false:true;
				
				if(books.size()!=0){
					 if(lastEndPage != currentPage){
						 books = books.subList(startRow, endRow);
				     }else{
				    	 books = books.subList(startRow, books.size());
				        }
				}else{
				%>
					<tr>
						<td colspan='8' style='text-align: center'>도서가 없습니다.</td>
					</tr>
				<%
				}
				if (books != null && books.size() > 0) {
					pageContext.setAttribute("books", books);
				
			%>
				<c:forEach var='book' items='${books}'>
			<tr>
				<td>${book.ISBN}</td>
				<td>${book.bookTitle}</td>
				<td>${book.bookType}</td>
				<td>${book.bookPrice}</td>
				<td>${book.author}</td>
				<td>${book.pubName}</td>
				<td>${book.pubDate}</td>
				<td><a href='./book/detailBook.jsp?ISBN=${book.ISBN}'>보기</a></td>
			</tr>
				</c:forEach>
			<%
				}
			%>
		</tbody>
	</table>
	<hr>
	
	<form>
		<span style='float:right'><button type='button' 
			class='btn btn-info' onClick="location.href='./book/addBook.jsp'">도서 추가</button></span>
		
		<!-- paging -->
		<nav aria-label="Page navigation example">
           <ul class="pagination">
          <%
             if(prev) {
          %>
             <li class="page-item"><a class="page-link" aria-label="Previous" href="main.jsp?currentPage=<%= startPage - 1 %>"><span aria-hidden="true">&laquo;</span></a></li>
          <%
             }
              for(int i=startPage; i<=endPage; i++) { %>
             <li class="page-item">
                <a class="page-link" href="main.jsp?currentPage=<%= i %>"><%= i %></a>
             </li>
          <%
             }
             if(next) {
          %>
             <li class="page-item"><a class="page-link" aria-label="Next" href="main.jsp?currentPage=<%= endPage + 1 %>"><span aria-hidden="true">&raquo;</span></a></li>
          <% 
             }
          %>
          </ul>
        </nav>	
	</form>
</div>
</body>
</html>