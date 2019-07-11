package com.log;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class register extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection com = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		if(request.getParameter("password_res").equals(request.getParameter("pass_res_con")))
		{
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			String email = request.getParameter("email_res");
			String password = request.getParameter("password_res");
			String name = request.getParameter("name_res");
			
			try
			{
				com = DriverManager.getConnection(url,"root","");
				ps = com.prepareStatement("insert into student_login values(?,?,?)");
				ps.setString(2, email);
				ps.setString(3,password);
				ps.setString(1,name);
				ps.executeUpdate();
				response.sendRedirect("welcome.jsp");
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
	}

}
