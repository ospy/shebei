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

import net.sf.json.JSONArray;
import zmj.shebei.admin.bean.NavBean;
import zmj.shebei.admin.database.DBPool;
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
		
		String sql = "select * from admin order by "+sort +" "+ order +" limit "+first +", " +pagesize;
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		String responseContent="";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			responseContent = RsToJsons.resultSetToJson(rs);
			
			String sql2 ="select table_name,table_rows from information_schema.`TABLES`  "
					+ "where TABLE_SCHEMA = 'shebei' and TABLE_NAME='admin'";
			rs = stmt.executeQuery(sql2);
			rs.next();
			int total = rs.getInt(2);
			responseContent = "{\"total\":"+ total +",\"rows\":" +responseContent +"}";
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null){
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(stmt != null){
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

//		System.out.println(responseContent);
		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(responseContent);
		out.close();
	
	}

}
