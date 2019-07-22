<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exam Date</title>
<style type="text/css">
	body
	{
		padding:0px;
		margin:0px;
		background-color:lightblue;
	}
	.hell
	{
		font-size:40px;
	}
	input
	{
		padding:20px;
		margin:20px;
		font-size:30px;
	}
	form
	{
		position:absolute;
		top:0%;
		left:0%;
	}
</style>
</head>
<body>
	<form action="admin-result.jsp" method="POST">
	
	<label class="hell">Enter Date :</label><input type="date" name="result_date">
	<br>
	<input type="submit" value="Search Result">
	</form>
</body>
</html>