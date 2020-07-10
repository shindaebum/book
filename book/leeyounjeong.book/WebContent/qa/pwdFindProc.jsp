<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import = "java.util.*" %>
<%@ page import='leeyounjeong.book.qa.service.QaService' %>
<%@ page import='leeyounjeong.book.qa.service.QaServiceImpl' %>
<%@ page import='leeyounjeong.book.qa.domain.Qa'%>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	QaService qaService = new QaServiceImpl();
	List<Qa> qas = qaService.listQas();
		
	int qaNum = Integer.parseInt(request.getParameter("qaNumSel"));
	System.out.println(qaNum);
	
	session.setAttribute("qaNum", qaNum);
	
	String correctPwd = request.getParameter("password");
	String userId = (String)session.getAttribute("LoginId");
	
	User user = new User();
	user = userService.findUser(userId);
	
	Qa qa = new Qa();
	
	if(qaNum > 0 ){
		qa = qaService.findQa(qaNum);
		
		if(qa.getUserId().equals(userId) && correctPwd.equals(user.getUserPwd())){
		
%>			
		<c:redirect url="detailQa.jsp"/>
<%
	}else{
%>
		<c:redirect url="list.jsp"/>
<%
	}
	}
%>
