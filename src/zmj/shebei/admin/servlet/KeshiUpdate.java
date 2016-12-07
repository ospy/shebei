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
import zmj.shebei.admin.database.DatabaseTools;
import zmj.shebei.admin.database.RsToJsons;


@WebServlet(name = "updateKeshi.do", urlPatterns = { "/updateKeshi.do" })
public class KeshiUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String keshiname_edit = request.getParameter("keshiname_edit");
		String keshimanager_edit = request.getParameter("keshimanager_edit");
		String keshiposition_edit = request.getParameter("keshiposition_edit");
		String sql = "update keshi set keshiname='"+keshiname_edit+"',keshimanager='"+ keshimanager_edit
				+"',keshiposition='"+keshiposition_edit+"' "
				+ "where id ="+id;
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		int result = 0;
		try {
			stmt = conn.createStatement();
			result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DatabaseTools.closeStatement(stmt);
			DatabaseTools.closeConnection(conn);
		}
		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
	
	}

}
