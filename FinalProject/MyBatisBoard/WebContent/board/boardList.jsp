<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.sh.dto.BoardDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
request.setCharacterEncoding("utf-8");
List<BoardDTO> list = (List<BoardDTO>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList JSP</title>
<style>
th{text-align: right;}

</style>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
	<jsp:include page = "../bootstrap/top.html" flush = "false"/>
	<p>
	<h5 align="center">게시판 전체 목록</h5>
	<table class="table table-striped table-hover">
	<thead>
		<tr style="text-align: center">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		</thead>
		 <%
		 if(list.size() == 0) {
			 out.println("<tr align='center'><td colspan='5'>작성된 글이 없습니다.</td></tr>");
		 } else {
			 for(int i = 0; i < list.size(); i++) {
				 out.println("<tr align='center'>");
					out.println("<td>" + (list.size() - i) + "</td>");
					out.println("<td><a href='boardDetail.do?b_num=" + list.get(i).getB_num() + "'>" + list.get(i).getB_subject() + "</a></td>");
					out.println("<td>" + list.get(i).getB_writer() + "</td>");
					out.println("<td>" + list.get(i).getB_date() + "</td>");
					out.println("<td>" + list.get(i).getB_readcount() + "</td>");
				out.println("</tr>");
			 }
		 }
		 %>
		
	</table>
		 <div align="center"> 
		 	 		<form action="boardSearch.do" method="post" >
		 			<select name="part">
		 				<option value="b_subject">제목</option>
		 				<option value="b_content">내용</option>
		 				<option value="b_writer">작성자</option>
		 			</select>
		 			<input type="text" name="searchData" required="required"/>
		 			
		 			<input type="submit" value="검색" class="btn btn-secondary" /> 
		 			<input type="button" value="글쓰기" class="btn btn-primary" onclick="location.href='boardInsertForm.do'"/>
		 		
		 		
		 
		 		</form> 
		 		</div>

	
	
</body>
</html>