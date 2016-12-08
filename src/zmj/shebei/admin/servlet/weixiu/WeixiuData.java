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

@WebServlet(name = "weixiu_data.do", urlPatterns = { "/weixiu_data.do" })
public class WeixiuData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String sid = request.getParameter("id");
		int id = 5;
		if(sid!=null){
			id = Integer.parseInt(request.getParameter("id"));
		}
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");

		String sql = "select a.id,code,name,bgdate,wxdate,wxren from weixiu a,shebei b where a.sbid=b.id and sbid="+ id +" order by " + sort + " " + order ;
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
