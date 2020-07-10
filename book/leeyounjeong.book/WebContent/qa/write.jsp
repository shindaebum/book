<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
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
	if(qa.title.value == ""){
		alert("제목을 입력해 주세요.");
		qa.title.focus();
		return false;
	}
	else if(qa.content.value == ""){
		alert("내용을 입력해 주세요.");
		qa.content.focus();
		return false;
	}
	else return true;
}
</script>
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
	
	.title{
	   padding: 10 0 0 10px;
	   border-bottom: 1.5px solid #0B2161;
	   letter-spacing: -0.07em
	}
	
	h1{
	   font-size: 32px;
	   padding-left: 20px;
	   color: #000;
	   line-height: 1;
	   font-family: 'Montserrat', 'Noto Sans KR', Verdana, Dotum, AppleGothic, sans-serif;
	}
	
	.title span{
	   font-size: 21px;
	   color: #d2d2d2;
	   font-weight: 500;
	   letter-spacing: 0em;
	   margin-left: 3px;
	}
</style>
<!-- 상단바 -->


<!-- 게시판 -->
<body>
<div class='container'>
<div class='area'>
		<div class='top_menu'>
			<h5><%= session.getAttribute("LoginId") %>님, 환영합니다 !</h5>
			<a href='../main.jsp'>로그아웃</a> <span>|</span>
			<a href='../mypage/mypage.jsp'>마이페이지</a> <span>|</span>
			<a href='../cart/cartOut.jsp'>장바구니</a> <span>|</span>
			<a href='../qa/list.jsp'>고객센터</a> 
		</div>
	</div>
	<br>
	<!-- 로고 -->
	<div class='logo'>
		<a href='../user/loginComplete.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<br>
   <!-- header -->
	<div class='title'>
		<a href='#' style="text-decoration:none">
			<h1>고객센터
			<span>Q&A</span>
			</h1>
		</a>
	</div> <br><br>
	<div class='row'>
		<form method='post' action='writeProc.jsp' name='qa' onsubmit='return check()'>
			<table class='table table-striped'
				style='text-align: center; border:1px solid #dddddd'>
				<thead>
					<tr>
						<th colspan='2'
							style='background-color: #EFF2FB; text-align: center;'>게시판
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th class="table-active">제목</th>
						<td><input type='text' class='form-control' placeholder="제목" 
						maxlength="50" name="qaTitle" id='title'/></td>
					</tr>
					<tr>
						<th class="table-active">내용</th>
						<td><textarea class="form-control" placeholder="내용을 작성하세요" 
							maxlength="2048" name="qaContent" id='content' style="height: 350px;"></textarea></td>
					</tr>		
				</tbody>
			</table>
			<a href='list.jsp' class='btn btn-info pull-left'>목록</a>
			<button type='submit' class='btn btn-default pull-right'>등록</button>
		</form>
	</div>
</div>
</body>
</html>