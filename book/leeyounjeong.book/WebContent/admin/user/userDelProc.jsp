<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%@ page import="java.util.List" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	
	String userId = request.getParameter("userIdSel");
	//System.out.println(userId);
	User user = null;
	
	if(userId != null ){
		user = userService.findUser(userId);
		userService.secede(userId);
	} else{
%>		
		<c:redirect url="userManage.jsp"/>
<%
	}
%>
<c:redirect url="userManage.jsp"/>