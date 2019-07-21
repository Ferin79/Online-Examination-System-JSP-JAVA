<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Question</title>
	<style>
		body
		{
			padding:0px;
			margin:0px;
			background-color:lightblue;
		}
		input
		{
			padding:10px;
			margin:10px;
			font-size:20px;
		}
		label
		{
			padding:10px;
			margin:10px;
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
			padding:10px;
			margin:10px;
			border:1px solid black;
		}
		.header
		{
			width:100%;
			position:absolute;
			padding:25px;
			font-size:40px;
			left:35%;
		}
		.main
		{
			position:relative;
			padding-top:100px;	
			padding-left:250px;	
		}
		button
		{
			font-size:25px;
		}
		
	</style>
</head>
<body>
<%
	if(session.getAttribute("email")!=null)
	{
		if(!(session.getValue("email").toString().equals("ferinpatel79@gmail.com")))
		{
			out.println("<h1>Access Denied !!!!    You need Admin Account to access this page. </h1>");
			response.sendRedirect("register.jsp");
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
	<div class="header">Add Question To Database</div>
	<div class="main">
		<form  method = "get" enctype='multipart/form-data'>
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
			<td><label>Enter Question :</label></td>
			<td><textarea name="question" rows=5 cols=50>
			</textarea></td>
			<td><input type="file" name="ques_img"></td>
			</tr>
			<tr>
			<td><label>Option 1 : </label></td>
			<td><input type="text" name="option1"></td>
			<td><input type="file" name="op1_img"></td>
			</tr>
			<tr>
			<td><label>Option 2 : </label></td>
			<td><input type="text" name="option2"></td>
			<td><input type="file" name="op2_img"></td>
			</tr>
			<tr>
			<td><label>Option 3 : </label></td>
			<td><input type="text" name="option3"></td>
			<td><input type="file" name="op3_img"></td>
			</tr>
			<tr>
			<td><label>Option 4 : </label></td>
			<td><input type="text" name="option4"></td>
			<td><input type="file" name="op4_img"></td>
			</tr>
			<tr>
			<td><label>Correct Answer : </label></td>
			<td><select name="answer" id = answer>
					<option value = "0">select option</option>
					<option value = "1">option 1</option>
					<option value = "2">option 2</option>
					<option value = "3">option 3</option>
					<option value = "4">option 4</option>
			</select></td>
			<tr>
			<td><label>Enter Marks :</label>
			<td><input type="number" name="mark" placeholder="Enter Marks"></td>
			</tr>
			</tr>
			<tr>
			<td><label>Solution:</label></td>
			<td><textarea name="solution" rows=5 cols=50>
			</textarea></td>
			<td><input type="file" name="sol_img"></td>
			</tr>
			<tr>
			<td><button type="submit" formaction="add_question" enctype='multipart/form-data'>Add Question</button></td>
			<td><a href="index.jsp"><input type="button" value="Home"></a>
				<a href="add_question.jsp"><input type="button" value="Clear"></a>
				<a href="generate-question.jsp"><input type="button" value="Generate Question"></a>
			</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>