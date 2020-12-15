<%@page import="com.sh.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
BoardDTO dto = (BoardDTO) request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script type="text/javascript">
function fnSubmit() {
	if(confirm("정말 수정 하시겠습니까?")) {
		return true;
	}
	return false;
}

function fnReset() {
	if(confirm("정말 초기화 하시겠습니까?")) {
		return true;
	}
	return false;
}
</script>
</head>
<body>
<div align="center">
<jsp:include page = "../bootstrap/top.html" flush = "false"/>
<p><p>
	<h3>글 내용 수정</h3>
	<form action="boardUpdate.do" method="post" onsubmit="return fnSubmit()" onreset="return fnReset()">
	<input type="hidden" name="b_num" value="${dto.b_num }"/>
		<table  class="table table-striped">
			<tr>
				<th>작성자</th>
				<td><input type="text" name="b_writer" value="${dto.b_writer }" /></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="b_subject" value="${dto.b_subject }" /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea style="width:80%" rows="10" cols="50" name="b_content">${dto.b_content }</textarea>
				</td>
			</tr>
			<tr>
				<th>수정할 비밀번호</th>
				<td align="center">
				
					<input type="password" name="b_pwd" value="${dto.b_pwd }" />
					<input type="submit"  class="btn btn-primary" value="수정 완료" />
					<input type="reset"  class="btn btn-secondary" value="초기화" />
					<input type="button"  class="btn btn-dark" value="글 목록" onclick="location.href='boardList.do'" />
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>