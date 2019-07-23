<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>

<head>
    <style>
        body {
            background-color: cyan;
            margin: 0px;
            padding: 0px;
        }
        .main_form
        {
            position:absolute;
            top:30%;
            left:30%;
        }
        .box_login {
            margin-left:-200px;
            margin-right: 150px;
            float:left;
            font-size: 20px;
            font-family: 'Courier New', Courier, monospace;
        }
        
        .box_register {
            margin-top: 0px;
            margin-left: 150px;
            float:right;
            font-size: 20px;
            font-family: 'Courier New', Courier, monospace;
        }

        input {
            padding: 10px;
            margin: 5px;
            font-size: 20px;
            font-family: 'Courier New', Courier, monospace;
        }

        header {
            background-color: lightblue;
            height: 100vh;
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

        ul li a:active {
            background-color: #fff;
        }
    </style>
    <title>
        Register
    </title>
</head>

<body>
    <header class="header1">
        <div class="logo">
            <a href="#">Career Education</a>
            <div class="tagline">
                A Place For Better Future
            </div>
        </div>
        <div class="main">
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="confirm.jsp">Online Exam</a></li>
                <li><a href="#">Contact Us</a></li>
                <li><a href="./dev_page/ferin.html">Developer</a></li>
            </ul>
        </div>
    </header>
    <div class="main_form">
        <div class="box_login">
            <form action="login" method="POST">
                <h1 style="color: #fff">Login</h1>
                <input type="Email" name="email_log" required placeholder="Enter Email">
                <br>
                <input type="password" name="password_log" required placeholder="Enter Password">
                <br>
                <input type="submit" value="Login">
            </form>
        </div>
        <div class="box_register">
            <form action="register" method="POST">
                <h1 style="color:#fff">Register</h1>
                <input type="text" name="name_res" required placeholder="Enter Full Name">
                <br>
                <input type="Email" name="email_res" required placeholder="Enter Email">
                <br>
                <input type="password" name="password_res" required placeholder="Enter Password">
                <br>
                <input type="password" name="pass_res_con" required placeholder="Retype Password Again">
                <br>
                <input type="submit" value="Register">
            </form>
        </div>
    </div>
</body>

</html>