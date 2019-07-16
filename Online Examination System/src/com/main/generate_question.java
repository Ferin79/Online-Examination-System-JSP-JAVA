package com.main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/generate_question")
public class generate_question extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int classid = Integer.parseInt((request.getParameter("class_main")));
		int subjectid = Integer.parseInt(request.getParameter("subject"));
		int chapterid = Integer.parseInt(request.getParameter("chapter"));
		int question_type = Integer.parseInt(request.getParameter("ques_type"));
		String Exam = request.getParameter("examname");
		int number = Integer.parseInt(request.getParameter("no_question"));
		
		System.out.println(classid+" "+subjectid+" "+chapterid+" "+question_type);
		
		try
		{
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection com = DriverManager.getConnection(url,"root","");
			PreparedStatement ps = com.prepareStatement("select questionid from questionmaster where classid = ? and subjectid = ? and chapterid = ? and questiontype = ? ");
			ps.setInt(1,classid);
			ps.setInt(2,subjectid);
			ps.setInt(3,chapterid);
			ps.setInt(4,question_type);
			ResultSet rs = ps.executeQuery();
			
			int rows = 0;
			while(rs.next())
			{
				rows++;
				System.out.println(rs.getInt("questionid"));
			}
			System.out.println("Done");
			
			PrintWriter out = response.getWriter();
			out.println("<h1>Question Generated Successfully Goto Below Link to See Quiz</h1>");
			out.println("<h2><a href='/exam.jsp'>Quiz</a></h2>");
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
	}

}
