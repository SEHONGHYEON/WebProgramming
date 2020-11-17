package cs.dit.command;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cs.dit.dao.MemberDAO;
import cs.dit.dto.MemberDTO;

public class MUpdateCommand implements MCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");  //한글 처리
		
		MemberDTO dto = new MemberDTO();
		
		dto.setNum(request.getParameter("num"));		//DTO에 폼에서 전달된 데이터를 저장
		dto.setTitle(request.getParameter("title"));
		dto.setWriter(request.getParameter("writer"));
		dto.setContent(request.getParameter("content"));
		dto.setRegdate(Date.valueOf(request.getParameter("regdate")));
		dto.setEmail(request.getParameter("email"));

		MemberDAO dao = new MemberDAO();

		dao.update(dto);//DB에 변경된 데이터 업데이트
	}
}
