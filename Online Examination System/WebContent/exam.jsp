<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Quiz-Exam</title>
	<style>
		body
		{
			padding:0xp;
			margin:0px;
			background-color:lightskyblue;
		}
		.exam
		{
			padding-top:50px;
			position:relative;
			top:30%;
			left:35%;
		}
		.header
		{
			height:100px;
			width:100%;
			color:#f26389;
		}
		.head
		{
			font-size:50px;
		}
		.ques
		{
			font-size:40px;
			color:black;
		}
		.index_no
		{
			font-size:30px;
			color:black;
		}
		.option
		{
			font-size:30px;
			color:white;
		}
	</style>
</head>
<body>
	<div class="header"><section class="head">Career Education</section></div>
	<%
		if(session.getAttribute("email")==null)
		{
			response.sendRedirect("register.jsp");
		}
		else
		{
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection con = DriverManager.getConnection(url,"root","");
			PreparedStatement ps = con.prepareStatement("select * from questionmaster");
			ResultSet rs = ps.executeQuery();
			
			int no = 0;
			while(rs.next())
			{
				no++;
				%>
				
					<div class="exam">
						<form>
						<table>
							<tr>
							<td>
							<label class="index_no"><%=no %>:</label>
							
							<label class="ques"><%=rs.getString("question") %></label>
						
							<br>
							
							<input type="radio" name="answer"><label class="option"><%=rs.getString("option1") %></label>
							<br>
							<input type="radio" name="answer"><label class="option"><%=rs.getString("option2") %></label>
							<br>
							<input type="radio" name="answer"><label class="option"><%=rs.getString("option3") %></label>
							<br>
							<input type="radio" name="answer"><label class="option"><%=rs.getString("option4") %></label>
							</td>
							</tr>
						</table>
						</form>
				    </div>
				<%
			}
			
		}
	%>
</body>
</html>