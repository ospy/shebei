package zmj.shebei.admin.servlet.query;

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

@WebServlet(name = "querywx.do", urlPatterns = { "/querywx.do" })
public class QueryWx extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String sid = request.getParameter("id");
		int page = Integer.parseInt(request.getParameter("page"));
		int pagesize = Integer.parseInt(request.getParameter("rows"));
		int first = pagesize * (page - 1);
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");
		String sqlwhere = "";
		
		String sb_search = request.getParameter("shebei");
		if(sb_search != null && sb_search !=""){
			sqlwhere += " (sbcode like '%"+ sb_search +"%' or sbname like '%"+ sb_search +"%' or ccbianhao like '%"+ sb_search +"%') and";
		}
		
		String date_from = request.getParameter("date_from");
		if(date_from != null && date_from !=""){
			sqlwhere += " bxdate >= '"+ date_from +"' and";
		}
		String date_to = request.getParameter("date_to");
		if(date_to != null && date_to !=""){
			sqlwhere += " bxdate <= '"+ date_to +"' and";
		}
		if(sqlwhere !=""){
			sqlwhere = sqlwhere.substring(0, sqlwhere.length()-4);
			sqlwhere = " and " + sqlwhere;
		}
		
		String sql = "select a.id,sbcode,sbname,keshiname,wxzhuangtai,wxleixing,wxyuanyin,wxneirong, bxdate,bxren,wxdate,wxren,wxjine from weixiu a,shebei b,keshi c where a.sbid=b.id and a.wxkeshi= c.id "// and sbid="+ id 
				+ sqlwhere+ " order by " + sort + " " + order + " limit " + first + ", "+ pagesize;
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
		String sql2 = "select count(1) from weixiu a,shebei b,keshi c where a.sbid=b.id and a.wxkeshi= c.id "// and sbid="+ id 
				+ sqlwhere;
//		String sql2 = "select count(*) from weixiu "+sqlwhere;
		int total = DatabaseTools.getCount(sql2);
		responseContent = "{\"total\":" + total + ",\"rows\":" + responseContent + "}";
		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(responseContent);
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
