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

		String sqlwhere="";
		String sb_search = request.getParameter("sb_search");
		if(sb_search != null && sb_search !=""){
			sqlwhere += " (sbcode like '%"+ sb_search +"%' or sbname like '%"+ sb_search +"%' or ccbianhao like '%"+ sb_search +"%') and";
		}
		
		String sykeshi_search = request.getParameter("sykeshi_search");
		if(sykeshi_search != null && sykeshi_search !=""){
			sqlwhere += " sykeshi in ("+ sykeshi_search +") and";
		}
		
		String date_from = request.getParameter("date_from");
		if(date_from != null && date_from !=""){
			sqlwhere += " buydate >= '"+ date_from +"' and";
		}
		String date_to = request.getParameter("date_to");
		if(date_to != null && date_to !=""){
			sqlwhere += " buydate <= '"+ date_to +"' and";
		}
		String bjiliang_search = request.getParameter("bjiliang_search");
		if(bjiliang_search != null && bjiliang_search !=""){
			sqlwhere += " bjiliang = '"+ bjiliang_search +"' and";
		}
		String shangbaoyb_search = request.getParameter("shangbaoyb_search");
		if(shangbaoyb_search != null && shangbaoyb_search !=""){
			sqlwhere += " shangbaoyb = '"+ shangbaoyb_search +"' and";
		}
		String shangbaowjw_search = request.getParameter("shangbaowjw_search");
		if(shangbaowjw_search != null && shangbaowjw_search !=""){
			sqlwhere += " shangbaowjw = '"+ shangbaowjw_search +"' and";
		}
		String sbleixing_search = request.getParameter("sbleixing_search");
		if(sbleixing_search != null && sbleixing_search !=""){
			sqlwhere += " sbleixing = '"+ sbleixing_search +"' and";
		}
		String sbdengji_search = request.getParameter("sbdengji_search");
		if(sbdengji_search != null && sbdengji_search !=""){
			sqlwhere += " sbdengji >= "+ sbdengji_search +" and";
		}
		
		
		if(sqlwhere !=""){
			sqlwhere = sqlwhere.substring(0, sqlwhere.length()-4);
			sqlwhere = " and " + sqlwhere;
		}
		
		
		String sql = "select a.*, b.keshiname from shebei a, keshi b where a.sykeshi=b.id "+sqlwhere+" order by " + sort + " " + order + " limit " + first + ", "
				+ pagesize;
//		System.out.println(sql);
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String responseContent = "";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			responseContent = RsToJsons.resultSetToJson(rs);

			String sql2 = "select count(*) from shebei a, keshi b where a.sykeshi=b.id "+sqlwhere;
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
