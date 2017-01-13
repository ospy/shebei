package zmj.shebei.admin.servlet.sccj;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import zmj.shebei.admin.bean.SccjBean;
import zmj.shebei.admin.dao.SccjDAO;
import zmj.shebei.admin.database.DBPool;
import zmj.shebei.admin.database.DatabaseTools;

@WebServlet(name = "sccj.do", urlPatterns = { "/sccj.do" })
public class Sccj extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method =  request.getParameter("method");
		switch (method) {
		case "getAll":
			getAll(request,response);
			break;
		case "add":
			addSccj(request,response);
			break;
		case "del":
			delSccj(request,response);
			break;	
		case "getOneByID":
			getOneByID(request, response);
			break;
		default:
			break;
		}
	}

	private void delSccj(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String ids = request.getParameter("ids");
		String sql = "delete from sccj where id in("+ids+")";
//		System.out.println(sql);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	
	protected void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int page = Integer.parseInt(request.getParameter("page"));
		int pagesize = Integer.parseInt(request.getParameter("rows"));
		int first = pagesize * (page - 1);
		String sort = request.getParameter("sort");
		String order = request.getParameter("order");
		String sqlwhere = "";
		
		String sql = "select * from sccj order by " + sort + " " + order + " limit " + first + ", "+ pagesize;
		String responseContent = SccjDAO.getAll(sql);
		
		String sql2 = "select count(*) from sccj "+sqlwhere;
		int total = DatabaseTools.getCount(sql2);
		responseContent = "{\"total\":" + total + ",\"rows\":" + responseContent + "}";
		
		PrintWriter out = response.getWriter();
		out.print(responseContent);
		out.close();
	}
	protected void getOneByID(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
	//添加生产厂家
	protected void addSccj(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String CBM = request.getParameter("cbm");
		String cjname = request.getParameter("cjname");
		String CPYM = request.getParameter("cpym");
		String CGB = request.getParameter("cgb");
		String CDWDZ = request.getParameter("cdwdz");
		String CDWYB = request.getParameter("cdwyb");
		String CLXR = request.getParameter("clxr");
		String CDH = request.getParameter("cdh");
		String CBZ = request.getParameter("cbz");
		String CZLG = request.getParameter("czlg");
		String CDAH = request.getParameter("cdah");
		String CQQ = request.getParameter("cqq");
		String CEmail = request.getParameter("cemail");
		String CCZ = request.getParameter("ccz");
		String CSJCJ = request.getParameter("csjcj");
		int  bENABLE=1, iKWZL=0 ;
		SccjBean sccjBean =  new SccjBean(CBM, cjname, CPYM, CGB, CDWDZ, CDWYB, CLXR, CDH, CBM, CZLG, CDAH, CQQ, CEmail, CCZ, CSJCJ, bENABLE, iKWZL);
		int result = SccjDAO.addSccj(sccjBean);
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
	}


}
