<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Confirm</title>
<style>
<style>
	*{
	padding:0px;
	margin:0px;
    font-family: century Gothic;
}
body
{
        background-color:lightblue;
}
header
{
    height: 100px;
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
label
{
	padding:50px;
	margin:20px;
	font-size:30px;
	
}
button
{
	padding:10px;
	margin:20px;
	font-size:30px;
	background-color:lightblue;
}

</style>
</head>
<body>
<%
	int flag = 0;
	if(session.getAttribute("email")!=null)
	{
		try
		{
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection con = DriverManager.getConnection(url,"root","");
			PreparedStatement ps = con.prepareStatement("select * from curr_exam");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				if(session.getValue("email").toString().equals(rs.getString("email")))
				{
					flag = 1;
				}
			}
			if(flag == 1)
			{
				flag = 0;
				response.sendRedirect("once.jsp");
			}
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}
	else
	{
		response.sendRedirect("register.jsp");
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
                <li><a href="#">Hey,${fullname}</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="./dev_page/ferin.html">Developer</a></li>
            </ul>
        </div>
    </header>
     <div class="inst">
        		<h1>Exam Instructions</h1>
        		<br>
        		<label>The Exam will be Of multiple Choice Question</label>
        		<br>
        		<br>
        		<label>Total 30 Question are there in exam</label>
        		<br>
        		<br>
        		<label>As soon as you click submit Button, Timer will automatically starts</label>
        		<br>
        		<br>
        		<label>When times ups, your exam will automatically submitted</label>
        		<br>
        		<br>
        		<label>All Question are compulsory</label>
        		<br>
        		<br>
	        	<a href="exam.jsp"><button>Start Exam</button></a>
        </div>
</body>
</html>