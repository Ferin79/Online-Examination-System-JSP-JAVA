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
		
		int id = 0;
		int classid = Integer.parseInt((request.getParameter("class_main")));
		int subjectid = Integer.parseInt(request.getParameter("subject"));
		int chapterid = Integer.parseInt(request.getParameter("chapter"));
		int question_type = Integer.parseInt(request.getParameter("ques_type"));
		int number = Integer.parseInt(request.getParameter("no_question"));
		Double mark = Double.parseDouble(request.getParameter("neg_marks"));
		System.out.println("From Java Func neg_marks :"+mark);

		System.out.println(classid+" "+subjectid+" "+chapterid+" "+question_type);
		ResultSet r1 = null;
		try
		{
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection com = DriverManager.getConnection(url,"root","");
			PreparedStatement ps = com.prepareStatement("select questionid from questionmaster where classid = ? and subjectid = ? and chapterid = ? and questiontype = ? ORDER BY rand() LIMIT ?");
			ps.setInt(1,classid);
			ps.setInt(2,subjectid);
			ps.setInt(3,chapterid);
			ps.setInt(4,question_type);
			ps.setInt(5,number);
			ResultSet rs = ps.executeQuery();
			
			int rows = 0;
			while(rs.next())
			{
				ps = com.prepareStatement("select max(id)+1 as id from exam_question");
				r1 = ps.executeQuery();
				while(r1.next())
				{
					id = r1.getInt("id");
					ps = com.prepareStatement("INSERT INTO `exam_question`(`id`, `questionid`) VALUES (?,?)");
					ps.setInt(1,id);
					ps.setInt(2,rs.getInt("questionid"));
					ps.executeUpdate();
				}
			}
			ps = com.prepareStatement("insert into neg_marks values (?)");
			ps.setDouble(1,mark);
			ps.executeUpdate();
			System.out.println("Done");
			response.sendRedirect("generate-question.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
	}

}
