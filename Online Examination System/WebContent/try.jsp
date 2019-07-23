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
	<form method="POST" enctype='multipart/form-data'>
		<input type="file" name="image">
		<br>
		<input type="file" name="image1">
		<br>
		<button type="submit" formaction="upload">submit</button>
		
	</form>
	<a href="print.jsp">show images</a>
	
	
</body>
</html>