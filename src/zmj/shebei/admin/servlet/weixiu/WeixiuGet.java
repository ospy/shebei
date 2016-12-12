package zmj.shebei.admin.servlet.weixiu;

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
import zmj.shebei.admin.database.DatabaseTools;
import zmj.shebei.admin.database.RsToJsons;


@WebServlet(name = "getweixiu.do", urlPatterns = { "/getweixiu.do" })
public class WeixiuGet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String sql ="";
		sql = "select * from weixiu where id="+id;
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String responseContent = "";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			responseContent = RsToJsons.resultSetToJson(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseTools.closeResultset(rs);
			DatabaseTools.closeStatement(stmt);
			DatabaseTools.closeConnection(conn);
		}
		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(responseContent);
		out.close();
	}

}
