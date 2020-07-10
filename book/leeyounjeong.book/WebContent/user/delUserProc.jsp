<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	
	String deletePwd = request.getParameter("deletePwd");
	String userId = (String)session.getAttribute("LoginId");
	
	User user = new User();
	user = userService.findUser(userId);
	
	if(deletePwd.equals(user.getUserPwd())){
		userService.secede(userId);
%>		
		<c:redirect url="deleteComplete.jsp"/>
<%		
	}else{
%>				
		<c:redirect url="deleteUser.jsp?msg3=Wrong Password."/>
<%				
	}	
%>