<%@page import="report05.BookBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="b" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <%request.setCharacterEncoding("utf-8"); %>
</head>
<body>
		

<jsp:useBean id="book" class="report05.BookBean" scope="session"/>
<jsp:setProperty property="*" name="book" />
 
  
	책제목 : <b:out value="${book.title}"/> <br>
	책저자 : <b:out value="${book.author}"/> <br>
	출판사 : <b:out value="${book.publisher}"/> <br>
	
	
	
</body>
</html>