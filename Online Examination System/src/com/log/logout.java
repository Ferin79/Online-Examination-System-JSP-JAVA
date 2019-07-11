package com.log;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class logout extends HttpServlet {
	
	protected void service(HttpServletRequest request,HttpServletResponse responce)
	{
		HttpSession session = request.getSession();
		session.removeAttribute("email");
		session.invalidate();
		
	}

}
