package report;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CalServlet2
 */
@WebServlet("/CalcServlet2")
public class CalcServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	doPost(request, response);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	int num1, num2;
        int result;
        String op;
 
        response.setContentType("text/html; charset=euc-kr");
 
        PrintWriter out = response.getWriter();
 
        num1 = Integer.parseInt(request.getParameter("num1"));
        num2 = Integer.parseInt(request.getParameter("num2"));
        op = request.getParameter("operator");
 
        Calc calc = new Calc(num1, num2, op);
        result = calc.getResult();
 
        out.println("<html>");
        out.println("<head><title>계산기</title></head>");
        out.println("<body><center>");
        out.println("<h2>계산 결과</h2>");
        out.println("<HR>");
        out.println(num1 + op + num2 + " = " + result);
        out.println("</body></html>");
}
}
 