package com.main;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/add_question1")
@MultipartConfig
public class add_question1 extends HttpServlet {

	protected void service(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
	{
		Connection com = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
		
		Part part1 = request.getPart("ques_img");
		Part part2 = request.getPart("sol_img");
		
		InputStream is1 = part1.getInputStream();
		InputStream is2 = part2.getInputStream();
		
		PrintWriter out = response.getWriter();

		int i = 0;	
		int classid_main = Integer.parseInt(request.getParameter("class_main"));
		int subjectid_main = Integer.parseInt(request.getParameter("subject"));
		int chapterid_main = Integer.parseInt(request.getParameter("chapter"));
		int ques_type = Integer.parseInt(request.getParameter("ques_type"));
		int answer = Integer.parseInt(request.getParameter("answer"));
		int marks = Integer.parseInt(request.getParameter("marks"));
		
		
		try
		{
			com = DriverManager.getConnection(url,"root","");
			ps = com.prepareStatement("select max(questionid)+1 as id from questionmaster");
			rs = ps.executeQuery();
			while(rs.next())
			{
				i = rs.getInt("id");
				ps = com.prepareStatement("INSERT INTO `questionmaster`(`questionid`, `classid`, `subjectid`, `chapterid`, `questiontype`, `answer`, `mark`, `ques_pic`, `sol_pic`) VALUES (?,?,?,?,?,?,?,?,?)");
				ps.setInt(1,i);
				ps.setInt(2, classid_main);
				ps.setInt(3,subjectid_main);
				ps.setInt(4,chapterid_main);
				ps.setInt(5,ques_type);
				ps.setInt(6,answer);
				ps.setInt(7,marks);
				ps.setBlob(8,is1);
				ps.setBlob(9,is2);
				ps.executeUpdate();
			}
			response.sendRedirect("AddQuestion.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
}
