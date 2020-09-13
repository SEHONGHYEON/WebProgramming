<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2 align="center">계산기</h2>
    <hr>
        <form action=CalcServlet method=post>
            <input type="text" name=num1 width="12" size="10"> 
            <select name="operator">
                <option selected>+</option>
                <option>-</option>
                <option>*</option>
                <option>/</option>
            </select>
             <input type="text" name=num2 width="12" size="10">
             <input type="submit" value="계산" name="B1">
             <input type="reset" value="다시 입력" name="B2">
        </form>
    </center>
</body>
</html>