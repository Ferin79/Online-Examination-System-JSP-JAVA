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
		int id = Integer.parseInt(request.getParameter("id"));
		String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
		Connection con = DriverManager.getConnection(url,"root","");
		PreparedStatement ps = con.prepareStatement("select * from questionmaster where questionid = ?");
		ps.setInt(1,id);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next())
		{
			System.out.println("in print class = "+rs.getInt("questionid"));
			Blob blob2 = rs.getBlob("ques_pic");
			byte arr2[] = blob2.getBytes(1,(int)blob2.length());
			response.setContentType("image/jpg");
			ServletOutputStream os = response.getOutputStream();

	%>
			<img alt="hello" src=<%os.write(arr2);%> height="100px" width="200px">
		
	<%
	
			
			os.flush();
			os.close();
		}
	
	%>

</body>
</html>