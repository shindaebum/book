<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>Main</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	
	th,table{
		text-align: center;
	}
	
	.pagination{
		display:block;
		text-align: center; 
	}
	
	.pagination > li> a{
		float: none;
	}
</style>

</head>
<body>
<br>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<a href='../main.jsp'>메인으로</a>
		</div>
	</div>
	<br>
	
	<div class='logo'>
		<a href='../main.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<hr style='border:1px solid silver;' width='100%'>
	
	<ul class='nav nav-tabs'>
		<li><a href='../main.jsp'>도서 관리</a></li>
		<li class='active'><a href='userManage.jsp'>회원 관리</a></li>
		<li><a href='../qa/list.jsp'>문의 관리</a></li>
	</ul>

<%
	request.setCharacterEncoding("utf-8");
	int currentPage;
	if(request.getParameter("currentPage")==null)
	 	currentPage = 1;
	else
	 	currentPage = Integer.parseInt(request.getParameter("currentPage"));
	
	UserService userService = new UserServiceImpl();
	
	List<User> users = userService.listUsers();
	
%>	
	<form action="userDelProc.jsp">	
	<table class='table table-striped'>
		<thead>
			<tr>
				<th></th>
				<th>회원아이디</th>
				<th>회원이름</th>
				<th>비밀번호</th>
				<th>핸드폰 번호</th>
				<th>배송지</th>
				<th>가입일</th>
			</tr>
		</thead>
<%		
		int endPage = (int)(Math.ceil(currentPage/5.0)*5);
		int startPage = (endPage-5)+1;
		int lastEndPage = (int)(Math.ceil(users.size()/10.0));
		int startRow = (currentPage - 1) * 10;
		int endRow = currentPage * 10;
		
		if(endPage > lastEndPage) endPage = lastEndPage;
		
		boolean prev = startPage == 1 ? false:true;
		boolean next = endPage * 10 >= users.size() ? false:true;
		
		if(users.size()!=0){
			 if(lastEndPage != currentPage){
				 users = users.subList(startRow, endRow);
		     }else{
		    	 users = users.subList(startRow, users.size());
		        }
		}else{
	%>
		<tr>
			<td colspan='6' style='text-align: center'>회원이 없습니다.</td>
		</tr>
	<%
		}
		
		if(users != null && users.size()>0){
			request.setAttribute("users", users);
%>			
			<tbody id = "userList">
<%			
			for(User user : users){
	%>			
					<tr>
						<td>
							<input type="radio" name="userIdSel" value="<%= user.getUserId() %>"/>
						</td>
						<td><%= user.getUserId() %></td>
						<td><%= user.getUserName() %></td>
						<td><%= user.getUserPwd() %></td>
						<td><%= user.getPhoneNum() %></td>
						<td><%= user.getAddress() %></td>
						<td><%= user.getRegDate() %></td>
					</tr>
					
	<%			
			}
		}else{
			%>
			<tr>
				<td colspan='6' style='text-align: center'>회원이 없습니다.</td>
			</tr>
		<%
			}
%>
		</tbody>	
	</table>
	<hr>

		<span style='float:right'><button type='submit' 
			class='btn btn-danger' >회원삭제</button></span>
		
		<!-- paging -->
		<nav aria-label="Page navigation example">
           <ul class="pagination">
          <%
             if(prev) {
          %>
             <li class="page-item"><a class="page-link" aria-label="Previous" href="userManage.jsp?currentPage=<%= startPage - 1 %>"><span aria-hidden="true">&laquo;</span></a></li>
          <%
             }
              for(int i=startPage; i<=endPage; i++) { %>
             <li class="page-item">
                <a class="page-link" href="userManage.jsp?currentPage=<%= i %>"><%= i %></a>
             </li>
          <%
             }
             if(next) {
          %>
             <li class="page-item"><a class="page-link" aria-label="Next" href="userManage.jsp?currentPage=<%= endPage + 1 %>"><span aria-hidden="true">&raquo;</span></a></li>
          <% 
             }
          %>
          </ul>
        </nav>	
	</form>
	<br><br>
</div>
</body>
</html>