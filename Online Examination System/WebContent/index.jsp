<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<style>
	*{
	padding:0px;
	margin:0px;
    font-family: century Gothic;
}
body
{
    
}
header
{
    background-color:lightblue;
    height: 100vh;
    background-size: cover;
    background-position: center;
}
.logo
{
    padding: 20px;
    float: left;
    font-size:30px;
    font-weight: bold;
}
.logo a
{
    text-decoration: none;
    color:#fff;
}
.logo a:hover
{
    color:lightcoral;
}
.logo .tagline
{
    color:#fff;
    font-size: 15px;
    padding: 5px;
}
ul
{
    float: right;
    list-style-type: none;
    margin-top: 20px;
}
ul li
{
    display: inline-block;
}
ul li a
{
    font-size:20px;
    font-weight: bold;
    text-decoration: none;
    color: #fff;
    padding:10px 20px;
    border: 2px solid #fff;
    transition: 0.6s ease;
}
ul li a:hover
{
    background-color: lightcoral;
}
.image_roll
{
    width: 20px;
    height: 20px;
}
.hello
{
    position: absolute;
    top: 50%;
    left:50%;
    transform: translate(-50%,-50%);
    font-size: 50px;
    color:#fff;
}

	</style>
<meta charset="ISO-8859-1">
<title>Career Institute</title>
</head>
<body>
	<%
	if(session.getAttribute("email")!=null)
	{
		response.sendRedirect("welcome.jsp");
	}
	%>
 <header class="header1">
        <div class="logo">
            <a href="index.jsp">Career Education</a>
            <div class="tagline">
                A Place For Better Future
            </div>
        </div>
        <div class="main">
            <ul>
                <li><a href="#index.jsp">Home</a></li>
                <li><a href="#">Online Exam</a></li>
			    <li><a href="register.jsp">Login</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Developer</a></li>
            </ul>
        </div>
        <div class="hello">
            Welcome to Career Group
        </div>
    </header>
	
</body>
</html>