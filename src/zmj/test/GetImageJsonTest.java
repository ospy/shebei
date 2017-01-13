package zmj.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zmj.shebei.admin.database.DatabaseTools;


@WebServlet("/GetImageJsonTest")
public class GetImageJsonTest extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql= "select * from image";
		String content = DatabaseTools.getAll(sql);
		response.setCharacterEncoding("utf-8");
		PrintWriter  out= response.getWriter();
		out.print(content);
		out.close();
//		System.out.println(content);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
