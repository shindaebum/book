<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ page import = "java.util.*" %>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.qa.service.QaService' %>
<%@ page import='leeyounjeong.book.qa.service.QaServiceImpl' %>
<%@ page import='leeyounjeong.book.qa.domain.Qa' %>
<%@ page import="leeyounjeong.book.user.service.UserService" %>
<%@ page import="leeyounjeong.book.user.service.UserServiceImpl" %>
<%@ page import="leeyounjeong.book.user.domain.User" %>
<%	
	request.setCharacterEncoding("utf-8");
	QaService qaService = new QaServiceImpl();
	
	int qaNum = (int)session.getAttribute("qaNum");
	Qa qa = qaService.findQa(qaNum);
	
	String qaContent = qa.getQaContent();	
	String answer = request.getParameter("answer");
	qaContent = qaContent+"\n\n\n\n\n\n"+"\n" + "└답변: " + answer;
	
	qa.setQaContent(qaContent);
    qa.setQaAnswer("답변완료");
	qaService.correctQa(qa);

	
	response.sendRedirect("list.jsp");
%>
