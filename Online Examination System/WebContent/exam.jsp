<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Quiz-Exam</title>
	<style>
		body
		{
			padding:0xp;
			margin:0px;
			background-color:lightblue;
		}
		.exam
		{
			position:absolute;
			top:40%;
			left:35%;
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
		header
		{
		    background-color:lightblue;
		    background-size: cover;
		    background-position: center;
		}
		.header1
		{
			position:sticky;
		    top:0px;
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
		.time_css
		{
			font-size:35px;
			position: fixed;
			top:100px;
		}
	</style>	
	<script>
		var timer = 10;
		var min = 0;
		var sec = 0;
		
		function startTimer()
		{
			min = parseInt(timer/60);
			sec = parseInt(timer%60);
			
			if(timer<1)
			{
					alert("Times Up, Exam will Automatically submitted");
					document.ferin.submit();
			}
			document.getElementById("time").innerHTML  = "<b>Time Left </b>" + min.toString() + ":" +sec.toString();
			timer--;
			setTimeout(function()
					{
						startTimer();
					},1000);
		}
	</script>
</head>
<body onload="startTimer();">
	<header class="header1" id="myHeader">
        <div class="logo">
            <a href="index.jsp">Career Education</a>
            <div class="tagline">
                A Place For Better Future
            </div>
        </div>
        <div class="main">
            <ul>
                <li><a href="#">Hey, ${fullname}</a></li>
                <li><a href="exam.jsp">Online Exam</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="#">Developer</a></li>
            </ul>
        </div>
    </header>
	<%
		if(session.getAttribute("email")==null)
		{
			response.sendRedirect("register.jsp");
		}
		ResultSet r1 = null;
		String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
		Connection con = DriverManager.getConnection(url,"root","");
		PreparedStatement ps = con.prepareStatement("select id from exam_question");
		ResultSet rs = ps.executeQuery();
	%>
	<section class="time_css"><b>[<span id="time"></span></b>]</section>
	<div class="exam">
		<form action="welcome.jsp" method="POST" name="ferin">
		<table>
	<%
		int no = 0;
		while(rs.next())
		{
			ps = con.prepareStatement("select * from questionmaster where questionid = ?");
			ps.setInt(1,rs.getInt("id"));
			r1 = ps.executeQuery();
			while(r1.next())
			{
				no++;
				%>
				
				<tr>
				<td>
				<label class="index_no"><%=no %>:</label>
				
				<label class="ques"><%=r1.getString("question") %></label>
			
				<br>
				
				<input type="radio" name="answer"><label class="option"><%=r1.getString("option1") %></label>
				<br>
				<input type="radio" name="answer"><label class="option"><%=r1.getString("option2") %></label>
				<br>
				<input type="radio" name="answer"><label class="option"><%=r1.getString("option3") %></label>
				<br>
				<input type="radio" name="answer"><label class="option"><%=r1.getString("option4") %></label>
				</td>
				</tr>
	<%	
			}
		}
			
	%>
	</table>
	</form>
	</div>
</body>
</html>