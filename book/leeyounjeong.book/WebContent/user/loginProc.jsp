<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String member = request.getParameter("member");
	int userType = Integer.parseInt(member);
	
	List<User> userIds = userService.listUserIds();
	List<User> users = userService.listUsers();	

	User user = new User();
	user = userService.findUser(userId);
	
	if(user != null){
		switch(userType){
			case 1:
				if(userId.equals(user.getUserId()) && userPwd.equals(user.getUserPwd())){
					session.setAttribute("LoginId", userId);
%>			
					<c:redirect url="../user/loginComplete.jsp"/>
<%
				}else{
%>				
					<c:redirect url="../user/login.jsp?msg0=Wrong Password"/>
<%				
				}
				break;
			case 2:
				if(userId.equals("admin") && userPwd.equals("admin")){
%>			
					<c:redirect url="../admin/main.jsp"/>
<%				
				}else{
%>
					<c:redirect url="../user/login.jsp"/>
<%				
				}
		}
	}else{
%>					
					<c:redirect url="../user/login.jsp?msg7=Not exist Id"/>
<%					
	}
%>	
