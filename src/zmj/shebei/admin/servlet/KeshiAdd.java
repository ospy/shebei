package zmj.shebei.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zmj.shebei.admin.database.DBPool;

@WebServlet(name = "addKeshi.do", urlPatterns = { "/addKeshi.do" })
public class KeshiAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String keshiname = request.getParameter("keshiname");
		String keshimanager = request.getParameter("keshimanager");
		String keshiposition = request.getParameter("keshimanager");
		String sql = "insert into keshi(keshiname,keshimanager,keshiposition) "
				+ "values('"+keshiname+"','"+keshimanager+"','"+keshiposition+"')";
		System.out.println(sql);
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		int result = 0;
		try {
			stmt = conn.createStatement();
			 result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
	}

}
