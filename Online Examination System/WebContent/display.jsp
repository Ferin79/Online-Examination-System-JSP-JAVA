<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,java.io.*" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
Connection con = DriverManager.getConnection(url,"root","");
PreparedStatement ps = con.prepareStatement("select * from questionmaster");
ResultSet rs = ps.executeQuery();

while(rs.next())
{
	String id = rs.getString("questionid");
	%>
	
		<img alt="hello" src="print.jsp?id=<%=id%>" width="250" height="200">
	<%
}
%>
</body>
</html>