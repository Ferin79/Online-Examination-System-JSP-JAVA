

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.sql.*;

@WebServlet("/upload")
@MultipartConfig
public class upload extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try
		{
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection con = DriverManager.getConnection(url,"root","");
			PreparedStatement ps = con.prepareStatement("insert into image values (1,?)");
			Part part = request.getPart("image");
			InputStream is = part.getInputStream();
			ps.setBlob(1,is);
			ps.execute();
			System.out.println("Success");
			
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
		try
		{
			String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
			Connection con = DriverManager.getConnection(url,"root","");
			PreparedStatement ps = con.prepareStatement("insert into image values (1,?)");
			Part part = request.getPart("image1");
			InputStream is = part.getInputStream();
			ps.setBlob(1,is);
			ps.execute();
			System.out.println("Success");
			
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
	}

}
