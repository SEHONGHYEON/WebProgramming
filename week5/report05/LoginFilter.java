package report05;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("*.do")
public class LoginFilter implements Filter {
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest h_request= (HttpServletRequest)request; HttpSession
		h_session= h_request.getSession();
		
		String uri = h_request.getRequestURI();
		
		if(uri.indexOf("login.do") < 0 ) {
			String id = (String)h_session.getAttribute("id");
			
			if(id==null || id.trim().length()==0) {
				HttpServletResponse h_reResponse = (HttpServletResponse)response;
				h_reResponse.sendRedirect("week4/login.html");
			}
		}
		chain.doFilter(request, response);
	}



}
