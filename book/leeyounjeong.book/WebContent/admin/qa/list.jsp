<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.qa.service.QaService' %>
<%@ page import='leeyounjeong.book.qa.service.QaServiceImpl' %>
<%@ page import='leeyounjeong.book.qa.domain.Qa'%>
<%@ page import="java.util.List" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	int currentPage;
	if(request.getParameter("currentPage")==null)
	 	currentPage = 1;
	else
	 	currentPage = Integer.parseInt(request.getParameter("currentPage"));
%>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7
	/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<head>
<title>게시판</title>
</head>
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
	
	.pagination{
		display:block;
		text-align: center;
	}
	
	.pagination > li> a{
		float: none;
	}

</style>
<body>
<div class='container'>
<br>
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
		<li><a href='../user/userManage.jsp'>회원 관리</a></li>
		<li class='active'><a href='list.jsp'>문의 관리</a></li>
	</ul>

	
	<!-- 게시판 -->
		
	<form action='write.jsp'> 
		<table class='table table-striped'>
			<thead>
				<tr>
					<th width='73'>번호</th>
					<th width='379'>제목</th>
					<th width='73'>작성자</th>
					<th width='164'>날짜</th>
					<th width='73'>답변여부</th>
					<th></th>
				</tr>
			</thead>
<%
	QaService qaService = new QaServiceImpl();
	List<Qa> qas = qaService.listQas();
	int endPage = (int)(Math.ceil(currentPage/5.0)*5);
	int startPage = (endPage-5)+1;
	int lastEndPage = (int)(Math.ceil(qas.size()/10.0));
	int startRow = (currentPage - 1) * 10;
	int endRow = currentPage * 10;
	
	if(endPage > lastEndPage) endPage = lastEndPage;
	
	boolean prev = startPage == 1 ? false:true;
	boolean next = endPage * 10 >= qas.size() ? false:true;
	
	if(qas.size()!=0){
		 if(lastEndPage != currentPage){
			 qas = qas.subList(startRow, endRow);
	     }else{
	    	 qas = qas.subList(startRow, qas.size());
	        }
	}else{
	%>
		<tr>
			<td colspan='6' style='text-align: center'>문의 내역이 없습니다.</td>
		</tr>
	<%
	}

	session.setAttribute("qaNum", null);
	
	String b = request.getParameter("msg2");
	if(b == null) b = "";
	
	if(qas != null && qas.size()>0){
		request.setAttribute("qas", qas);
%>
			<tbody id = "userList">
<%		
		for(Qa qa : qas){
%>			
				<tr>
					<td><%= qa.getQaNum() %></td>
					<td><%= qa.getQaTitle() %></td>
					<td><%= qa.getUserId() %></td>
					<td><%= qa.getQaDate() %></td>
					<td><%= qa.getQaAnswer() %></td>
					<td><input type='button' class='btn btn-default pull-right'
						onclick="location.href='write.jsp?qaNum=<%=qa.getQaNum()%>'" value='글 보기'/>
				</tr>				
<%		
		}
		}else{
	
%>
			<tr>
            	<td colspan='6' style='text-align: center'>문의 내역이 없습니다.</td>
        	 </tr>
<%
	}
%>
		</tbody>	
		</table>
		<!-- paging -->
		<nav aria-label="Page navigation example">
           <ul class="pagination">
          <%
             if(prev) {
          %>
             <li class="page-item"><a class="page-link" aria-label="Previous" href="list.jsp?currentPage=<%= startPage - 1 %>"><span aria-hidden="true">&laquo;</span></a></li>
          <%
             }
              for(int i=startPage; i<=endPage; i++) { %>
             <li class="page-item">
                <a class="page-link" href="list.jsp?currentPage=<%= i %>"><%= i %></a>
             </li>
          <%
             }
             if(next) {
          %>
             <li class="page-item"><a class="page-link" aria-label="Next" href="list.jsp?currentPage=<%= endPage + 1 %>"><span aria-hidden="true">&raquo;</span></a></li>
          <% 
             }
          %>
          </ul>
        </nav>
	</form>
	</div>
</body>
</html>