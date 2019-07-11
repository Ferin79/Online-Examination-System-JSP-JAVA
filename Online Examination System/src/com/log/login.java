package com.log;

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/login")
public class login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection com = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
		String email = request.getParameter("email_log");
		String password = request.getParameter("password_log");
		
		try
		{
			com = DriverManager.getConnection(url,"root","");
			ps = com.prepareStatement("select * from student_login");
			rs = ps.executeQuery();
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		
		try
		{
			while(rs.next())
			{
				if(rs.getString("email").equals(email) && rs.getString("password").equals(password))
				{
					HttpSession session = request.getSession();
					session.setAttribute("email",email);
					session.setAttribute("fullname", rs.getString("fullname"));
					response.sendRedirect("welcome.jsp");
					break;
				}
				else
				{
					PrintWriter out = response.getWriter();
					out.println("<h1>Email or Password is incorrect<h1>");
					out.println("<br><h1><a href='register.jsp'>Try Again</a></h1>");
				}
			}	
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
}
