<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import='leeyounjeong.book.qa.service.QaService' %>
<%@ page import='leeyounjeong.book.qa.service.QaServiceImpl' %>
<%@ page import='leeyounjeong.book.qa.domain.Qa'%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<title>내가 쓴 글</title>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	
	.sub_tit{
	   font-size: 18px;
	   border-bottom: 1px solid #747474;
	   border-left: 5px solid #747474;
	   padding-top: 2px;
	   padding-bottom: 5px;
	   padding-left: 10px;
	   letter-spacing: -0.07em;
	   line-height: 30px;
	}
	
	.title span{
	   font-size: 21px;
	   color: #d2d2d2;
	   font-weight: 500;
	   letter-spacing: 0em;
	   margin-left: 3px;
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
</style>
</head>
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
			<li><a style='color:#FFFFFF' href='myQa.jsp'>내가 쓴 글</a></li>
			<li><a style='color:#FFFFFF' href='../user/userManage.jsp'>회원 정보 관리</a></li>
		</ul>			
	</div>
	</nav>
	
	<h3 class='sub_tit'>문의 내역</h3>
   <table class='table table-hover' id='tb' style='text-align:center'>
      <thead style='background-color :#EFF2FB'>
         <tr>
            <th class="col-md-2">문의 번호</th>
            <th class="col-md-2">문의 날짜</th>
            <th class="col-md-5">문의 제목</th>
            <th class="col-md-3">문의 상태</th>
            <th></th>
         </tr>            
      </thead>
      <tbody>
<%
		String userId = (String)session.getAttribute("LoginId");
		
		QaService qaService = new QaServiceImpl();		
		
		List<Qa> qas = qaService.listQas(); //모든 문의내역
		List<Qa> userQas = new ArrayList<>();
		
		if(qas != null && qas.size()>0){
			for(Qa qa : qas) {
				if(userId.equals(qa.getUserId())){
					userQas.add(qa);
				}
			}
		}
		
		if(userQas != null && userQas.size()>0){
			for(Qa qa : userQas){				
%>
	         <tr style='height:52px;'>
	            <td><%= qa.getQaNum() %></td>
	            <td><%= qa.getQaDate() %></td>
	            <td style='text-align:left'><%= qa.getQaTitle() %></td>
	            <td><%= qa.getQaAnswer() %></td>
	            <!-- <td><span style='color: #FA5882;'>답변 대기</span></td> -->
	            <!-- <td><span style='color: #088A08;'>답변 완료</span></td> -->
	            <td><input type='button' class='btn btn-default pull-right'
						onclick="location.href='myQaDetail.jsp?qaNum=<%=qa.getQaNum()%>'" value='글 보기'/>
	         </tr>
<%
			}
		}else{
%>
			<tr>
            	<td colspan='4'>문의 내역이 없습니다.</td>
        	 </tr>
<%
		}
%>
	</tbody>
   </table>
</div>
</body>

