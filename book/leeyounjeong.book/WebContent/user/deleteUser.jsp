<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	
	String c = request.getParameter("msg3");
	if(c == null) c = "";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>BoB</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<script src="http:/code.jquery.com/jquery-3.1.1.min.js"></script>
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

.title{
   padding: 10 0 0 10px;
   border-bottom: 1.5px solid #424242;
   letter-spacing: -0.07em
}

h1{
   font-size: 32px;
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

.sub_tit{
   font-size: 18px;
   border-bottom: 1px solid #0B2161;
   border-left: 5px solid #0B2161;
   padding-top: 2px;
   padding-bottom: 5px;
   padding-left: 10px;
   letter-spacing: -0.07em;
   line-height: 30px;
}

#more{
   color: #6E6E6E;
   float: right;
   padding: 5px 10px;
   font-size:14px;
}

#tb th{
    height: 48px;
    border-bottom: 1px solid #000000;
    vertical-align: middle;
    text-align: center;
}

#tb td{
   vertical-align: middle;
   text-align: center;
}

#deli_btn{
   font-size: 12px;
   height: 32px;
   line-height: 30px;
   padding-top: 0;
   border: 1px solid #e5e5e5;
   color: #000000;
   width: 80px;
   margin: 4px auto;
}   

.terms_content{
	border: 1px solid #e5e5e5;
	margin-left: 6px;
}
.terms_check{
	border: 1px solid #e5e5e5; 
	margin-left: 6px;
}
.form-group{
	margin-left: 20px;
}
.
</style>
</head>
<body>
<div class="container">
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
		<a href='loginComplete.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
	</div>
	<br>
 <!-- header -->
   <div class='title'>
      <a href='../mypage/mypage.jsp' style="text-decoration:none">
	      <h1>마이페이지
	      <span>MyPage</span>
	      </h1>
	  </a>
   </div>
   
   <!-- nav -->
	<nav class='navbar navbar-default' style='background-color:#0B2161'>
	<div class='container-fluid'>
		<ul class='nav navbar-nav'>
			<li><a style='color:#FFFFFF' href='../order/orderOut.jsp'>전체 주문 내역</a></li>
			<li><a style='color:#FFFFFF' href='../qa/myQa.jsp'>내가 쓴 글</a></li>
			<li><a style='color:#FFFFFF' href='userManage.jsp'>회원 정보 관리</a></li>
		</ul>			
	</div>
	</nav>
	
	<ul class="nav nav-tabs nav-justified" style="color: black; ">
		<li><a href='userManage.jsp'>회원수정</a></li>
		<li><a href='deleteUser.jsp'>회원탈퇴</a></li>
	</ul>
	
	<div class='secede_context' style='margin-left:15px;'>
		<h4 style="font-size: 17px;">아래 내용을 꼭 확인해주세요.</h4>
	<div class="main-section">
		<div>
			<div class="container">
				<div class="terms_content" style="margin:0 0 auto; width:90%;">
					<div class="content" style="margin: 5px;">
						<p class="jb-bold" style='font-size: 16px'><strong>회원정보 및 계좌내역 삭제</strong></p>
							<div class="content1" style="margin: 10px ;">
								<p>회원 탈퇴 즉시 회원정보는 모두 삭제되며, 재가입시에도 복원되지 않습니다.</p>
								<p>● 삭제되는 정보:구매하신 도서정보,개인정보.</p>
								<p>● 회원탈퇴 시 회원으로 서비스 이용이 불가합니다.</p>
								<p>● 탈퇴 후 계정과 연결된 이용기록(ex.상품리뷰)은 모두 삭제되며,삭제된 데이터는 복구되지 않습니다.</p>
								<p>● 게시판형 서비스에 등록한 게시물은 삭제되지 않고 유지됩니다.</p>
							</div>
						<p class="jb-bold" style='font-size:16px'><strong>1개월간 회원 재가입 제한</strong></p>
							<div class="content2" style="margin: 10px;">
								<p>● 회원탈퇴 후,1개월 간은 회원 재가입이 불가능합니다.</p>
							</div>
						<p class="jb-bold" style='font-size:16px'><strong>문의사항은 1:1문의를 이용하시길 바랍니다.</strong></p>
					</div>
				</div>
				<br>
				<div class="terms_check" style="margin:0 0 auto; width:90%;">
					<div class="form-group">
						<br>
						<div>
						<form action="delUserProc.jsp" method="post">
							<div class="form-group">
								<input type="radio" name="agree" required> 위 정책을 확인하였으며, 내용에 동의합니다.<br><br>
								<div>
									<input type="password" class="form-control" name="deletePwd" style="width:250px;" placeholder="비밀번호 입력" autofocus required><%= c %><br>
									<button type="submit" class="btn btn-default" data-target='#addUserModal' data-toggle='modal'>탈퇴하기</button>
								</div>
								
							</div>	
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</div>
</body>
</html>
