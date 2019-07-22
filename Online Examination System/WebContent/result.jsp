<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
<style>
* {
	padding: 0px;
	margin: 0px;
	font-family: century Gothic;
}

body {
	background-color: lightblue;
}

header {
	height: 200px;
	background-size: cover;
	background-position: center;
}

.logo {
	padding: 20px;
	float: left;
	font-size: 30px;
	font-weight: bold;
}

.logo a {
	text-decoration: none;
	color: #fff;
}

.logo a:hover {
	color: lightcoral;
}

.logo .tagline {
	color: #fff;
	font-size: 15px;
	padding: 5px;
}

ul {
	float: right;
	list-style-type: none;
	margin-top: 20px;
}

ul li {
	display: inline-block;
}

ul li a {
	font-size: 20px;
	font-weight: bold;
	text-decoration: none;
	color: #fff;
	padding: 10px 20px;
	border: 2px solid #fff;
	transition: 0.6s ease;
}

ul li a:hover {
	background-color: lightcoral;
}
table
{
	position:absolute;
	top:35%;
	left:35%;
	height:250px;
	width:500px;
	border-collapse:collapse;
}
.result
{
	font-size:50px;
	text-align:center;
}
.hell
{
	font-size:30px;
}
tr td
{
	padding:20px;
	margin:20px;
	border:2px solid red;
}
</style>
</head>
<body>
	<%
		if(session.getAttribute("email")==null)
		{
			response.sendRedirect("register.jsp");
		}
	%>
	<header class="header1">
		<div class="logo">
			<a href="index.jsp">Career Education</a>
			<div class="tagline">A Place For Better Future</div>
		</div>
		<div class="main">
			<ul>
				<li><a href="#">Hey,${fullname}</a></li>
				<li><a href="confirm.jsp">Online Exam</a></li>
				<li><a href="logout.jsp">Logout</a></li>
				<li><a href="#">Contact Us</a></li>
				<li><a href="#">Developer</a></li>
			</ul>
		</div>
	</header>
	<table cellspacing="10">
		<%
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			try {
				con = DriverManager.getConnection(url, "root", "");
				ps = con.prepareStatement("select * from exam_record where email = ? limit 1");
				ps.setString(1,session.getValue("email").toString());
				rs = ps.executeQuery();

				while (rs.next()) {
		%>

		<tr>
			<h1>
				<td><label class="result">Result</label></td>
			</h1>
		</tr>
		<tr>
			<td><label class="hell">Marks Obtained :</label>
			<td><label class="hell"><%=rs.getString("marks")%></label></td>
		</tr>
		<tr>
			<td><label class="hell">Correct Answer :</label></td>
			<td><label class="hell"><%=rs.getString("correct")%></label>
		</tr>
		<tr>
			<td><label class="hell">Wrong Answer :</label></td>
			<td><label class="hell"><%=rs.getString("wrong")%></label></td>
		</tr>
		<tr>
			<td><label class="hell">Not Attemted :</label></td>
			<td><label class="hell"><%=rs.getString("notattemted")%></label>
		</tr>

		<%
			}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		%>
	</table>
</body>
</html>