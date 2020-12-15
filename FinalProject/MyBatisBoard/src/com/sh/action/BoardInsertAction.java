package com.sh.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.dao.BoardDAO;
import com.sh.dto.BoardDTO;

public class BoardInsertAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		//클라이언트의 요청을 받는다 : 매개 변수 정보를 가져온다 → DTO 묶어준다.
		request.setCharacterEncoding("utf-8");
		String b_writer = request.getParameter("b_writer");
		String b_subject = request.getParameter("b_subject");
		String b_content = request.getParameter("b_content");
		String b_pwd = request.getParameter("b_pwd");
		
		BoardDTO dto = new BoardDTO(b_subject, b_pwd, b_content, b_writer);
		
		BoardDAO dao = new BoardDAO();
		int succ = dao.boardInsert(dto);
		
		//프레젠테이션 로직 : alert 창을 사용 ▶ PrintWriter를 이용한 script 코드로 구현
		response.setContentType("text/html; charset = utf-8"); 
		PrintWriter out =response.getWriter(); 
		if(succ > 0) {
			out.println("<script> alert('등록 완료되었습니다.');");
			out.println("location.href = 'boardList.do';</script>");
		} else {
			out.println("<script> alert('등록 실패했습니다.');");
			out.println("location.href = 'boardList.do';</script>");
		}
		return null; 	//위의 코드(script)에서 페이지 전환이 이루어지므로,
						//ActionForward가 필요하지 않음, null을 리턴
	}
}