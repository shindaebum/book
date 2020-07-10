<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("utf-8");
	UserService userService = new UserServiceImpl();
	User user = new User();
	
	String userId = request.getParameter("userId");
	String userName = request.getParameter("newUserName");
	String pwd1 = request.getParameter("newPwd1");
	String pwd2 = request.getParameter("newPwd2");
	String phoneNum = request.getParameter("newPhoneNum");
	String address1 = request.getParameter("newAddress1");
	String address2 = request.getParameter("newAddress2");
	String address3 = request.getParameter("newAddress3");
	String address4 = request.getParameter("newAddress4");
	
	StringBuffer buff = new StringBuffer(address1);	
	buff.append(address2);
	buff.append(address3);
	buff.append(address4);
	String address = buff.toString();
	//System.out.printf("%s, %s, %s, %s, %s", userId,userName, pwd1, phoneNum, address);
	
	if(pwd1.equals(pwd2)){
		user.setUserId(userId);
		user.setUserName(userName);
		user.setUserPwd(pwd1);
		user.setPhoneNum(phoneNum);
		user.setAddress(address);	
		
		userService.correctUser(user);
%>

<%	
	}else{
%>
		<c:redirect url="correctUser.jsp?msg5= passwords do not match."/>
<%
	}
	//System.out.printf("%s, %s, %s, %s, %s", userId,userName, pwd1, phoneNum, address);
%>
<c:redirect url="correctComplete.jsp"/>