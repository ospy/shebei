package zmj.shebei.admin.servlet.shebei;

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

@WebServlet(name = "shebei_data.do", urlPatterns = { "/shebei_data.do" })
public class ShebeiData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		int page = Integer.parseInt(request.getParameter("page"));
		int pagesize = Integer.parseInt(request.getParameter("rows"));
		int first = pagesize * (page - 1);
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");

		String sql = "select * from shebei order by " + sort + " " + order + " limit " + first + ", "
				+ pagesize;
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String responseContent = "";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			responseContent = RsToJsons.resultSetToJson(rs);

			String sql2 = "select COUNT(*) from shebei";
			rs = stmt.executeQuery(sql2);
			rs.next();
			int total = rs.getInt(1);
			responseContent = "{\"total\":" + total + ",\"rows\":" + responseContent + "}";
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
