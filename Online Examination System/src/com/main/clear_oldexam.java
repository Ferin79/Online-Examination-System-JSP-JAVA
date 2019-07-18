package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/clear_oldexam")
public class clear_oldexam extends HttpServlet {
	
	protected void service(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		try
		{
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection con = DriverManager.getConnection(url,"root","");
			PreparedStatement ps = con.prepareStatement("TRUNCATE TABLE exam_question");
			ps.executeUpdate();
			response.sendRedirect("generate-question.jsp");
		}
		catch(Exception e)
		{
			PrintWriter out = response.getWriter();
			out.println("<h1>Error Deleting Tables Record</h1>");
			System.out.println(e.getMessage());
		}
	}

}
