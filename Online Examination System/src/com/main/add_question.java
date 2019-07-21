package com.main;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;
@WebServlet("/add_question")
@MultipartConfig
public class add_question extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		int i = 0;	
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
		int marks = Integer.parseInt(request.getParameter("mark"));
		
		Part part1 = request.getPart("ques_img");
		Part part2 = request.getPart("op1_img");
		Part part3 = request.getPart("op2_img");
		Part part4 = request.getPart("op3_img");
		Part part5 = request.getPart("op4_img");
		Part part6 = request.getPart("sol_img");
		
		InputStream is1 = part1.getInputStream();
		InputStream is2 = part2.getInputStream();
		InputStream is3 = part3.getInputStream();
		InputStream is4 = part4.getInputStream();
		InputStream is5 = part5.getInputStream();
		InputStream is6 = part6.getInputStream();

	
		try
		{
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection com = DriverManager.getConnection(url,"root","");
			PreparedStatement ps = com.prepareStatement("select max(questionid)+1 as id from questionmaster");
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				i = rs.getInt("id");
				ps = com.prepareStatement("INSERT INTO `questionmaster`(`questionid`, `classid`, `subjectid`, `chapterid`, `questiontype`, `question`, `option1`, `option2`, `option3`, `option4`, `answer`, `solution`, `mark`, `ques_pic`, `op1_pic`, `op2_pic`, `op3_pic`, `op4_pic`, `sol_pic`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setInt(1,i);
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
				ps.setInt(13,marks);
				ps.setBlob(14,is1);
				ps.setBlob(15,is2);
				ps.setBlob(16,is3);
				ps.setBlob(17,is4);
				ps.setBlob(18,is5);
				ps.setBlob(19,is6);
				ps.executeUpdate();
				response.sendRedirect("add_question.jsp");
				
			}
		}
		catch(Exception e)
		{
			out.println(e.getMessage());
		}
	}

}
