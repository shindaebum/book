<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	String userName = request.getParameter("userName");
	String userPwd = request.getParameter("userPwd");
	String phoneNum = request.getParameter("phoneNum");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	String address4 = request.getParameter("address4");
		
	StringBuffer buff = new StringBuffer(address1);	
	buff.append(address2);
	buff.append(address3);
	buff.append(address4);
	String address = buff.toString();
	
	List<User> userIds = userService.listUserIds();

		for (User user : userIds) {
			String id = user.getUserId();
			if (userId.equals(id)){
%>
				<c:redirect url="addUser.jsp?msg=Already Used."/>
<%
			}
		}
		User user = new User();
		user.setUserId(userId);
		user.setUserName(userName);
		user.setUserPwd(userPwd);
		user.setPhoneNum(phoneNum);
		user.setAddress(address);
			
		userService.join(user);
		
%>		
<c:redirect url="addComplete.jsp"/>		
