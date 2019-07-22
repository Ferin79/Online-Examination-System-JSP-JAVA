package com.main;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/cal_result")
public class cal_result extends HttpServlet {

	@SuppressWarnings("deprecation")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session = request.getSession();
		String value="";
		String email = session.getValue("email").toString();
		value = session.getValue("len").toString();
		System.out.println(value);
		String name = session.getValue("fullname").toString();
		
		int sel_ans[] = new int[Integer.parseInt(value)];
		
		for(int i = 0;i<Integer.parseInt(value);i++)
		{
			String ans = "ans" + String.valueOf(i+1);
			sel_ans[i] = 0;
			sel_ans[i] = Integer.parseInt(request.getParameter(""+ans));
		}
		
		String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
		int i = 0;
		double total_marks = 0.0;
		int countRight = 0;
		int countWrong = 0;
		int countNot = 0;
		int[] ques_id = new int[Integer.parseInt(value)];
		
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try
		{
			con = DriverManager.getConnection(url,"root","");
			ps = con.prepareStatement("select questionid from exam_question");
			rs = ps.executeQuery();
			
			i=0;
			while(rs.next())
			{
				ques_id[i] = Integer.parseInt(rs.getString("questionid"));
				i++;
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		try
		{
			for(i = 0;i<ques_id.length;i++)
			{
				ps = con.prepareStatement("select * from questionmaster where questionid = ?");
				ps.setInt(1,ques_id[i]);
				rs = ps.executeQuery();
				
				while(rs.next())
				{
					System.out.println("The Answer from Database is "+rs.getInt("answer"));
					if(sel_ans[i] == 0)
					{
						countNot++;
					}
					else if(sel_ans[i] == rs.getInt("answer"))
					{
						countRight++;
						total_marks = total_marks + rs.getInt("mark");
					}
					else if(sel_ans[i] != rs.getInt("answer"))
					{
						countWrong++;
					}
					else
					{
						System.out.println("I am In else Part");
					}
				}
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		
		System.out.println("Total Marks = "+total_marks);
		System.out.println("Right = "+countRight);
		System.out.println("Wrong = "+countWrong);
		System.out.println("Not Attemted = "+countNot);
		
		session.setAttribute("marks",total_marks);
		session.setAttribute("right",countRight);
		session.setAttribute("wrong",countWrong);
		session.setAttribute("not",countNot);
		
		try
		{
			java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
			ps = con.prepareStatement("INSERT INTO `exam_record`(`name`,`email`, `examname`, `date`, `marks`, `correct`, `wrong`, `notattemted`) VALUES (?,?,?,?,?,?,?,?)");
			ps.setString(1,name);
			ps.setString(2,email);
			ps.setString(3,"exam");
			ps.setDate(4,sqlDate);
			ps.setDouble(5,total_marks);
			ps.setInt(6,countRight);
			ps.setInt(7,countWrong);
			ps.setInt(8,countNot);
			ps.executeUpdate();
			response.sendRedirect("result.jsp");
		}
		catch(Exception e)
		{
			System.out.println("hi "+e.getMessage());
		}
	}

}
