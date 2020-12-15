package com.sh.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sh.action.Action;
import com.sh.action.ActionForward;
import com.sh.action.BoardDeleteAction;
import com.sh.action.BoardDetailAction;
import com.sh.action.BoardInsertAction;
import com.sh.action.BoardListAction;
import com.sh.action.BoardSearchAction;
import com.sh.action.BoardUpdateAction;
import com.sh.action.BoardUpdateFormAction;

@WebServlet("/BoardFrontController.do")
public class BoardFrontController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//0. 불필요한 코드를 지우고 서비스 메서드만 남겨둔다.
		//1. 클라이언트가 어떤 요청을 했는지를 파악한다.
		request.setCharacterEncoding("utf-8");

		//uri-pattern에서 context root를 잘라내서 boardList.do만 남긴다.
		String uri = request.getRequestURI();		//uri-pattern 값	: /mbb/XXX.do
		String ctx = request.getContextPath();		//Context root 값	: /mbb
		String command = uri.substring(ctx.length());	//실제 요청한 페이지 : /XXX.do

		
		//2. 클라이언트의 요청(*.do → command)과 실제 처리할 비즈니스 로직 연결
		Action action = null;
		ActionForward forward = null;
		
		if(command.equals("/boardList.do")) {
			action = new BoardListAction();		
			forward = action.execute(request, response);
		} else if(command.equals("/boardInsertForm.do")) {	//글쓰기 폼으로 화면 전환만 필요 (Action 클래스 필요 X,)
			forward = new ActionForward();
			forward.setPath("board/boardInsertForm.jsp");
			forward.setRedirect(false);
		} else if(command.equals("/boardInsert.do")) {
			action = new BoardInsertAction();
			forward = action.execute(request, response); //forward에 null값이 리턴된다.
		} else if(command.equals("/boardDetail.do")) {
			action = new BoardDetailAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardDelete.do")) {
			action = new BoardDeleteAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardUpdateForm.do")) {
			action = new BoardUpdateFormAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardUpdate.do")) {
			action = new BoardUpdateAction();
			forward = action.execute(request, response);
		} else if(command.equals("/boardSearch.do")) {
			action = new BoardSearchAction();
			forward = action.execute(request, response);
		}
		
		//3. 페이지 전환(프레젠테이션 로직) : sendRedirect(), forward()
		if(forward != null) {	//forward가 null 아니면 작동
			if(forward.isRedirect()) {	//true : sendRedirect() 페이지 전환
				response.sendRedirect(forward.getPath());
			} else {					//false : forward() 페이지 전환
				RequestDispatcher rd = request.getRequestDispatcher(forward.getPath());
				rd.forward(request, response);
			}	
		}
	}
}