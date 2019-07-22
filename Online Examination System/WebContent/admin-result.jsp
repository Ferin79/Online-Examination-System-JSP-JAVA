<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Result</title>
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
	background-color: lightblue;
}

table {
	position: absolute;
	top: 35%;
	left: 20%;
	height: 250px;
	width: 500px;
	border-collapse: collapse;
}

.result {
	font-size: 50px;
	text-align: center;
}

.hell {
	font-size: 30px;
}
.hello
{
	font-size: 40px;
	font-weight:bold;

}

tr td {
	padding: 20px;
	margin: 20px;
	border: 2px solid red;
}
</style>
</head>
<body>
	<table cellspacing="10">
	<tr>
		<td><label class="hell">Name</label></td>
		<td><label class="hell">Marks Obtained</label></td>
		<td><label class="hell">Correct Answer</label></td>
		<td><label class="hell">Wrong Answer</label></td>
		<td><label class="hell">Not Attemted</label></td>
	</tr>
		<%
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection con = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			String date = request.getParameter("result_date");
			try {
				con = DriverManager.getConnection(url, "root", "");
				ps = con.prepareStatement("select * from exam_record where date = ?");
				ps.setString(1, date);
				rs = ps.executeQuery();

				while (rs.next()) {
		%>
		<tr>
			
			<td><label class="hell"><%=rs.getString("name") %></label></td>
			
			<td><label class="hello"><%=rs.getString("marks")%></label></td>
			
			<td><label class="hell"><%=rs.getString("correct")%></label></td>
			
			<td><label class="hell"><%=rs.getString("wrong")%></label></td>
			
			<td><label class="hell"><%=rs.getString("notattemted")%></label></td>	
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