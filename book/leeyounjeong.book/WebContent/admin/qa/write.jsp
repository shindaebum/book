<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.qa.service.QaService' %>
<%@ page import='leeyounjeong.book.qa.service.QaServiceImpl' %>
<%@ page import='leeyounjeong.book.qa.domain.Qa'%>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7
	/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>	
<script>
function check(){
	if(qa.as.value == ""){
		alert("답변을 입력해 주세요.");
		qa.as.focus();
		return false;
	}
	else return true;
}

function btnsubmit(){
	document.qa.action = 'deleteProc.jsp'
	document.qa.submit();
}
</script>
<head>
<title>게시판</title>
</head>
<!-- 상단바 -->
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
<%
	request.setCharacterEncoding("utf-8");
	QaService qaService = new QaServiceImpl();
	
	String strQaNum = request.getParameter("qaNumSel");
	
	int num = 0;
	if(request.getParameter("qaNum") == null){
		num = (int)(session.getAttribute("qaNum"));
	}else{
		num = Integer.parseInt(request.getParameter("qaNum"));
	}

	Qa qa = qaService.findQa(num);
%>

<!-- 게시판 -->
<body>
<div class='container'>
<h2>고객센터</h2>
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
	<br>
<!-- 게시판 -->
	<form action='writeProc.jsp' name='qa' onsubmit='return check()'>
		<div class='row'>
			<table class='table'
				style= 'border:1px solid #dddddd'>
				<thead>
					<tr>
						<th colspan='2'
							style='background-color: #EFF2FB; text-align: center;'>게시판
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>번호</th>
						<td><%= qa.getQaNum()%></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><%= qa.getQaTitle()%></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="form-control" maxlength="2048" style="height: 200px;" readonly>
<%= qa.getQaContent()%></textarea></td>
					</tr>	
					<tr>
						<th>답변</th>
						<td><textarea class="form-control" maxlength="2048" style="height: 200px;" 
							placeholder='답변을 입력해 주세요.' name='answer' id='as'></textarea>
<%
	session.setAttribute("qaNum", qa.getQaNum());
%>
						</td>
					</tr>	
				</tbody>
			</table>
			<a href='list.jsp' class='btn btn-info pull-left'>목록</a>
			<input type='submit' class='btn btn-default pull-right' value='답변등록'/>
			<input type='button' onclick='btnsubmit()' class='btn btn-danger pull-right' style='margin-right:10px' value='삭제'/>
		</div>
	</form>
</div>
</body>
</html>