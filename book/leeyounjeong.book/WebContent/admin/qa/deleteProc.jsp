<%@ page language='java' contentType='text/html; charset=UTF-8'
    pageEncoding='UTF-8'%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ page import='leeyounjeong.book.qa.service.QaService' %>
<%@ page import='leeyounjeong.book.qa.service.QaServiceImpl' %>
<%@ page import='leeyounjeong.book.qa.domain.Qa'%>
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
	
	qaService.secede(qaNum);
	
out.write("<script>");
out.write("alert('삭제가 완료되었습니다.'); location.href='list.jsp?action=index';");
out.write("</script>");
%>