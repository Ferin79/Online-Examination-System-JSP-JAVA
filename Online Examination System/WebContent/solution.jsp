<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="com.itextpdf.text.*" %>
<%@ page import="com.itextpdf.text.pdf.*" %>
<%@ page import="java.sql.*,java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Solution PDF</title>
</head>
<body>
<%
response.setContentType("application/pdf");
Document document = new Document();
Paragraph para = new Paragraph();
ServletOutputStream os = response.getOutputStream();
try
{
	int  i = 0;
	String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
	Connection con = DriverManager.getConnection(url,"root","");
	PreparedStatement ps = con.prepareStatement("select questionid from exam_question");
	ResultSet rs = ps.executeQuery();
	
	while(rs.next())
	{
		ps = con.prepareStatement("select * from questionmaster where questionid = ?");
		ps.setInt(1,rs.getInt("questionid"));
		ResultSet r1 = ps.executeQuery();
		while(r1.next())
		{
			String id = r1.getString("questionid");
			i++;
			para.add("Ques : "+i);
			document.add(para);
		}
	}
	document.close();
}

catch(Exception e)
{
	System.out.println(e.getMessage());
}

%>
</body>
</html>