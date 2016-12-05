package zmj.shebei.admin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import zmj.shebei.admin.bean.NavBean;
import zmj.shebei.admin.database.DBPool;

@WebServlet(name = "nav.do", urlPatterns = { "/nav.do" })
public class Nav extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Nav() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String nid = (id == null) ? "0" : request.getParameter("id");
		String sql = "select * from nav where nid = " + nid;
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		ResultSet rs = null;
		NavBean navBean = null;
		NavBean[] navBeans = new NavBean[2];
		ArrayList<NavBean> list = new ArrayList<NavBean>();
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int i = 0;
			while (rs.next()) {
				navBean = new NavBean();
				navBean.setId(rs.getInt("id"));
				navBean.setText(rs.getString("text"));
				navBean.setState(rs.getString("state"));
				navBean.setIconCls(rs.getString("iconCls"));
				navBean.setUrl(rs.getString("url"));
				navBean.setNid(rs.getInt("nid"));
//				navBeans[i++] = navBean;
				list.add(navBean);
				i++;
			}
//			System.out.println(JSONArray.fromObject(list).toString());
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

		// 响应消息
		PrintWriter out = response.getWriter();
		out.print(JSONArray.fromObject(list).toString());
		out.close();
	}

}
