<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>BoardList JSP</title>
<style>
h4,p{
text-align: center;
}
img{height: 500px;
width: 70%;
}
</style>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

</head>
<body>
	<jsp:include page = "../bootstrap/top2.html" flush = "false"/>
	<p><p>
	<h4>All For Book</h4>
	<p>책에 대한 모든 것 , 책에 대해 자유로운 의견을 나눌 수 있는 게시판 입니다.</p>
	<center>
	<img  src="book.jpg">
	</center>
  <div></div>
</body>
</html>