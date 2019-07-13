package com.main;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/add_question")
public class add_question extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
			
		int classid_main = Integer.parseInt(request.getParameter("class_main"));
		int subjectid_main = Integer.parseInt(request.getParameter("subject"));
		int chapterid_main = Integer.parseInt(request.getParameter("chapter"));
		int ques_type = Integer.parseInt(request.getParameter("ques_type"));
		String question = request.getParameter("question");
		String option1 = request.getParameter("option1");
		String option2 = request.getParameter("option2");
		String option3 = request.getParameter("option3");
		String option4 = request.getParameter("option4");
		int answer = Integer.parseInt(request.getParameter("answer"));
		String solution = request.getParameter("solution");
	
		try
		{
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection com = DriverManager.getConnection(url,"root","");
			PreparedStatement ps = com.prepareStatement("INSERT INTO `questionmaster`(`questionid`, `classid`, `subjectid`, `chapterid`, `questiontype`, `question`, `option1`, `option2`, `option3`, `option4`, `answer`, `solution`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,1);
			ps.setInt(2, classid_main);
			ps.setInt(3,subjectid_main);
			ps.setInt(4,chapterid_main);
			ps.setInt(5,ques_type);
			ps.setString(6,question);
			ps.setString(7,option1);
			ps.setString(8,option2);
			ps.setString(9,option3);
			ps.setString(10,option4);
			ps.setInt(11,answer);
			ps.setString(12,solution);
			ps.executeUpdate();
			response.sendRedirect("add_question.jsp");
		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}
	}

}
