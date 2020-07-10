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
<body>
<div class='container'>
	<div class='area'>
		<div class='top_menu'>
			<% 
				if(session.getAttribute("LoginId")!=null){
			%>
				<h5><%= session.getAttribute("LoginId") %>님, 환영합니다 !</h5>
				<a href='../user/logoutProc.jsp'>로그아웃</a> <span>|</span>
				<a href='../mypage/mypage.jsp'>마이페이지</a> <span>|</span>
				<a href='../cart/cartOut.jsp'>장바구니</a> <span>|</span>
				<a href='../qa/list.jsp'>고객센터</a> 
			<%
				}else{
			%>
			<br><a href='../user/login.jsp'>로그인</a> <span>|</span>
				<a href='../user/addUser.jsp'>회원가입</a> <span>|</span>
				<a href='../user/login.jsp'>마이페이지</a> <span>|</span>
				<a href='../user/login.jsp'>장바구니</a> <span>|</span>
				<a href='../user/login.jsp'>고객센터</a> 
			<%
				}
			%>
				
		</div>
	</div>
	<br>

	<div class='logo'>
		<%
			if(session.getAttribute("LoginId")!=null){
		%>
			<a href='../user/loginComplete.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
		<%
			}else{
		%>
			<a href='../main.jsp' >BoB<i class="fas fa-book-open" aria-hidden="true"></i></a>
		<%
			}
		%>
	</div>
	<br>
	
   <!-- header -->
	<div class='title'>
		<a href='list.jsp' style="text-decoration:none">
			<h1>고객센터
			<span>Q&A</span>
			</h1>
		</a>
	</div> <br><br>
	
	<p align='center'>코로나로 인하여 배송이 늦어질 수 있는 점 양해부탁드립니다.^-^</p>
	
	<!-- 게시판 -->
	
	<form action='pwdFindProc.jsp'> 
		<table class='table table-hover'>
			<thead>
				<tr height='5'><td width='5'></td></tr>
				<tr style='background-color: #0B2161; color:#FFFFFF; text-align:center;'>
					<th></th>
					<th width='73'>No</th>
					<th width='379'>Subject</th>
					<th width='73'>Writer</th>
					<th width='164'>Date</th>
					<th width='73'>Answer</th>
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

	
	/* if(currentPage != null) myPage = new Page(Integer.parseInt(currentPage));
	else myPage = new Page();
	
	PageService pageService = new PageServiceImpl(5, myPage); */
	//QaService qaService = new QaServiceImpl();
	//List<Qa> qas = qaService.listQas();
	//qas.subList((myPage-1) * 10, myPage * 10);
	//pageContext.setAttribute("pageMaker", pageService);
	//pageContext.setAttribute("questions", qaService.pagingQuestions(myPage));
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
					<td>
						<input type="radio" name="qaNumSel" value="<%= qa.getQaNum() %>"/>
					</td>
					<td><%= qa.getQaNum() %></td>
					<td><%= qa.getQaTitle() %></td>
					<td><%= qa.getUserId() %></td>
					<td><%= qa.getQaDate() %></td>
					<td><%= qa.getQaAnswer() %></td>
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
		
		<a href='write.jsp' class='btn btn-success pull-right'>글쓰기</a>
		<button type='submit' class='btn btn-default pull-right' 
			data-target='#ok2' data-toggle='modal' style='margin-right:10px'>글보기</button>
	
<!-- update -->	
	<div class='modal fade' id='ok2'>
	   <div class='modal-dialog modal-md'>
	      <div class='modal-content'>
	         <div class='modal-header'>
	            <button class='close' data-dismiss='modal'>&times;</button>
	            <h5>비밀번호를 입력해주세요.</h5>
	         </div>
	         
	            <div class='modal-body'>
	               <input type='password' class="form-control" name='password'
	                placeholder='비밀번호' required/><%= b %>   
	            </div>
	            <div class='modal-footer'>
	               <button type='submit' formaction='pwdFindProc.jsp' class='btn btn-primary'>확인</button>	           
	               <button class='btn btn-default' data-dismiss='modal'>취소</button>
	            </div>	         
	      </div>
	   </div>   
	</div>
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