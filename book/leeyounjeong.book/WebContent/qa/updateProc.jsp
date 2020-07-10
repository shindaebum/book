<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.qa.service.QaService' %>
<%@ page import='leeyounjeong.book.qa.service.QaServiceImpl' %>
<%@ page import='leeyounjeong.book.qa.domain.Qa'%>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%
	request.setCharacterEncoding("utf-8");
	QaService qaService = new QaServiceImpl();
	
	Object objQaNum = session.getAttribute("qaNum");
	String strQaNum = objQaNum.toString();
	int qaNum = Integer.parseInt(strQaNum);
		
	Qa qa = new Qa();
	
	if(qaNum > 0 ){
	   qa = qaService.findQa(qaNum);
	}

	String updateTitle = request.getParameter("updateTitle");
	String updateContent = request.getParameter("updateContent");
	
	qa.setQaTitle(updateTitle);
	qa.setQaContent(updateContent);
	
	qaService.correctQa(qa);
%>
<c:redirect url='list.jsp'/>