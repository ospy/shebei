package zmj.shebei.admin.servlet.weixiu;

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

import zmj.shebei.admin.database.DBPool;

@WebServlet(name = "addWeixiu.do", urlPatterns = { "/addWeixiu.do" })
public class WeixiuAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String sbid = request.getParameter("sbid");
		String wxzhuangtai = request.getParameter("wxzhuangtai");
		String wxleixing = request.getParameter("wxleixing");
		String wxkeshi = request.getParameter("wxkeshi");
		String wxjine = request.getParameter("wxjine");
		String wxyuanyin = request.getParameter("wxyuanyin");
		String bxren = request.getParameter("bxren");
		String bxdate = request.getParameter("bxdate");
		String wxneirong = request.getParameter("wxneirong");
		String wxren = request.getParameter("wxren");
		String wxdate = request.getParameter("wxdate");
		String yanshoujilu = request.getParameter("yanshoujilu");
		String ysren = request.getParameter("ysren");
		String ysdate = request.getParameter("ysdate");
		String beizhu = request.getParameter("beizhu");
		double wxje = 0 ;
		if(wxjine != null && !wxjine.equals("")){
			wxje = Double.valueOf(wxjine);;
		}
		if(wxdate.equals("")){
			wxdate ="0000-00-00 00:00:00";
		}
		if(ysdate.equals("")){
			ysdate ="0000-00-00 00:00:00";
		}
		
		String sql = "insert into weixiu(sbid,wxzhuangtai,wxleixing,wxkeshi,wxjine,wxyuanyin,bxren,bxdate,wxneirong,wxren,wxdate,yanshoujilu,ysren,ysdate,beizhu) "
				+ "values('"+sbid+"','"+wxzhuangtai+"','"+wxleixing+"','"+wxkeshi+"',"+wxje+",'"+wxyuanyin+"','"+bxren+"','"+bxdate+"','"+wxneirong+"','"+wxren+"','"+wxdate+"','"+yanshoujilu+"','"+ysren+"','"+ysdate+"','"+beizhu+"')";
		System.out.println(sql);
		Connection conn = DBPool.getInstance().getConnection();
		Statement stmt = null;
		int result = 0;
		try {
			stmt = conn.createStatement();
			 result = stmt.executeUpdate(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		PrintWriter out = response.getWriter();
		out.print(result);
		out.close();
	}

}
