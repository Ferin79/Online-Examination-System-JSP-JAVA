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
		.main
		{
			position:absolute;
			left:35px;
			top:0px;
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
		
	</style>
</head>
<body>
<%
	String classid;
	String subjectid;
	String chapterid;
%>
	<div class="main">
		<form>
			<label>Choose Class :</label>
			<select name="class_main" id="class_main" onchange="this.form.submit();">
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
			</select>
			
			<br>
			
			<label>Choose Subject :</label>
			<select name="subject" id="subject" onchange="this.form.submit();">
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
				
			</select>
			
			<br>
			
			<label>Choose Chapter :</label>
			<select name="chapter" id="chapter" onchange="this.form.submit()l">
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
							<option value="<%=rs.getInt("chapterid")%>"><%=rs.getString("chaptername")%></option>
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
				
		    </select>
			
			<br>
			
			<label>Enter Question :</label><textarea name="question" rows=5,cols=5>
			</textarea>
			
			<br>
			<br>
			<br>
			
			<label>Option 1 : </label><input type="text">
			<br>
			<label>Option 2 : </label><input type="text">
			<br>
			<label>Option 3 : </label><input type="text">
			<br>
			<label>Option 4 : </label><input type="text">
			<br>
			<label>Answer : </label><input type="text">
			<br>
			
			<input type="submit">
		
		</form>
	</div>
</body>
</html>