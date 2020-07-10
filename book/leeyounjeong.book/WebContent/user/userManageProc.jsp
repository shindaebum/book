<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "java.util.*" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	
	String correctPwd = request.getParameter("correctPwd");
	String userId = (String)session.getAttribute("LoginId");
	
	User user = new User();
	
	user = userService.findUser(userId);
	
	if(userId.equals(user.getUserId()) && correctPwd.equals(user.getUserPwd())){
%>			
		<c:redirect url="correctUser.jsp"/>
<%
	}else{
%>				
		<c:redirect url="userManage.jsp?msg2=Wrong Password."/>
<%				
	}	
%>
