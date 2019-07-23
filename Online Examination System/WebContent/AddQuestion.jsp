<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Question</title>
<style>
body {
	padding: 0px;
	margin: 0px;
	background-color: lightblue;
}

input {
	padding: 10px;
	margin: 10px;
	font-size: 20px;
}

label {
	padding: 10px;
	margin: 10px;
	font-size: 25px;
}

select {
	padding: 10px;
	margin: 10px;
	font-size: 25px;
}

option {
	padding: 10px;
	margin: 10px;
	font-size: 25px;
}

table td {
	padding: 10px;
	margin: 10px;
	border: 1px solid black;
}

.header {
	width: 100%;
	position: absolute;
	padding: 25px;
	font-size: 40px;
	left: 35%;
}

.main {
	position: relative;
	padding-top: 100px;
	padding-left: 250px;
}

button {
	font-size: 25px;
}

#output_image {
	max-width: 150px;
}
#output_image1 {
	max-width: 150px;
}
</style>
<script type='text/javascript'>
	function preview_image(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var output = document.getElementById('output_image');
			output.src = reader.result;
		}
		reader.readAsDataURL(event.target.files[0]);
	}

	function preview_image1(event) {
		var reader = new FileReader();
		reader.onload = function() {
			var output = document.getElementById('output_image1');
			output.src = reader.result;
		}
		reader.readAsDataURL(event.target.files[0]);
	}
</script>
</head>
<body>
	<%
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
		if (session.getAttribute("email") != null) {
			if (!(session.getValue("email").toString().equals("ferinpatel79@gmail.com"))) {
				response.sendRedirect("AccessDenied.jsp");
			}
		} else {
			response.sendRedirect("register.jsp");
		}
		String classid;
		String subjectid;
		String chapterid;
		String questiontype;
		String cor_ans;
	%>

	<div class="header">Add Question To Database</div>
	<div class="main">
		<form method="GET" enctype='multipart/form-data'>
			<table>

				<tr>
					<td><label>Choose Class :</label></td>

					<td><select name="class_main" id="class_main"
						onchange="this.form.submit();">
							<option value="0">Select class</option>
							<%
								try {
									String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
									Connection com = DriverManager.getConnection(url, "root", "");
									PreparedStatement ps = com.prepareStatement("select * from class");
									ResultSet rs = ps.executeQuery();

									while (rs.next()) {
							%>
							<option value="<%=rs.getInt("classid")%>"
								<%if (request.getParameter("class_main") != null) {
						if (rs.getInt("classid") == Integer.parseInt(request.getParameter("class_main"))) {
							out.print("selected");
						}
					}%>><%=rs.getString("classname")%></option>
							<%
								}
									classid = request.getParameter("class_main");
									System.out.println("From class " + classid);
								} catch (Exception e) {
									System.out.println(e.getMessage());
								}
							%>
					</select></td>
				</tr>

				<tr>
					<td><label>Choose Subject :</label></td>

					<td><select name="subject" id="subject"
						onchange="this.form.submit();">
							<option value="0">Select Subject</option>
							<%
								try {
									String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
									Connection com = DriverManager.getConnection(url, "root", "");
									PreparedStatement ps = com.prepareStatement("select * from subject where classid = ?");
									ps.setString(1, request.getParameter("class_main"));
									ResultSet rs = ps.executeQuery();

									while (rs.next()) {
							%>
							<option value="<%=rs.getInt("subjectid")%>"
								<%if (request.getParameter("subject") != null) {
						if (rs.getInt("subjectid") == Integer.parseInt(request.getParameter("subject"))) {
							out.print("selected");
						}
					}%>><%=rs.getString("subjectname")%></option>
							<%
								}
									subjectid = request.getParameter("subject");
									System.out.println("from subject " + subjectid);
								} catch (Exception e) {
									System.out.println(e.getMessage());
								}
							%>

					</select></td>
				</tr>
				<tr>
					<td><label>Choose Chapter :</label></td>

					<td><select name="chapter" id="chapter"
						onchange="this.form.submit();">
							<option value="0">Select Chapter</option>

							<%
								try {
									String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
									Connection com = DriverManager.getConnection(url, "root", "");
									PreparedStatement ps = com
											.prepareStatement("select * from chapter where classid = ? and subjectid = ?");
									ps.setString(1, request.getParameter("class_main"));
									ps.setString(2, request.getParameter("subject"));
									ResultSet rs = ps.executeQuery();

									while (rs.next()) {
							%>
							<option value="<%=rs.getInt("chapterid")%>"
								<%if (request.getParameter("chapter") != null) {
						if (rs.getInt("chapterid") == Integer.parseInt(request.getParameter("chapter"))) {
							out.print("selected");
						}
					}%>><%=rs.getString("chaptername")%></option>
							<%
								}
									chapterid = request.getParameter("chapter");
									System.out.println("From chapter " + chapterid);
								} catch (Exception e) {
									System.out.println(e.getMessage());
								}
							%>

					</select></td>
				</tr>
				<tr>
					<td><label>Question-Type :</label></td>
					<td><select name="ques_type" id="ques_type">
							<option value="0">Easy</option>
							<option value="1">Hard</option>
					</select></td>
					<%
						questiontype = request.getParameter("type");
					%>
				</tr>
				<tr>
					<td><label>Question-Image:</label></td>
					<td><input type="file" accept="image/*" name="ques_img"
						onchange="preview_image(event)"> <img id="output_image" />
					</td>
				</tr>
				<tr>
					<td><label>Correct Answer :</label></td>
					<td><select name="answer" id="answer">
							<option value="0" selected>Select</option>
							<option value="1">A</option>
							<option value="2">B</option>
							<option value="3">C</option>
							<option value="4">D</option></td>
				</tr>
				<tr>
					<td><label>Enter Marks :</label></td>
					<td><input type="number" name="marks"></td>
				</tr>
				<tr>
					<td><label>Solution :</label></td>
					<td><input type="file" accept="image/*" name="sol_img"
						onchange="preview_image1(event)"> <img id="output_image1" />
					</td>
				</tr>
				<tr>
					<td><button type="submit" formaction="add_question1" formmethod="post">Add Question</button></td>
					<td><a href="index.jsp"><input type="button" value="Home"></a>
						<a href="AddQuestion.jsp"><input type="button" value="Clear"></a>
						<a href="generate-question.jsp"><input type="button" value="Generate Question"></a></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>