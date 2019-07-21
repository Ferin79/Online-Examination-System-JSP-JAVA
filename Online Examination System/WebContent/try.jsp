<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="upload" method="post" enctype='multipart/form-data'>
		<input type="file" name="image">
		<br>
		<input type="submit">
	
	</form>
	<%
		String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
		Connection con = DriverManager.getConnection(url,"root","");
		PreparedStatement ps = con.prepareStatement("select * from image");
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			Blob blob = rs.getBlob("try");
			byte arr[] = blob.getBytes(1,(int) blob.length());
			response.setContentType("image/gif");
			OutputStream os = response.getOutputStream();
			%>
			<%=os.write(arr)%>
			<%
			os.flush();
			os.close();
		}
	
	%>
</body>
</html>