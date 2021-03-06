package zmj.shebei.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.Character.Subset;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import zmj.shebei.admin.bean.NavBean;
import zmj.shebei.admin.database.DBPool;
import zmj.shebei.admin.database.DatabaseTools;
import zmj.shebei.admin.database.RsToJsons;


@WebServlet(name = "manager_data.do", urlPatterns = { "/manager_data.do" })
public class ManagerData extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int page = Integer.parseInt(request.getParameter("page"));
		int pagesize = Integer.parseInt(request.getParameter("rows"));
		int first = pagesize*(page-1);
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");
		
		String user = request.getParameter("user");
		String sqlwhere="";
		if(user != null && user !=""){
			sqlwhere += " user like '%"+ user +"%' and";
		}
		if(sqlwhere !=""){
			sqlwhere = sqlwhere.substring(0, sqlwhere.length()-4);
			sqlwhere = " where " + sqlwhere;
		}
		
		String sql = "select * from admin "+ sqlwhere +" order by "+sort +" "+ order +" limit "+first +", " +pagesize;
//		System.out.println(sql);
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String responseContent="";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			responseContent = RsToJsons.resultSetToJson(rs);
			
			String sql2 ="select COUNT(*) from admin" + sqlwhere;
			rs = stmt.executeQuery(sql2);
			rs.next();
			int total = rs.getInt(1);
			responseContent = "{\"total\":"+ total +",\"rows\":" +responseContent +"}";
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DatabaseTools.closeResultset(rs);
			DatabaseTools.closeStatement(stmt);
			DatabaseTools.closeConnection(conn);
		}

//		System.out.println(responseContent);
		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(responseContent);
		out.close();
	
	}

}
