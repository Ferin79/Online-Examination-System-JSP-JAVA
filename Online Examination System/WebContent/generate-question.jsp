<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<style>
	body
	{
		padding:0px;
		margin:0px;
		background-color:lightblue;
	}
	.name
	{
		position:absolute;
		font-size:40px;
		left:40%;
	}
	input
		{
			padding:10px;
			margin:10px;
			font-size:25px;
		}
		label
		{
			font-size:25px;	
		}
		select
		{
			padding:10px;
			margin:10px;
		 	font-size:25px;
		}
		option
		{
			padding:10px;
			margin:10px;
			font-size:25px;
		}
		table td
		{
			border:1px solid black;
		}
		.form1
		{
			padding-left:100px;
			padding-top:100px;
		}
		button
		{
			padding:10px;
			margin:10px;
		 	font-size:25px;
		}
		
		
</style>
<meta charset="ISO-8859-1">
<title>Generate Question</title>
</head>
<body>
<%
	if(session.getAttribute("email")!=null)
	{
		if(!(session.getValue("email").toString().equals("ferinpatel79@gmail.com")))
		{
			response.sendRedirect("AccessDenied.jsp");
		}
	}
	else
	{
		response.sendRedirect("register.jsp");
	}
	String classid;
	String subjectid;
	String chapterid;
	String questiontype;
	String cor_ans;
%>
	<div class="name">Generate Question</div>
	<div class="form1">
	<form method="POST">
	<table>

		
		<tr>	
		<td><label>Choose Class :</label></td>
		
		<td>	<select name="class_main" id="class_main" onchange="this.form.submit();">
				<option value="0">Select class</option>
				<%
				try
				{
					String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
					Connection com = DriverManager.getConnection(url,"root","");
					PreparedStatement ps = com.prepareStatement("select * from class");
					ResultSet rs = ps.executeQuery();
					
					while(rs.next())
					{
						%>
						<option value="<%=rs.getInt("classid")%>"
						
						
						<%
							if(request.getParameter("class_main")!=null)
							{
								if(rs.getInt("classid") == Integer.parseInt(request.getParameter("class_main")))
								{
										out.print("selected");		
								}
							}
						%>
						
						
						
						
						
						><%=rs.getString("classname")%></option>
						<%
						
					}
					classid = request.getParameter("class_main");
					System.out.println("From class "+classid);
				}
				catch(Exception e)
				{
					System.out.println(e.getMessage());
				}
				
				%>
			</select></td>
			</tr>
			
			<tr>
			<td><label>Choose Subject :</label></td>
			
			<td><select name="subject" id="subject" onchange="this.form.submit();">
				<option value="0">Select Subject</option>
				<%
				try
				{
					String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
					Connection com = DriverManager.getConnection(url,"root","");
					PreparedStatement ps = com.prepareStatement("select * from subject where classid = ?");
					ps.setString(1,request.getParameter("class_main"));
					ResultSet rs = ps.executeQuery();
					
					while(rs.next())
					{
						%>
						<option value="<%=rs.getInt("subjectid")%>"
						
						<%
							if(request.getParameter("subject")!=null)
							{
								if(rs.getInt("subjectid") == Integer.parseInt(request.getParameter("subject")))
								{
										out.print("selected");		
								}
							}
						%>
						
						
						
						><%=rs.getString("subjectname")%></option>
						<%
					}
					subjectid = request.getParameter("subject");
					System.out.println("from subject "+subjectid);
				}
				catch(Exception e)
				{
					System.out.println(e.getMessage());
				}
				
				%>
				
			</select></td>
			</tr>
			<tr>
			<td><label>Choose Chapter :</label></td>
			
			<td><select name="chapter" id="chapter" onchange="this.form.submit();">
				<option value="0">Select Chapter</option>
					
					<%
					try
					{
						String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
						Connection com = DriverManager.getConnection(url,"root","");
						PreparedStatement ps = com.prepareStatement("select * from chapter where classid = ? and subjectid = ?");
						ps.setString(1,request.getParameter("class_main"));
						ps.setString(2,request.getParameter("subject"));
						ResultSet rs = ps.executeQuery();
						
						while(rs.next())
						{
							%>
							<option value="<%=rs.getInt("chapterid")%>"
							
							<%
							if(request.getParameter("chapter")!=null)
							{
								if(rs.getInt("chapterid") == Integer.parseInt(request.getParameter("chapter")))
								{
										out.print("selected");		
								}
							}
						%>
							
							><%=rs.getString("chaptername")%></option>
						<%
						
					}
					chapterid = request.getParameter("chapter");
					System.out.println("From chapter "+chapterid);
				}
				catch(Exception e)
				{
					System.out.println(e.getMessage());
				}
				
				%>
				
		    </select></td>
			</tr>
			<tr>
			<td><label>Question-Type :</label></td>
			<td><select name="ques_type" id="ques_type">
				<option value="0">Easy</option>
				<option value="1">Hard</option>
			</select></td>
			<%
				questiontype = request.getParameter("type");
			%>
			</tr>
		<tr>
		<td><label>Enter Number of Question :</label></td>
		<td><input type="number" name="no_question" placeholder="Enter Number of Question"></td>
		</tr>
		
		<tr>
		<td><button type="submit" formaction="generate_question">Add</button></td>
		<td><button type="submit" formaction="clear_oldexam">Clear Database from old Exam</button></td>
		</tr>
		
		
		
	</table>
	</form>
	</div>
	
</body>
</html>