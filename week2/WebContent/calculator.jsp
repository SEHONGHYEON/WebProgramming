<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta  charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h2 align="center">����</h2>
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
             <input type="submit" value="���" name="B1">
             <input type="reset" value="�ٽ� �Է�" name="B2">
        </form>
    </center>
</body>
</html>