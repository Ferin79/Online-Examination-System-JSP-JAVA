package com.main;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.*;
import com.itextpdf.text.Document;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;

import com.itextpdf.text.pdf.PdfWriter;

public class print_sol {

	public static void print()

	{

		Document document = new Document();
		Font f = new Font();

		try

		{

			PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("D://HelloWorld.pdf"));

			document.open();

			try {
				int i = 0;
				String url = "jdbc:mysql://localhost:3306/online_exam?useTimezone=ture&serverTimezone=UTC";
				Connection con = DriverManager.getConnection(url, "root", "");
				PreparedStatement ps = con.prepareStatement("select questionid from exam_question");
				ResultSet rs = ps.executeQuery();

				while (rs.next()) {
					ps = con.prepareStatement("select * from questionmaster where questionid = ?");
					ps.setInt(1, rs.getInt("questionid"));
					ResultSet r1 = ps.executeQuery();
					while (r1.next()) {
						String id = r1.getString("questionid");
						i++;
						f.setSize(20);
						document.add(new Paragraph("Ques : " + i, f));
						document.add(Image.getInstance(r1.getBytes("ques_pic")));
						document.add(new Paragraph("Ans : " + i, f));
						document.add(Image.getInstance(r1.getBytes("sol_pic")));
						document.add(new Paragraph("\n\n\n"));
					}
				}
			} catch (Exception e) {

			}
			document.close();

			writer.close();

			System.out.print("done");

		} catch (DocumentException e)

		{
			e.printStackTrace();
		} catch (FileNotFoundException e)

		{
			e.printStackTrace();
		}

	}

}