<%@page import="com.sh.dto.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
//BoardDetailAction에서 보낸 dto를 받는다.
request.setCharacterEncoding("utf-8");
BoardDTO dto = (BoardDTO) request.getAttribute("dto");
pageContext.setAttribute("enter", "\r\n");	//JSTL 줄바꿈 처리를 위해 현재 페이지에서 사용할 객체 생성
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Board Detail</title>
<script type="text/javascript">
function fnDelete(b_pwd) {
	var user_pwd = document.detailForm.user_pwd.value;
	alert("User PW : " + user_pwd + "\nDB PW : " + b_pwd);
	
	if(user_pwd == "") {			//비밀번호가 미입력 시
		alert("비밀번호를 입력하세요!");
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else if(user_pwd != b_pwd) {	//비밀번호 불일치
		alert("비밀번호가 일치하지 않습니다!")
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else {						//비밀번호 일치 → confirm 창
		if(confirm("정말 삭제하시겠습니까?")) {
			location.href = "boardDelete.do?b_num=" + ${dto.b_num 	};
		} else {
			document.detailForm.user_pwd.value = "";
			document.detailForm.user_pwd.focus();
		}
	}
}

function fnUpdate(b_pwd) {
	var user_pwd = document.detailForm.user_pwd.value;
	alert("User PW : " + user_pwd + "\nDB PW : " + b_pwd);
	
	if(user_pwd == "") {			//비밀번호가 미입력 시
		alert("비밀번호를 입력하세요!");
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else if(user_pwd != b_pwd) {	//비밀번호 불일치
		alert("비밀번호가 일치하지 않습니다!")
		document.detailForm.user_pwd.value = "";
		document.detailForm.user_pwd.focus();
	} else {						//비밀번호 일치 → 수정 화면(form)
		location.href = "boardUpdateForm.do?b_num=" + ${dto.b_num };
	}
}
</script>
</head>
<body>
<div align="center">
<jsp:include page = "../bootstrap/top.html" flush = "false"/>
<p><p>
	<h3>글 내용 조회</h3>
	<table class="table table-striped table-hover">
		<tr>
			<th>작성자</th>
			<td>${dto.b_writer }</td>
			<th>조회수</th>
			<td>${dto.b_readcount }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td colspan="3">${dto.b_subject }</td>			
		</tr>
		<tr>
			<th>내용</th>
			<%-- <td colspan="3">${dto.b_content }</td> --%> <!-- 줄바꿈 처리를 못하는 문제 발생 -->
			<td colspan="3">
				<%--=dto.getB_content().replace("\r\n", "<br />") --%>	<!-- 자바 코드로 줄바꿈 처리 -->
				${fn : replace(dto.b_content, enter, "<br />") }
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td colspan="3">
				<!-- script에서 user_pwd에 접근하기 위한 폼, 폼에서 Enter키 입력으로 인한 화면 전환 방지 -->
				<form name="detailForm" onsubmit="return false" >
					<input type="password" name="user_pwd"/>
					<input type="button"  class="btn btn-dark" value="삭제" onclick="fnDelete('${dto.b_pwd}')"/>
					<input type="button"   class="btn btn-primary" value="수정" onclick="fnUpdate('${dto.b_pwd}')"/>
					<input type="button"   class="btn btn-secondary" value="글 목록" onclick="location.href='boardList.do'"/>				 
				</form>
			</td>
		</tr>
	</table>
</div>
</body>
</html>